import 'package:aplikasi_3/fooderlich_theme.dart';
import 'package:aplikasi_3/home.dart';
import 'package:aplikasi_3/inheritanced_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/grocery_manager.dart';
import 'models/models.dart';
import 'models/tab_manager.dart';


void main() {
  runApp(MyInheritancedWidget(child: const Fooderlich(), isFavorit: false));
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fooderlich',
      theme: theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager()),
          ChangeNotifierProvider(create: (context) => GroceryManager()),
        ],
        child: const Home(),
      ),
    );
  }
}
