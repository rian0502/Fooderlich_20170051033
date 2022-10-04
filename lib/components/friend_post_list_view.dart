import 'package:flutter/material.dart';

import '../models/post.dart';
import 'friend_post_tile.dart';


class FriendPostListView extends StatelessWidget {
  final List<Post> posts;
  const FriendPostListView({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 16, right: 16, top: 0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Social Chefs 👩‍🍳',
            style: Theme.of(context).textTheme.headline1),
        const SizedBox(height: 16),
        ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
          final post = posts[index];
          return FriendPostTile(post: post);},
          separatorBuilder: (context, index) {
              return const SizedBox(height: 16);},
          itemCount: posts.length,),
        const SizedBox(height: 16),
      ],
    ),);
    );
  }
}