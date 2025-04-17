import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    // To skip the invalid item in the navigation bar
    if (index != 2) {
      _currentIndex = index;
    }
    notifyListeners();
  }
}
