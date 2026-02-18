import 'package:flutter/material.dart';

class ModeProvider with ChangeNotifier {
  bool _lightModeEnabled = true;

  bool get lightModeEnabled => _lightModeEnabled;

  set lightModeEnabled(bool value) {
    _lightModeEnabled = value;
  }

  changeMode() {
    if (_lightModeEnabled == true) {
      _lightModeEnabled = false;
      notifyListeners();
    }
    else if (_lightModeEnabled == false) {
      _lightModeEnabled = true;
            notifyListeners();
    }
  }
}
