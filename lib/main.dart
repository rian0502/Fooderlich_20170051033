import 'package:aplikasi_3/fooderlich_theme.dart';
import 'package:aplikasi_3/home.dart';
import 'package:aplikasi_3/inheritanced_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';
import 'navigation/app_router.dart';



void main() async{

  final appStateManager = AppStateManager();
  //await appStateManager.initializeApp();
  runApp(Fooderlich(appStateManager: appStateManager));
}

class Fooderlich extends StatefulWidget {
  final AppStateManager appStateManager;
  const Fooderlich({Key? key, required this.appStateManager}) : super(key: key);

  @override
  State<Fooderlich> createState() => _FooderlichState();
}

class _FooderlichState extends State<Fooderlich> {
  late final _groceryManager = GroceryManager();
  late final _profileManager = ProfileManager();
  late final _appRouter = AppRouter(
    appStateManager: widget.appStateManager,
    groceryManager: _groceryManager,
    profileManager: _profileManager,
  );
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => widget.appStateManager),
      ChangeNotifierProvider(create: (context) => _groceryManager),
      ChangeNotifierProvider(create: (context) => _profileManager),
    ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = FooderlichTheme.dark();
          } else {
            theme = FooderlichTheme.light();
          }
          final router = _appRouter.router;
          return MaterialApp.router(
            title: 'Fooderlich',
            theme: theme,
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
          );
        },
      ),
    );
  }
}




