
import 'package:flutter/material.dart';

import 'components/bottom_navigation/card1.dart';
import 'components/bottom_navigation/card2.dart';
import 'components/bottom_navigation/card3.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;



  static List<Widget> pages = <Widget>[
    const Card1(),
    const Card2(),
    const Card3()
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
            icon: Icon(Icons.breakfast_dining),
            label: 'Roti',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Recipe',
          ),
        ],
      ),
    );
  }
}
