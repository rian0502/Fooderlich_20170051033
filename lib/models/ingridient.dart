part of 'explore_recipe.dart';

class Ingredients {
  String imageUri;
  String title;
  String source;

  Ingredients({required this.imageUri, required this.title, required this.source});

  factory Ingredients.fromJson(Map<String, dynamic> json){
    return Ingredients(
        imageUri: json['imageUri'],
        title: json['title'],
        source: json['source']
    );
  }
}

