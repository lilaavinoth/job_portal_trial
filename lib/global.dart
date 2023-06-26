class MySingleton {
  static final MySingleton _singleton = MySingleton._internal();

  String _uid = '';

  factory MySingleton() {
    return _singleton;
  }

  MySingleton._internal();

  String get uid => _uid;

  void set uid(String newValue) {
    _uid = newValue;
  }
}