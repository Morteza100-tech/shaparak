import 'package:flutter/material.dart';
import '../provider/theme.dart';
import 'package:provider/provider.dart';
//import '../provider/fontSize.dart';
//import '../provider/themeColors.dart';
//import '../provider/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings_screen';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _currentSliderValue = 20.0;

  // Color _currentThemeColor;
  getPrefs() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _currentSliderValue = pref.getDouble('fontSize') ?? 20.0;
    });
  }

  @override
  void initState() {
    getPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var brightness = MediaQuery.of(context).platformBrightness;
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    //ChangeFontSize _changeFontSize = Provider.of<ChangeFontSize>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          child: ListView(
            children: [
              Card(
                elevation: 4,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ListTile(
                    leading: Icon(
                      Icons.brightness_3,
                    ),
                    title: Text('حالت تیره',
                        //style: Theme.of(context).textTheme.body1,
                        ),
                    onTap: () async {
                      // SharedPreferences pref =
                      //     await SharedPreferences.getInstance();
                      // if (_themeChanger.themeType == ThemeType.Light) {
                      //   pref.setString('themeMode', 'Light');
                      //   //_themeChanger.toggleTheme();
                      // } else if (_themeChanger.themeType == ThemeType.Dark) {
                      //   pref.setString('themeMode', 'Dark');
                      // }
                      _themeChanger.toggleTheme();
                      //print(pref.getString('themeMode'));
                    },
                  ),
                ),
              ),
              Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 15,
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //padding: EdgeInsets.only(right: 25, top: 13),
                        child: Text('اندازه متن'),
                      ),
                      Slider(
                        value: _currentSliderValue,
                        min: 0,
                        max: 40,
                        divisions: 40,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (value) async {
                          print("font size $value");
                          // _changeFontSize.setFontSize(value);
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          pref.setDouble('fontSize', value);
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        //padding: EdgeInsets.symmetric(
                        //   vertical: 10,
                        //   horizontal: 12,
                        // ),
                        child: Text('رنگ تم'),
                      ),
                      Container(
                        //padding: EdgeInsets.only(right: 15, left: 15, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            colorCircle(
                              Color(0xFFffcd3c),
                              _themeChanger,
                            ),
                            colorCircle(
                              Color(0xFFbe5683),
                              _themeChanger,
                            ),
                            colorCircle(
                              Color(0xFFff6150),
                              _themeChanger,
                            ),
                            colorCircle(
                              Color(0xFF1ac0c6),
                              _themeChanger,
                            ),
                            colorCircle(
                              Color(0xFF58b368),
                              _themeChanger,
                            ),
                            colorCircle(
                              Color(0xFF00537e),
                              _themeChanger,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget colorCircle(
    Color color,
    ThemeChanger _themeChanger,
  ) {
    return InkWell(
      onTap: () async {
        _themeChanger.changeThemeColor(color);
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setInt('themeColor', color.value);
        print(pref.get('themeColor'));
        // setState(() {
        // _currentThemeColor = color;
        // });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
