class Keypad {
  int _row;
  int _column;

  Keypad({
    int row = -1,
    int column = -1,
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

  void reset() {
    this._row = -1;
    this._column = -1;
  }

  bool validateInput() {
    if (this._row < 5 && this._column < 5)
      return true;
    else
      return false;
  }
}
