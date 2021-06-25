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
  void showOnDisplay(String message) {
    display.displayMessage(message: message);
  }

  @protected
  void readKeypad(int row, int column);

  @protected
  void insertMoney(MoneySlot money);

  @protected
  List<double> refund(double remaining);
}
