import 'package:flutter/cupertino.dart';

class DarkModeService extends ChangeNotifier {
  bool _darkMode = false;

  bool get darkMode => _darkMode;

  set darkMode(bool value) {
    _darkMode = value;
    notifyListeners();
  }
}
