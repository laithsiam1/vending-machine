import 'package:vending_machine/enums/slotType.dart';
import 'package:vending_machine/modules/money/card.dart';
import 'package:vending_machine/modules/money/coin.dart';
import 'package:vending_machine/modules/money/note.dart';

class MoneySlot {
  double _amount;

  MoneySlot({double amount = 0.0}) : _amount = amount;

  factory MoneySlot.getMonySlot(SlotType type) {
    switch (type) {
      case SlotType.Card:
        return Card();
      case SlotType.Coin:
        return Coin();
      case SlotType.Note:
        return Note();
    }
  }

  void setAmount(double ammount) {
    // set ammount
  }

  double get getAmount {
    return _amount;
  }

  bool validate() {
    // validate currency is USD

    return true;
  }
}
