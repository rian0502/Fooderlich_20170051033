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
  int get selectedTab => _selectedTab;

  // TODO: Add initializeApp
  void  initializeApp() {
    Timer(const Duration(seconds: 2), () {
      _initialized = true;
      notifyListeners();
    });
  }
  // TODO: Add login
  void login(String username, String password) {
    _loggedIn = true;
    notifyListeners();
  }
  // TODO: Add completeOnboarding
  void completeOnboarding() {
    _onboardingComplete = true;
    notifyListeners();
  }
  // TODO: Add goToTab
  void goToTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }
  // TODO: Add goToRecipes
  void goToRecipes() {
    _selectedTab = FooderlichTab.recipes;
    notifyListeners();
  }
  // TODO: Add logout
  void logout() {
    _loggedIn = false;
    _onboardingComplete = false;
    _initialized = false;
    _selectedTab = 0;
    initializeApp();
    notifyListeners();
  }
  void onboarded() async {
    _onboardingComplete = true;
    await _appCache.completeOnboarding();
    notifyListeners();
  }
}