import 'package:aplikasi_3/fooderlich_theme.dart';
import 'package:aplikasi_3/inheritanced_widget.dart';
import 'package:flutter/material.dart';
import 'circle_image.dart';

class AuthorCard extends StatefulWidget {
  final String authorName;
  final String title;
  final ImageProvider imageProvider;
  const AuthorCard(
      {Key? key,
      required this.authorName,
      required this.title,
      required this.imageProvider})
      : super(key: key);

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Row(
            children: [
              CircleImage(
                imageProvider: widget.imageProvider,
                imageRadius: 28,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName,
                    style: FooderlichTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    widget.title,
                    style: FooderlichTheme.lightTextTheme.bodyText1,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              setState(() {
                SnackBar snackbar;
                if (MyInheritancedWidget.of(context).isFavorit) {
                  snackbar =
                      const SnackBar(content: Text('Menghapus dari favorit'));
                } else {
                  snackbar =
                      const SnackBar(content: Text('Menambahkan ke favorit'));
                }
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                MyInheritancedWidget.of(context).isFavorit =
                    !MyInheritancedWidget.of(context).isFavorit;
              });
            },
            color: Colors.grey[400],
            icon: Icon(
              Icons.favorite,
              color: (MyInheritancedWidget.of(context).isFavorit)
                  ? Colors.red
                  : Colors.grey,
            ),
            iconSize: 30,
          )
        ],
      ),
    );
  }
}
