import 'package:aplikasi_3/api/mock_fooderlich_service.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_3/components/components.dart';

class ExploreScreen extends StatelessWidget {
  final mockServic = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return ListView(scrollDirection: Axis.vertical, children: [
          TodayRecipeListView(recipes: snapshot.data.todayRecipes),
          const SizedBox(height: 16),
          FriendPostListView(posts: snapshot.data?.friendPosts),
        ],);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
