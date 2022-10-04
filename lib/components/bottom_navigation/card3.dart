import 'package:aplikasi_3/models/explore_recipe.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_3/fooderlich_theme.dart';

class Card3 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card3({Key? key, required this.recipe}) : super(key: key);

  List<Widget> createTagChips() {
    final chips = <Widget>[];
    recipe.tags.take(5).forEach((element) {
      final chip = Chip(
        label: Text(element),
        labelStyle: FooderlichTheme.lightTextTheme.bodyText1,
        backgroundColor: Colors.grey[400],
        shape: StadiumBorder(
          side: BorderSide(color: Colors.grey[400]!),
        ),
      );
      chips.add(chip);
    });
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipe.backgroundImage.toString()),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0)))),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.book, color: Colors.white, size: 40,),
                  Text(recipe.title.toString(),style: FooderlichTheme.darkTextTheme.headline2,),
                  const SizedBox(height: 30,)
                ],
              ),
            ),
            Center(
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 12,
                children: createTagChips(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
