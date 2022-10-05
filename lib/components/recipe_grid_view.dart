import 'package:aplikasi_3/components/recipe_thumbnail.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class RecipeGridView extends StatelessWidget {
  final List<SimpleRecipe> recipes;

  const RecipeGridView({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
    child: GridView.builder(
    itemCount: recipes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1),
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return RecipeThumbnail(recipe: recipe);
        }
        )
    );
  }
}
