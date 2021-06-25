import './moneySlot.dart';

class Card extends MoneySlot {
  // ignore: unused_field
  String _cardNumber;
  // ignore: unused_field
  String _holderName;
  // ignore: unused_field
  String _binCode;

  Card({
    String cardNumber = '',
    String holderName = '',
    String binCode = '',
    double amount = 0.0,
  })  : _cardNumber = cardNumber,
        _holderName = holderName,
        _binCode = binCode,
        super(amount: amount);

  @override
  bool validate() {
    // super.validate();
    // validate credit card

    return true;
  }

  void charge(double amount) {
    // get money from card = item price.
  }
}
