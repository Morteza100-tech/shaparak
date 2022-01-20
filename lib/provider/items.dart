import 'package:flutter/material.dart';
import './item.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Items with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items {
    return [..._items];
  }

  Item findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> fetchItems() async {
    const url = 'https://shaparak-732ff.firebaseio.com/items.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Item> loadedItems = [];
      extractedData.forEach((itemId, itemData) {
        loadedItems.add(Item(
          id: itemId,
          title: itemData['title'],
          author: itemData['author'],
          category: itemData['category'],
          content: itemData['content'],
          imagePath: itemData['imagePath'],
          isChildish: itemData['isChildish'],
          isJuveline: itemData['isJuveline'],
          //isFavorite: itemData['isFavorite'],
        ));
      });

      _items = loadedItems;
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }

  // void addItem() {
  //   //_items.add(value);
  //   notifyListeners();
  // }
}
