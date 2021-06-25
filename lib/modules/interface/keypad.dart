class Keypad {
  int _row;
  int _column;

  Keypad({
    int row = 0,
    int column = 0,
  })  : _row = row,
        _column = column;

  void setRow(int row) {
    _row = row;
  }

  int get getRow {
    return _row;
  }

  void setColumn(int column) {
    _column = column;
  }

  int get getColumn {
    return _column;
  }

  // bool validateInput() {
  //   //validates if the user input is within the supported range
  //   return true;
  // }
}
