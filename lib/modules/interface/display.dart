class Display {
  String _message;

  Display({String message = ''}) : _message = message;

  String getMessage() {
    return _message;
  }

  void setMessage(String message) {
    _message = message;
  }

  void displayMessage({String message = ''}) {
    //displays the provided message.

    // or displays the stored message if the provided one is empty.
  }
}
