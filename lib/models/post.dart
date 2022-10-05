class Post {
  String? profileImageUrl;
  String? comment;
  String? foodPictureUrl;
  String? timestamp;
  Post(
      {this.profileImageUrl,
      this.comment,
      this.foodPictureUrl,
      this.timestamp});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        profileImageUrl: json['profileImageUrl'],
        comment: json['comment'],
        foodPictureUrl: json['foodPictureUrl'],
        timestamp: json['timestamp']);
  }
}
