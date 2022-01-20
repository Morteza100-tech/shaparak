import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import './home_page_screen.dart';
import 'favorites_screen.dart';
//import '../screen/newest.dart';
import 'settingsScreen.dart';
//import './info_screen.dart';
//import '../widget/main_drawer.dart';
//import '../provider/theme.dart';
//import 'package:provider/provider.dart';

enum FilterOptions {
  About,
  Contact,
}

class TabBarScreen extends StatefulWidget {
  TabBarScreen();
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  List<Widget> _pages = [
    Favorites(),
    HomePage(),
    SettingsScreen(),
    // Favorites(),
  ];

  int _selectedPageIndex = 1;
  // @override
  // // void initState() {
  // //   _pages =
  // //   super.initState();
  // // }
//شاپـــــــرکــ'
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void infoModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                      // width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image(
                        image: AssetImage('assets/images/logosplash.png'),
                      )),
                  Text(
                    'شاپرک را به منظور ترویج فرهنگ پسندیده مطالعه و کتابخوانی بین کودکان و نوجوانان ساخته ایم. باشد تا نسل جدید مان که آینده سازان واقعی این مرز و بوم هستند با ورق زدن صفحات کتاب فصل های جدید پیشرفت و ترقی را برای کشور عزیزمان رقم بزنند!',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Theme.of(context).canvasColor,
          color: Theme.of(context).primaryColor,
          buttonBackgroundColor: Theme.of(context).primaryColor,
          height: 50,
          onTap: _selectPage,
          //animationDuration: Duration(milliseconds: 400),
          //animationCurve: Curves.bounceInOut,
          index: 1,
          items: [
            Icon(
              Icons.favorite,
              size: 20,
              color: Colors.white,
            ),
            Icon(
              Icons.category,
              size: 20,
              color: Colors.white,
            ),
            Icon(
              Icons.settings,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: GestureDetector(
            onTap: () {
              infoModal(context);
            },
            child: Text(
              'شاپـــــــرکــ',
              style: TextStyle(
                fontFamily: 'Lalezar',
                fontSize: 34,
              ),
            ),
          ),
          // actions: [
          //   IconButton(
          //     icon: Icon(
          //       Icons.info_outline,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {
          //       infoModal(context);
          //     },
          //   ),
          // ],
        ),
        //drawer: MainDrawer(),
        body: _pages[_selectedPageIndex],
      ),
    );
  }
}
