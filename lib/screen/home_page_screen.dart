import 'package:flutter/material.dart';

//import '../model/constants.dart';
import '../widget/Categories.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      // body:child: Categories(), Container(
      //   height: MediaQuery.of(context).size.height,
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       colors: [
      //         gradientStartColor,
      //         Colors.white,
      //       ],
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //       stops: [0.3, 0.7],
      //     ),
      //   ),
        
      body: Categories(),
    );
  }
}
