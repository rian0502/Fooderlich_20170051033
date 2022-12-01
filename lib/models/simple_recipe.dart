class SimpleRecipe {
  int? id;
  String? dishImage;
  String? title;
  String? duration;
  String? source;
  List<String>? information;

  SimpleRecipe(
      this.dishImage, this.title, this.duration, this.source, this.information);

  SimpleRecipe.fromJson(Map<String, dynamic> json) {
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

  SimpleRecipe.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.dishImage = map['dishImage'];
    this.title = map['title'];
    this.duration = map['duration'];
    this.source = map['source'];
    this.information = map['information'];
  }
}
