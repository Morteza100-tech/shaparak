import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/items.dart';
import '../widget/categoryItem.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favorites extends StatefulWidget {
  static const routeName = '/Favorites';

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  SharedPreferences pref;
  List<String> favoriteItemsId = [];

  getPref() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      favoriteItemsId = pref.getStringList('favorited') ?? [];
      print("/////////////////////ssssssssssssdddddddddddddsssssssgffgg"+pref.getStringList('favorited').toString());
    });
  }

  @override
  initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteItems = Provider.of<Items>(context).items;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     'علاقمندی ها',
        //     style: Theme.of(context).textTheme.title,
        //   ),
        //   centerTitle: true,
        // ),
        body: favoriteItemsId.isEmpty
            ? Center(
                child: Text('علاقمندی ها'),
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  bool fav = favoriteItemsId
                      .any((element) => element == favoriteItems[index].id);
                  return fav
                      ? ChangeNotifierProvider.value(
                          value: favoriteItems[index],
                          // create: (c) => categoryItems[index],
                          child: CategoryItem(
                           ValueKey(favoriteItems[index].id),
                              // id: categoryItems[index].id,
                              // title: categoryItems[index].title,
                              // image: categoryItems[index].imagePath,
                              // isChildish: categoryItems[index].isChildish,
                              // isJuveline: categoryItems[index].isJuveline,
                              ),
                        )
                      : Container();
                },
                itemCount: favoriteItems.length,
              ),
      ),
    );
  }
}
