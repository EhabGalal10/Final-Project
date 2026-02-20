import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModeProvider with ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  set isDark(bool value) {
    _isDark = value;
  }

  changeMode() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDark = !_isDark;
    prefs.setBool('isDark', _isDark);
    notifyListeners();
  }
  getMode() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDark = prefs.getBool('isDark') ?? false;
    notifyListeners();
  }
}