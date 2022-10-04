
class SimpleRecipe{
  String dishImage;
  String title;
  String duration;
  List<String> information;
  
  SimpleRecipe({required this.dishImage, required this.title, required this.duration, required this.information});

  factory SimpleRecipe.fromJson(Map<String, dynamic> json){
    return SimpleRecipe(
      dishImage: json['dishImage'],
      title: json['title'],
      duration: json['duration'],
      information: json['information'].cast<String>()
    );
  }
}