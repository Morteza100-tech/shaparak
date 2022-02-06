import 'package:flutter/material.dart';
import '../screen/item_detail_screen.dart';
import 'package:provider/provider.dart';
import '../provider/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryItem extends StatefulWidget {
  ValueKey key;
  CategoryItem(this.key) : super(key: key);
  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  SharedPreferences pref;
  List<String> favs = [];
  getPref() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      favs = pref.getStringList('favorited') ?? [];
    });
  }

  @override
  void didChangeDependencies() {
    getPref();
    super.didChangeDependencies();
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Item>(context, listen: false);
    bool isFav = favs.any((element) => element == item.id);

    String label = '';
    if (item.isChildish && item.isJuveline) {
      label = 'برای همه سنین';
    } else if (item.isChildish) {
      label = 'برای کودکان';
    } else if (item.isJuveline) {
      label = 'برای نوجوانان';
    }

    if (isFav && item.isFavorite == false) {
      item.toggleFavoriteStatus();
      // favs.removeWhere((element) => element == item.id);
    }
    //print('Rebuild!');
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ItemDetailScreen.routeName,
          arguments: item.id,
        );
      },
      //splashColor: Colors.grey,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 8,
          margin: EdgeInsets.all(20),
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.33,
                child: Stack(
                  children: [
                    Hero(
                      tag: item.id,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: FadeInImage(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.33,
                            placeholder: AssetImage(
                                'assets/images/products-placeholder.png'),
                            image: NetworkImage(item.imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).primaryColor.withOpacity(.9),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0, 0.9],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 15,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Lalezar',
                      ),
                      textAlign: TextAlign.right,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.create,
                            color: Colors.white,
                          ),
                          Text(
                            item.author,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Samim',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 20,
                right: 10,
                child: Consumer<Item>(
                  builder: (ctx, item, child) => InkWell(
                    onTap: () async {
                      // SharedPreferences pref =
                      //     await SharedPreferences.getInstance();
                      //setState(() {});
                      List<String> favoritedItems = [];
                      favoritedItems
                          .addAll(pref.getStringList('favorited') ?? []);
                      if (isFav == true) {
                        // pref.setStringList(
                        //     'favorited', [...favoritedItems, item.id]);
                        //setState(() {});
                        favoritedItems
                            .removeWhere((element) => element == item.id);
                        pref.setStringList('favorited', [...favoritedItems]);
                      } else {
                        // if (item.isFavorite) {
                        pref.setStringList(
                            'favorited', [...favoritedItems, item.id]);
                        print("item.id: ${item.id}");
                      }
                      item.toggleFavoriteStatus();
                      // }
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Icon(
                          item.isFavorite

                              // favs.any((element) => element == item.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  height: 30,
                  width: 80,
                  color: Colors.redAccent,
                  child: Align(
                    alignment: Alignment.center,
                                      child: Text(
                      label,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'Lalezar',
                      ),
                      //textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//   Widget ageRange(item) {
//     String label = '';
//     if (item.isChildish && item.isJuveline) {
//       label = 'برای همه سنین';
//     } else if (item.isChildish) {
//       label = 'برای کودکان';
//     } else if (item.isJuveline) {
//       label = 'برای نوجوانان';
//     }
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 2),
//       width: 80,
//       color: Colors.red,
//       child: Expanded(
//         child: Text(
//           label,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 10,
//             fontFamily: 'Lalezar',
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }
