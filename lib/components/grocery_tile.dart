import 'package:aplikasi_3/models/grocery_item.dart';
import 'package:flutter/material.dart';

class GroceryTile extends StatelessWidget {
  final GroceryItem? item;
  final Function(bool)? onComplete;
  final TextDecoration? textDecoration;

  GroceryTile({
    Key? key,
    this.item,
    this.onComplete}) :
        textDecoration =
        item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: Colors.red,
    );
  }
}
