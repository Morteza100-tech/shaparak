// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ChangeFontSize with ChangeNotifier {
//   SharedPreferences pref;
//   getPref() async {
//     pref = await SharedPreferences.getInstance();

//   }

//   double _fontSize = 20;
//   //ChangeFontSize(this._fontSize);

//    getFontSize() {
//     return _fontSize;
//   }

//   setFontSize(double newSize) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     pref.setDouble('fontSize', newSize);
//     _fontSize = newSize;
//     notifyListeners();
//   }
// }
