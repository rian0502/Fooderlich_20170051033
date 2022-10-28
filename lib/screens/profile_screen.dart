import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../components/circle_image.dart';
import '../models/models.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';


class ProfileScreen extends StatefulWidget {
  final User user;
  final int currentTab;

  const ProfileScreen({Key? key, required this.user, required this.currentTab}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
          onTap: () async {
            if (kIsWeb || Platform.isMacOS) {
              await launchUrl(Uri.parse('https://www.raywenderlich.com/'));
            } else {
              context.goNamed(
                'rw',
                params: {'tab': '${widget.currentTab}'},
              );
            }
          },
        ),
        ListTile(
          title: const Text('Log out'),
          onTap: () {
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
          imageProvider: AssetImage(widget.user.profileImageUrl),
          imageRadius: 80,
        ),
        const SizedBox(height: 16),
        Text(
          widget.user.name!,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 8),
        Text(
          widget.user.email,
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
            value: widget.user.darkMode,
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
