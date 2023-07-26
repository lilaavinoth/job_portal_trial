class MySingleton {
  static final MySingleton _singleton = MySingleton._internal();

  String _uid = '';
  String _checkoutSessionID = "";

  
  factory MySingleton() {
    return _singleton;
  }

  MySingleton._internal();

  String get uid => _uid;
  String get checkoutSessionID => _checkoutSessionID;


  void set uid(String newValue) {
    _uid = newValue;
  }

  void set checkoutSessionID(String newValue) {
    _checkoutSessionID = newValue;
  }

}