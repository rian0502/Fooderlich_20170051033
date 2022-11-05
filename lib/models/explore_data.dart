import 'models.dart';

class ExploreData {
  final List<ExploreRecipe>? todayRecipes;
  final List<Post>? friendPosts;
  final List<SimpleRecipe>? simpleRecipes;

  ExploreData(this.todayRecipes, this.friendPosts, this.simpleRecipes);
}
