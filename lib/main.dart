import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vending_machine/enums/slotType.dart';
import 'package:vending_machine/modules/item.dart';
import 'package:vending_machine/modules/money/moneySlot.dart';
import 'package:vending_machine/modules/vendingMachine.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vending Machine',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SnackMachine(title: 'Snack Machine'),
    );
  }
}

class SnackMachine extends StatefulWidget {
  final String title;

  SnackMachine({Key? key, required this.title}) : super(key: key);

  @override
  _SnacksMachineState createState() => _SnacksMachineState();
}

class _SnacksMachineState extends State<SnackMachine> with VendingMachine {
  final int rows = 5;
  final int columns = 5;

  Item selectedItem = Item(name: '-1');
  List<List<Item>> items = [[]];
  Map<double, int> availableMoney = {
    50.0: 0,
    20.0: 0,
    1.0: 0,
    0.5: 0,
    0.2: 0,
    0.1: 0,
  };

  @override
  void initState() {
    super.initState();

    initState();
  }

  void initialize() {
    initializeAvailableItems();
    initializeAvailableMoney();
  }

  void initializeAvailableItems() {
    for (int r = 0; r < rows; r++)
      for (int c = 0; c < columns; c++)
        items[r][c] = Item(
          name: 'item $r $c',
          price: randomNumber,
          quantity: 15,
        );
  }

  void initializeAvailableMoney() {
    availableMoney.updateAll((key, value) => 8);
  }

  double get randomNumber {
    Random random = Random();
    return random.nextDouble() * 100;
  }

  double totalAvailableBalance() {
    double total = 0.0;

    availableMoney.forEach((key, value) {
      total += key * value;
    });

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Vending Machine'),
      ),
    );
  }

  @override
  void typeOnKeypad(int row, int column) {
    keypad.setRow(row);
    keypad.setColumn(column);

    selectedItem = items[row][column];

    // in case there is no enough quantity of this item
    if (selectedItem.getQuantity <= 0) {
      showOnDisplay('item sold out');

      return;
    }

    // if: the user inserted money before typing on the keypad.
    if (insertedBalance > 0) {
      if (insertedBalance >= selectedItem.getPrice) {
        // sell item and pay back
        sellItem();
      } else {
        showOnDisplay(
            'insert another ${selectedItem.getPrice - insertedBalance}');
      }
    }
    //else: show the selected item price.
    else {
      showOnDisplay('${selectedItem.getName} price: ${selectedItem.getPrice}');
    }
  }

  void sellItem() {
    List<double> change = [];

    // if the inserted balance is more than item price.
    if (insertedBalance > selectedItem.getPrice) {
      double remaining = insertedBalance - selectedItem.getPrice;

      if (totalAvailableBalance() < remaining) {
        showOnDisplay('no suffecient change');

        refund(remaining);
        return;
      }

      change = calculateChange(remaining);

      if (change.isEmpty) {
        showOnDisplay('no suffecient change');
        return;
      }

      // subtract change from available money
      change.forEach((element) {
        availableMoney.update(element, (value) => --value);
      });
    }

    // subtract from the selected item quantity in two cases
    // 1- the inserted balance is equal to item price. (no change is required).
    // 2- if you have enough change to give it back to user.
    selectedItem.subtract();
  }

  List<double> calculateChange(double remaining) {
    List<double> change = [];

    for (var item in availableMoney.entries) {
      int currentTypeAmount = item.value;
      int requiredAmount = remaining ~/ item.key;

      while (currentTypeAmount > 0 && requiredAmount > 0) {
        currentTypeAmount -= 1;
        requiredAmount -= 1;
        remaining -= item.key;
        change.add(item.key);
      }

      if (remaining == 0) return change;
    }

    return [];
  }

  @override
  void insertMoney(MoneySlot money) {
    String errorMessage = "";

    SlotType slotType = SlotType.values.singleWhere((element) =>
        element.toString().split('.')[1].toLowerCase() ==
        money.runtimeType.toString().toLowerCase());

    MoneySlot moneyslot = MoneySlot.getMonySlot(slotType);

    if (!moneyslot.validate()) {
      errorMessage =
          "The inserted amount is not supported, please try another amout";
      showOnDisplay(errorMessage);
    }

    insertedBalance += moneyslot.getAmount;

    switch (slotType) {
      case SlotType.Coin:
      case SlotType.Note:
        availableMoney.update(moneyslot.getAmount, (value) => ++value);
        break;
      default:
        break;
    }

    showOnDisplay('your balance: $insertedBalance');
  }

  @override
  List<double> refund(double remaining) {
    var change = calculateChange(remaining);

    change.forEach((element) {
      availableMoney.update(element, (value) => --value);
    });

    return change;
  }
}
