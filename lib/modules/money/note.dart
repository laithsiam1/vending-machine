import './moneySlot.dart';

class Note extends MoneySlot {
  Note({double amount = 0.0}) : super(amount: amount);

  @override
  bool validate() {
    // super.validate();
    // validate note

    return true;
  }
}
