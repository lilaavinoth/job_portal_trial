import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  bool _joblistview = true;
  bool get jobListView => _joblistview;
  void changeJobListView(bool value) {
    _joblistview = value;
    notifyListeners();
  }
}

class ResumeSelectionProvider extends ChangeNotifier {
  int _selectedContainerIndex = -1;
  int get selectedCVContainerIndex => _selectedContainerIndex;
  void resumeSelectedContainer(int index) {
    _selectedContainerIndex = index;
    notifyListeners();
  }
}