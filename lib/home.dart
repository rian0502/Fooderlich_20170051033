import 'package:aplikasi_3/models/explore_recipe.dart';
import 'package:aplikasi_3/screens/explore_screen.dart';
import 'package:aplikasi_3/screens/recipes_screen.dart';
import 'package:flutter/material.dart';

import 'components/components.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    Card3(
        recipe: ExploreRecipe(
            title: 'Vegan Trends',
            tags: [
              'Healthy',
              'Vegan',
              'Carrots',
              'Greens',
              'Wheat',
              'Pescetarian',
              'Mint',
              'Lemongrass',
              'Salad',
              'Water'
            ],
            backgroundImage: 'assets/magazine_pics/mag3.png',
            calories: 10)),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fooderlich', style: Theme.of(context).textTheme.headline6),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'To Buy',
          ),
        ],
      ),
    );
  }
}
