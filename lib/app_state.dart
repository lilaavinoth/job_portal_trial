import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebaseModels/readFullJob.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<int> _emailBoxes = [0, 0];
  List<int> get emailBoxes => _emailBoxes;
  set emailBoxes(List<int> _value) {
    _emailBoxes = _value;
  }

  void addToEmailBoxes(int _value) {
    _emailBoxes.add(_value);
  }

  void removeFromEmailBoxes(int _value) {
    _emailBoxes.remove(_value);
  }

  void removeAtIndexFromEmailBoxes(int _index) {
    _emailBoxes.removeAt(_index);
  }

  void updateEmailBoxesAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _emailBoxes[_index] = updateFn(_emailBoxes[_index]);
  }

  String _HTMLpageDescription = '';
  String get HTMLpageDescription => _HTMLpageDescription;
  set HTMLpageDescription(String _value) {
    _HTMLpageDescription = _value;
  }

  int _selectedContainerIndex = -1;
  int get selectedContainerIndex => _selectedContainerIndex;
  void selectContainer(int index) {
    _selectedContainerIndex = index;
    notifyListeners();
  }

  fullJobModel jobObject = fullJobModel();
  fullJobModel get jobModelObject => jobObject;
  void loadRightJobModel(fullJobModel model) {
    jobObject = model;
    notifyListeners();
  }

  // bool _joblistview = true;
  // bool get jobListView => _joblistview;
  // void changeJobListView(bool value) {
  //   _joblistview = value;
  //   notifyListeners();
  // }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
