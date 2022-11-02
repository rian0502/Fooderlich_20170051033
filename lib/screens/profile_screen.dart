import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/circle_image.dart';
import '../models/models.dart';


class ProfileScreen extends StatefulWidget {
  final User? user;
  final int? currentTab;

  static MaterialPage page(User user) {
    return MaterialPage(
      name: FooderlichPages.profilePath,
      key: ValueKey(FooderlichPages.profilePath),
      child: ProfileScreen(user: user),
    );
  }
  const ProfileScreen({Key? key, this.user, this.currentTab}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnProfile(false);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            buildProfile(),
            Expanded(child: buildMenu())
          ],
        ),
      ),
    );
  }
  Widget buildMenu() {
    return ListView(
      children: [
        buildDarkModeRow(),
        ListTile(
          title: const Text('View raywenderlich.com'),
          onTap: () {
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnRaywenderlich(true);
          },
        ),
        ListTile(
          title: const Text('Log out'),
          onTap: () {
            // 1
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnProfile(false);
            // 2
            Provider.of<AppStateManager>(context, listen: false).logout();
          },
        )
      ],
    );
  }
  Widget buildProfile() {
    return Column(
      children: [
        CircleImage(
          imageProvider: AssetImage(widget.user!.profileImageUrl),
          imageRadius: 80,
        ),
        const SizedBox(height: 16),
        Text(
          widget.user!.name!,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 8),
        Text(
          widget.user!.email!,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }

  Widget buildDarkModeRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Dark Mode'),
          Switch(
            value: widget.user!.darkMode,
            onChanged: (value) {
              Provider.of<ProfileManager>(context, listen: false).darkMode =
                  value;
            },
          )
        ],
      ),
    );
  }
}
