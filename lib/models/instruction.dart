part of 'explore_recipe.dart';


class Instruction {
  String imageUri;
  String description;
  int durationInMinutes;

  Instruction({required this.imageUri, required this.description, required this.durationInMinutes});

  factory Instruction.fromJson(Map<String, dynamic> json){
    return Instruction(
        imageUri: json['imageUri'],
        description: json['description'],
        durationInMinutes: json['durationInMinutes']
    );
  }
}