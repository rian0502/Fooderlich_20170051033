import 'package:aplikasi_3/components/circle_image.dart';
import 'package:aplikasi_3/models/models.dart';
import 'package:flutter/material.dart';

class FriendPostTile extends StatelessWidget {
  final Post post;
  const FriendPostTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleImage(
          imageRadius: 20,
          imageProvider: AssetImage(post.profileImageUri.toString()),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.comment.toString()),
            Text(
              '${post.timestamp} mins ago',
              style: Theme.of(context).textTheme.bodyText1,
            )
          ],
        ))
      ],
    );
  }
}
