class Post{
  String profileImageUri;
  String comment;
  String foodImageUri;
  String timestamp;

  Post({required this.profileImageUri,required this.comment,required this.foodImageUri,required this.timestamp});

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      profileImageUri: json['profileImageUri'],
      comment: json['comment'],
      foodImageUri: json['foodImageUri'],
      timestamp: json['timestamp']
    );
  }
}