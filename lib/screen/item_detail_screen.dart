import 'package:flutter/material.dart';
//import '../model/constants.dart';
//import '../data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/items.dart';
//import '../provider/fontSize.dart';

class ItemDetailScreen extends StatefulWidget {
  static const routeName = '/itemDetailScreen';

  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  double fontSize = 20.0;
  getPrefs() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      fontSize = pref.getDouble('fontSize');
    });
  }

  @override
  initState() {
    getPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final itemId = ModalRoute.of(context).settings.arguments as String;
    final selectedItem =
        Provider.of<Items>(context, listen: false).findById(itemId);

    //final selectedItem = items.firstWhere((item) => item.id == itemId);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).primaryColor,
        //   title: FittedBox(
        //     fit: BoxFit.fitWidth,
        //     child: Text(
        //       '${selectedItem.title}',
        //       style: Theme.of(context).textTheme.title,
        //     ),
        //   ),
        //   centerTitle: true,
        // ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).primaryColor,
              centerTitle: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.3,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  '${selectedItem.title}',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                background: Hero(
                  tag: selectedItem.id,
                  child:
                      Image.network(selectedItem.imagePath, fit: BoxFit.cover),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    '${selectedItem.content}',
                    //style: TextStyle(fontSize: fontSize),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: fontSize),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
