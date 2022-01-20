import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newStyle/provider/theme.dart';
import './screen/category_items_screen.dart';
import './screen/tabBar_screen.dart';
import './screen/item_detail_screen.dart';
import 'package:animated_splash/animated_splash.dart';
import 'package:provider/provider.dart';
import './provider/items.dart';
import './screen/settingsScreen.dart';
//import './provider/fontSize.dart';
import './screen/favorites_screen.dart';
//import './provider/items.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Items(),
        ),
        ChangeNotifierProvider<ThemeChanger>(
          create: (_) => ThemeChanger(),
        ),
        // ChangeNotifierProvider<ChangeFontSize>(
        //   create: (_) => ChangeFontSize(),
        // ),
      ],
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatefulWidget {
  @override
  _MaterialAppWithThemeState createState() => _MaterialAppWithThemeState();
}

class _MaterialAppWithThemeState extends State<MaterialAppWithTheme> {
  SharedPreferences pref;
  Color primaryColor;
  getPrefs() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      // primaryColor = pref.getString('themeColor') as Color;
      primaryColor = Color(pref.getInt('themeColor') ?? 0xFF00537e);
      // print("primaryColor ${pref.getInt('themeColor')}");
    });
  }

  @override
  void didChangeDependencies() {
    getPrefs();
    super.didChangeDependencies();
  }

  @override
  initState() {
    getPrefs();
    //Provider.of<Items>(context).fetchItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        title: 'ShaparakEdu',
        home: AnimatedSplash(
          imagePath: 'assets/images/logosplash.png',
          home: TabBarScreen(),
          duration: 2500,
          type: AnimatedSplashType.StaticDuration,
        ),
        theme: theme.getCurrentTheme.copyWith(
          primaryColor: primaryColor,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          //TabBarScreen.routeName: (ctx) => TabBarScreen(),
          CategoryItemsScreen.routeName: (ctx) => CategoryItemsScreen(),
          Favorites.routeName: (ctx) => Favorites(),
          ItemDetailScreen.routeName: (ctx) => ItemDetailScreen(),
          SettingsScreen.routeName: (ctx) => SettingsScreen(),
        },
      ),
    );
  }
}
