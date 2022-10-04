import 'package:aplikasi_3/fooderlich_theme.dart';
import 'package:aplikasi_3/author_card.dart';
import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  const Card2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/mag5.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(0, 10),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          children: [
            const AuthorCard(authorName: 'Mike Katz', title: 'Smoothie Connoisseur', imageProvider: AssetImage('assets/author_katz.jpeg')),
            Expanded(child: Stack(
              children: [
                Positioned(
                  child: Text('Recipe', style: FooderlichTheme.lightTextTheme.headline1),
                  bottom: 16,
                  right: 16,
                ),

                Positioned(
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text('Smoothies', style: FooderlichTheme.lightTextTheme.headline1),
                  ),
                  bottom: 70,
                  left:16 ,
                ),

              ],
            ))
          ],
        ),
      ),
    );
  }
}
