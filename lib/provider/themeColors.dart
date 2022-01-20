import 'package:flutter/material.dart';
//import './fontSize.dart';

Color chosenColor;
void choseColor(Color color) {
  chosenColor = color;
}

ThemeData defaultTheme = ThemeData(
  //primaryColor: Color(0xFFfff000),

  primaryColor: Color(0xFF00537e),
  //canvasColor: Color(0xFFffffff),
  textTheme: TextTheme(
    bodyText1: TextStyle(
       fontFamily: 'Samim',
//fontSize: ChangeFontSize.getFontSize(),
     ),
    
    subtitle1: TextStyle(
      fontFamily: 'Samim',
      color: Color(0xFFE4979E),
    ),
    headline1: TextStyle(color: Colors.white, fontFamily: 'Lalezar', fontSize: 25),
  ),
);



ThemeData darkTheme = ThemeData.dark().copyWith(
  //primaryColor: Color(0xFFfff000),
  //primaryColor: Color(0xFFad1457),
  //canvasColor: Colors.grey,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontFamily: 'Samim',
    ),
    subtitle1: TextStyle(
      fontFamily: 'Samim',
      color: Color(0xFFE4979E),
    ),
    headline1: TextStyle(color: Colors.white, fontFamily: 'Lalezar', fontSize: 25),
  ),
);
// ThemeData darkTheme = ThemeData.dark().copyWith(
//   //primaryColor: Color(0xFFfff000),
//   primaryColor: Color(0xFFad1457),
//   //canvasColor: Colors.grey,
//   textTheme: TextTheme(
//     body1: TextStyle(
//       fontFamily: 'Samim',
//     ),
//     subtitle: TextStyle(
//       fontFamily: 'Samim',
//       color: Color(0xFFE4979E),
//     ),
//     title: TextStyle(color: Colors.white, fontFamily: 'Lalezar', fontSize: 25),
//   ),
// );
