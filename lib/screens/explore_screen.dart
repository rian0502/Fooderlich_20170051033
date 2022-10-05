import 'package:aplikasi_3/api/mock_fooderlich_service.dart';
import 'package:aplikasi_3/models/explore_data.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_3/components/components.dart';

class ExploreScreen extends StatelessWidget {
  final mockServic = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockServic.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final exploreData = snapshot.data;
            return ListView(
              children: [
                TodayRecipeListView(recipes: exploreData!.todayRecipes!),
                const SizedBox(height: 16),
                FriendPostListView(friendPosts: exploreData.friendPosts!),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
