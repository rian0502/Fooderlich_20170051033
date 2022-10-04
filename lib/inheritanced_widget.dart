import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class MyInheritancedWidget extends InheritedWidget {
  MyInheritancedWidget({
    Key? key,
    required this.child,
    required this.isFavorit,
  }) : super(key: key, child: child);

  final Widget child;
  bool isFavorit;


  static MyInheritancedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritancedWidget>()!;
  }

  @override
  bool updateShouldNotify(MyInheritancedWidget oldWidget) {
    return oldWidget.isFavorit != isFavorit;
  }
}
