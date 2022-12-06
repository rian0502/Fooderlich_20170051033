class SimpleRecipe {
  String? id;
  String? dishImage;
  String? title;
  String? duration;
  String? source;
  List<String>? information;

  SimpleRecipe(
      this.id, this.dishImage, this.title, this.duration, this.source, this.information);

  SimpleRecipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dishImage = json['dishImage'];
    title = json['title'];
    duration = json['duration'];
    source = json['source'];
    information = json['information'].cast<String>();
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["dishImage"] = dishImage;
    map["title"] = title;
    map["duration"] = duration;
    map["source"] = source;
    map["information"] = information.toString();

    return map;
  }

 factory SimpleRecipe.fromMap(Map<String, dynamic> map) {
    return SimpleRecipe(
      map['id'],
      map['dishImage'],
      map['title'],
      map['duration'],
      map['source'],
      map['information'],
    );
  }
}
