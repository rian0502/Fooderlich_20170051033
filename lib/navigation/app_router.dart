import 'package:flutter/material.dart';
import '../home.dart';
import '../models/models.dart';
import '../screens/grocery_item_screen.dart';
import '../screens/login_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/webview_screen.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {

  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final AppStateManager? appStateManager;
  final GroceryManager? groceryManager;
  final ProfileManager? profileManager;

  AppRouter({
    this.appStateManager,
    this.groceryManager,
    this.profileManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager!.addListener(notifyListeners);
    groceryManager!.addListener(notifyListeners);
    profileManager!.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager!.removeListener(notifyListeners);
    groceryManager!.removeListener(notifyListeners);
    profileManager!.removeListener(notifyListeners);
    super.dispose();
  }

  // 5
  @override
  Widget build(BuildContext context) {
    // 6
    return Navigator(
      // 7
      key: navigatorKey,
      onPopPage: _handlePopPage,
      // 8
      pages: [
        if (!appStateManager!.isInitialized) SplashScreen.page(),
        if (appStateManager!.isInitialized && !appStateManager!.isLoggedIn)
          LoginScreen.page(),
        if (appStateManager!.isLoggedIn && !appStateManager!.isOnboardingComplete)
          OnboardingScreen.page(),
        if (appStateManager!.isOnboardingComplete)
          Home.page(appStateManager!.getSelectedTab),
        if (groceryManager!.isCreatingNewItem)
          GroceryItemScreen.page(onCreate: (item) {
            groceryManager!.addItem(item!);
          }),
        // 1
        if (groceryManager!.selectedIndex != null)
        // 2
          GroceryItemScreen.page(
            item: groceryManager!.selectedGroceryItem,
            index: groceryManager!.selectedIndex,
            onUpdate: (item, index) {
              // 3
              groceryManager!.updateItem(item!, index!);
            },
          ),
        if (profileManager!.didSelectUser)
          ProfileScreen.page(profileManager!.getUser),
        if (profileManager!.didTapOnRaywenderlich) WebViewScreen.page()
      ],
    );
  }

  bool _handlePopPage(
      // 1
      Route<dynamic> route,
      // 2
      result) {
    // 3
    if (!route.didPop(result)) {
      // 4
      return false;
    }

    // 5
    if (route.settings.name == FooderlichPages.onboardingPath) {
      appStateManager!.logout();
    }
    if (route.settings.name == FooderlichPages.groceryItemDetails) {
      groceryManager!.groceryItemTapped(0);
    }

    if (route.settings.name == FooderlichPages.profilePath) {
      profileManager!.tapOnProfile(false);
    }

    if (route.settings.name == FooderlichPages.raywenderlich) {
      profileManager!.tapOnRaywenderlich(false);
    }
    return true;
  }

  // 9
  @override
  Future<void> setNewRoutePath(configuration) async => null;
}