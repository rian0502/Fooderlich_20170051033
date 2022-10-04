import 'package:aplikasi_3/fooderlich_theme.dart';
import 'package:aplikasi_3/components/author_card.dart';
import 'package:aplikasi_3/models/explore_recipe.dart';
import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card2({Key? key,required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: BoxDecoration(
          image:  DecorationImage(
            image: AssetImage(recipe.backgroundImage.toString()),
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
            AuthorCard(authorName: recipe.authorName, title: recipe.role.toString() , imageProvider: AssetImage(recipe.profileImage.toString())),
            Expanded(child: Stack(
              children: [
                Positioned(
                  child: Text(recipe.title.toString(), style: FooderlichTheme.lightTextTheme.headline1),
                  bottom: 16,
                  right: 16,
                ),

                Positioned(
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(recipe.subtitle.toString(), style: FooderlichTheme.lightTextTheme.headline1),
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
