import './moneySlot.dart';

class Coin extends MoneySlot {
  Coin({double amount = 0.0}) : super(amount: amount);

  @override
  bool validate() {
    // super.validate();
    // validate coin

    return true;
  }
}
