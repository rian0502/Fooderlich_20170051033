import 'package:flutter/material.dart';
import 'package:aplikasi_3/sqlite/database_helper.dart';
import '../models/models.dart';

class FavoriteScreen extends StatefulWidget {
  int? currentTab = 0;
  FavoriteScreen({Key? key, this.currentTab}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<SimpleRecipe> recipes = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _getAllRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorite Recipes",
        ),
        // automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          SimpleRecipe recipe = recipes[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(recipe.dishImage.toString(),
                              fit: BoxFit.cover)),
                      Positioned(
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () {
                                DatabaseHelper.db.deleteResep(recipe.id.toString());
                                setState(() {
                                  _getAllRecipes();
                                });
                              },
                              icon:
                                  const Icon(Icons.favorite, color: Colors.red),
                            ),
                          ))
                    ]),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe.title.toString(),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              recipe.duration.toString(),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _getAllRecipes() async {
    final dbClient = await DatabaseHelper.db.getAllResep();
    setState(() {
      recipes = dbClient;
    });
  }
}
