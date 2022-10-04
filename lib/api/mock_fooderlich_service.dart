import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:aplikasi_3/models/models.dart';

class MockFooderlichService{
  Future<ExploreData> getExploreData() async {
    final todayRecipes = await _getTodayRecipes();
    final friendPosts = await _getFriendPosts();
    return ExploreData(todayRecipes, friendPosts);
  }
   Future<List<ExploreRecipe>> _getTodayRecipes() async {
    await Future.delayed(const Duration(seconds: 1));
    final dataString = await _loadAsset('assets/sample_data/sample_explore_recipes.json');
    final Map<String, dynamic> json = jsonDecode(dataString);
    if (json['recipes'] != null) {
      final recipes = <ExploreRecipe>[];
      json['recipes'].forEach((recipe) {
        recipes.add(ExploreRecipe.fromJson(recipe));
      });
      return recipes;
    }else{
      return [];
    }
  }
  Future<List<Post>> _getFriendPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    final dataString = await _loadAsset('assets/sample_data/sample_friend_posts.json');
    final Map<String, dynamic> json = jsonDecode(dataString);
    if (json['feed'] != null) {
      final posts = <Post>[];
      json['feed'].forEach((post) {
        posts.add(Post.fromJson(post));
      });
      return posts;
    }else{
      return [];
    }
  }
  Future<List<SimpleRecipe>> getRecipes() async {
    await Future.delayed(const Duration(seconds: 1));
    final dataString = await _loadAsset('assets/sample_data/sample_recipes.json');
    final Map<String, dynamic> json = jsonDecode(dataString);
    if (json['recipes'] != null) {
      final recipes = <SimpleRecipe>[];
      json['recipes'].forEach((recipe) {
        recipes.add(SimpleRecipe.fromJson(recipe));
      });
      return recipes;
    }else{
      return [];
    }
  }
  Future<String> _loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }
}