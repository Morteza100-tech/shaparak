import 'package:flutter/material.dart';
//import '../model/constants.dart';
import '../widget/categoryItem.dart';
import '../provider/items.dart';
import 'package:provider/provider.dart';

class CategoryItemsScreen extends StatefulWidget {
  static const routeName = '/CategoryItemsScreen';

  @override
  _CategoryItemsScreenState createState() => _CategoryItemsScreenState();
}

class _CategoryItemsScreenState extends State<CategoryItemsScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Items>(context).fetchItems().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final categoryData = Provider.of<Items>(context);
    //final theme = Provider.of<ThemeChanger>(context);
    final categoryItems = categoryData.items
        .where((item) {
          return item.category.contains(categoryId);
        })
        .toList()
        .reversed
        .toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //backgroundColor: gradientEndColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            categoryTitle,
           style: Theme.of(context).textTheme.headline1,
          ),
          centerTitle: true,
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                //color: Colors.white,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return ChangeNotifierProvider.value(
                      value: categoryItems[index],
                      // create: (c) => categoryItems[index],
                      child: CategoryItem(
                        ValueKey(categoryItems[index].id),
                        // id: categoryItems[index].id,
                        // title: categoryItems[index].title,
                        // image: categoryItems[index].imagePath,
                        // isChildish: categoryItems[index].isChildish,
                        // isJuveline: categoryItems[index].isJuveline,
                      ),
                    );
                  },
                  itemCount: categoryItems.length,
                ),
              ),
      ),
    );
  }
}
