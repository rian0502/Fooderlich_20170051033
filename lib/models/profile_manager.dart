import 'package:flutter/material.dart';
import 'user.dart';


class ProfileManager extends ChangeNotifier {
  var _didSelectUser = false;
  var _tapOnRaywenderlich = false;
  var _darkMode = false;

  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }
  void tapOnRaywenderlich (bool selected) {
    _tapOnRaywenderlich = selected;
    notifyListeners();
  }
  void tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }
  User get getUser => User(
    firstName: 'Steve',
    lastName: 'Kamau',
    role: 'Flutteristat',
    profileImageUrl: 'assets/profile_pics/person_stef.jpeg',
    points: 100,
    darkMode: _darkMode,
  );

  bool get didSelectUser => _didSelectUser;
  bool get  didTapOnRaywenderlich => _tapOnRaywenderlich;
  bool get darkMode => _darkMode;


}