import 'package:flutter/foundation.dart';

class Item with ChangeNotifier {
  final String title;
  final String author;
  final String imagePath;
  final String id;
  final String category;
  final String content;
  final bool isChildish;
  final bool isJuveline;
  bool isFavorite;
  Item({
    @required this.title,
    @required this.author,
    @required this.imagePath,
    @required this.id,
    @required this.category,
    @required this.content,
    @required this.isChildish,
    @required this.isJuveline,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
