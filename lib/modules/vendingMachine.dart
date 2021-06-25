import 'package:flutter/cupertino.dart';
import './interface/display.dart';
import './interface/keypad.dart';
import './money/moneySlot.dart';

mixin VendingMachine {
  @protected
  Keypad keypad = Keypad();
  @protected
  Display display = Display();

  @protected
  double insertedBalance = 0.0;
  @protected
  int currentRow = -1;
  @protected
  int currentColumn = -1;

  @protected
  void readKeypad() {
    //get the user input from the keypad and sets the current values
  }

  @protected
  void showOnDisplay(String message) {
    display.displayMessage(message: message);
  }

  void typeOnKeypad(int row, int column);

  void insertMoney(MoneySlot money);

  List<double> refund(double remaining);
}
