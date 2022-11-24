import 'dart:convert';

Recipe recipeFromJson(String str) => Recipe.fromJson(json.decode(str));

String recipeToJson(Recipe data) => json.encode(data.toJson());

class Recipe {
  Recipe({
    this.text,
    this.parsed,
    this.hints,
  });

  String? text;
  List<dynamic>? parsed;
  List<Hint>? hints;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    text: json["text"],
    parsed: List<dynamic>.from(json["parsed"].map((x) => x)),
    hints: List<Hint>.from(json["hints"].map((x) => Hint.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "parsed": List<dynamic>.from(parsed!.map((x) => x)),
    "hints": List<dynamic>.from(hints!.map((x) => x.toJson())),
  };
}

class Hint {
  Hint({
    this.food,
  });

  Food? food;

  factory Hint.fromJson(Map<String, dynamic> json) => Hint(
    food: Food.fromJson(json["food"]),
  );

  Map<String, dynamic> toJson() => {
    "food": food!.toJson(),
  };
}

class Food {
  Food({
    this.foodId,
    this.label,
    this.knownAs,
    this.nutrients,
    this.brand,
    this.category,
    this.categoryLabel,
    this.foodContentsLabel,
    this.servingSizes,
  });

  String? foodId;
  String? label;
  String? knownAs;
  Nutrients? nutrients;
  String? brand;
  String? category;
  String? categoryLabel;
  String? foodContentsLabel;
  List<ServingSize>? servingSizes;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    foodId: json["foodId"],
    label: json["label"],
    knownAs: json["knownAs"],
    nutrients: Nutrients.fromJson(json["nutrients"]),
    brand: json["brand"],
    category: json["category"],
    categoryLabel: json["categoryLabel"],
    foodContentsLabel: json["foodContentsLabel"],
    servingSizes: List<ServingSize>.from(json["servingSizes"].map((x) => ServingSize.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "foodId": foodId,
    "label": label,
    "knownAs": knownAs,
    "nutrients": nutrients!.toJson(),
    "brand": brand,
    "category": category,
    "categoryLabel": categoryLabel,
    "foodContentsLabel": foodContentsLabel,
    "servingSizes": List<dynamic>.from(servingSizes!.map((x) => x.toJson())),
  };
}

class Nutrients {
  Nutrients({
    this.enercKcal,
    this.procnt,
    this.fat,
    this.chocdf,
    this.fibtg,
  });

  int? enercKcal;
  double? procnt;
  double? fat;
  double? chocdf;
  int? fibtg;

  factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients(
    enercKcal: json["ENERC_KCAL"],
    procnt: json["PROCNT"].toDouble(),
    fat: json["FAT"].toDouble(),
    chocdf: json["CHOCDF"].toDouble(),
    fibtg: json["FIBTG"],
  );

  Map<String, dynamic> toJson() => {
    "ENERC_KCAL": enercKcal,
    "PROCNT": procnt,
    "FAT": fat,
    "CHOCDF": chocdf,
    "FIBTG": fibtg,
  };
}

class ServingSize {
  ServingSize({
    this.uri,
    this.label,
    this.quantity,
  });

  String? uri;
  String? label;
  int? quantity;

  factory ServingSize.fromJson(Map<String, dynamic> json) => ServingSize(
    uri: json["uri"],
    label: json["label"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "label": label,
    "quantity": quantity,
  };
}
