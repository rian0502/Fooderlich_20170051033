import 'dart:async';
import 'package:flutter/material.dart';

import 'app_cache.dart';

class FooderlichTab{
  static const int recipes = 0;
  static const int explore = 1;
  static const int profile = 2;
}

class AppStateManager extends ChangeNotifier{
  bool _initialized = false;
  bool _loggedIn = false;
  bool _onboardingComplete = false;
  int _selectedTab = FooderlichTab.recipes;
  final _appCache = AppCache();
  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;
  int get getSelectedTab  => _selectedTab;

  Future<void>  initializeApp()  async{
    _loggedIn = await _appCache.isUserLoggedIn();
    // Check if the user completed onboarding
    _onboardingComplete = await _appCache.didCompleteOnboarding();
  }
  void login(String username, String password) async {
    _loggedIn = true;
    await _appCache.cacheUser();
    notifyListeners();
  }
  void completeOnboarding() {
    _onboardingComplete = true;
    notifyListeners();
  }
  void goToTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }
  void goToRecipes() {
    _selectedTab = FooderlichTab.recipes;
    notifyListeners();
  }
  void logout() async {
    _loggedIn = false;
    _onboardingComplete = false;
    _selectedTab = 0;
    await _appCache.invalidate();
    await initializeApp();
    notifyListeners();
  }
  void onboarded() async {
    _onboardingComplete = true;
    await _appCache.completeOnboarding();
    notifyListeners();
  }
}