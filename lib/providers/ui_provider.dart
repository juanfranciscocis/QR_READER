

import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier{

  int _selectedIndex = 1;

  UIProvider();

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners(); // notifyListeners() is used to notify the listeners that the state of the object has changed.
  }
}