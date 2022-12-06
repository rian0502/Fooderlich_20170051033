import 'package:aplikasi_3/models/models.dart';
import 'package:flutter/material.dart';

import '../sqlite/database_helper.dart';

class RecipeThumbnail extends StatefulWidget {
  final SimpleRecipe recipe;
  const RecipeThumbnail({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeThumbnail> createState() => _RecipeThumbnailState();
}

class _RecipeThumbnailState extends State<RecipeThumbnail> {
  bool isFavorit = false;
  @override
  void initState() {
    DatabaseHelper.db.getAllid().then((value) {
      if(value.contains(widget.recipe.id)){
        setState(() {
          isFavorit = true;
        });
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network('${widget.recipe.dishImage}',
                        fit: BoxFit.cover)
                ),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                        onPressed: (){
                          setState(() {
                            isFavorit = !isFavorit;
                            if(isFavorit){
                              DatabaseHelper.db.addResep(widget.recipe);
                            }else{
                              DatabaseHelper.db.deleteResep(widget.recipe.id.toString());
                            }
                          });
                        },
                        icon: Icon(Icons.favorite, color: (isFavorit) ? Colors.red : Colors.grey,)),
                  ),
                )
              ]
          ),
          const SizedBox(height: 4),
          Text(widget.recipe.title.toString(),
              maxLines: 1, style: Theme.of(context).textTheme.bodyText1),
          Text(widget.recipe.duration.toString(),
              style: Theme.of(context).textTheme.bodyText1),
        ]
        )
    );
  }
}
