import 'package:flutter/material.dart';
import './themeColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeType {
  Light,
  Dark,
}

class ThemeChanger with ChangeNotifier {
  SharedPreferences pref;
  String themeMode = "light";
  // Color selectedColor = "";
  //ThemeData defaultTheme = defaultTheme;
  getPref() async {
    pref = await SharedPreferences.getInstance();
    themeMode = pref.getString("themeMode") ?? 'light';
    // selectedColor = pref.getString('themeColor') as Color;
  }

  ThemeData currentTheme = defaultTheme;
  ThemeType _themeType = ThemeType.Light;
  ThemeData get getCurrentTheme {
    getPref();
    if (pref.getString("themeMode") == "dark") {
      return darkTheme;
    } else {
      return defaultTheme;
    }
  }

  ThemeType get themeType {
    return _themeType;
  }

  void toggleTheme() {
    getPref();
    print(themeMode);
    if (_themeType == ThemeType.Light) {
      pref.setString("themeMode", "dark");
      currentTheme = darkTheme;
      _themeType = ThemeType.Dark;
      //return notifyListeners();
      notifyListeners();
    } else if (_themeType == ThemeType.Dark) {
      pref.setString("themeMode", "light");
      currentTheme = defaultTheme;
      _themeType = ThemeType.Light;
      notifyListeners();
    }
  }

  void changeThemeColor(Color selectedColor) {
    // print("Ali Azad");
    if (_themeType == ThemeType.Light) {
      // print("Ali Azad light");
      currentTheme = defaultTheme.copyWith(
        primaryColor: selectedColor,
      );
      notifyListeners();
    }
    if (_themeType == ThemeType.Dark) {
      //print("Ali Azad dark");
      currentTheme = darkTheme.copyWith(
        primaryColor: selectedColor,
      );
      notifyListeners();
    }
  }
}
