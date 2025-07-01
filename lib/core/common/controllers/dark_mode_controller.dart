import 'package:flutter/cupertino.dart';

class DarkModeController extends ChangeNotifier {
  bool isDark = false;
  changeToDark() {
    isDark = true;
    notifyListeners();
  }

  changeToLight() {
    isDark = false;
    notifyListeners();
  }
}
