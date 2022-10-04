part 'ingridient.dart';
part 'instruction.dart';

class RecipeCardType{
  static const String card1 = 'card1';
  static const String card2 = 'card2';
  static const String card3 = 'card3';

}

class ExploreRecipe{
  String cardType;
  String title;
  String subtitle;
  String backgroundImage;
  String message;
  String authorName;
  String role;
  String profileImage;
  int durationInMinutes;
  String dietType;
  int calories;
  List<String> tags;
  String description;
  String source;
  List<Ingredients> ingredients;
  List<Instruction> instructions;

  ExploreRecipe({required this.cardType, required this.title, required this.subtitle, required this.backgroundImage, required this.message, required this.authorName, required this.role, required this.profileImage, required this.durationInMinutes, required this.dietType, required this.calories, required this.tags, required this.description, required this.source, required this.ingredients, required this.instructions});

  factory ExploreRecipe.fromJson(Map<String, dynamic> json){
    return ExploreRecipe(
        cardType: json['cardType'],
        title: json['title'],
        subtitle: json['subtitle'],
        backgroundImage: json['backgroundImage'],
        message: json['message'],
        authorName: json['authorName'],
        role: json['role'],
        profileImage: json['profileImage'],
        durationInMinutes: json['durationInMinutes'],
        dietType: json['dietType'],
        calories: json['calories'],
        tags: json['tags'].cast<String>(),
        description: json['description'],
        source: json['source'],
        ingredients: (json['ingredients'] as List).map((e) => Ingredients.fromJson(e)).toList(),
        instructions: (json['instructions'] as List).map((e) => Instruction.fromJson(e)).toList()
    );
  }
}