class Item {
  String _name;
  double _price;
  int _quantity;

  Item({
    String name = '',
    double price = 0.0,
    int quantity = 0,
  })  : _name = name,
        _price = price,
        _quantity = quantity;

  void setName(String name) {
    _name = name;
  }

  String get getName {
    return _name;
  }

  void setPrice(double price) {
    _price = price;
  }

  double get getPrice {
    return _price;
  }

  void add() {
    ++_quantity;
  }

  void subtract() {
    if (_quantity > 0) --_quantity;
  }

  int get getQuantity {
    return _quantity;
  }
}
