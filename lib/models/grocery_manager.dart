import 'package:flutter/material.dart';
import 'grocery_item.dart';

class GroceryManager extends ChangeNotifier {
  final List _groceryItems = <GroceryItem>[];

  List <GroceryItem> get groceryItems => List.unmodifiable(_groceryItems);

  void add(GroceryItem item) {
    _groceryItems.add(item);
    notifyListeners();
  }

  void deleteItem(int index) {
    _groceryItems.removeAt(index);
    notifyListeners();
  }
  void updateItem(int index, GroceryItem item){
    _groceryItems[index] = item;
    notifyListeners();
  }
  void completeItem(int index, bool change){
    final item = _groceryItems[index];
    _groceryItems[index] = item.copyWith(complete: change);
    notifyListeners();
  }
}