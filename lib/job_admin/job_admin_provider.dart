import 'package:flutter/material.dart';

class JobAdminProvider extends ChangeNotifier {
  String _docPath = '';
  String get docPath => _docPath;
  void passDocPath(String value) {
    _docPath = value;
    notifyListeners();
  }
}