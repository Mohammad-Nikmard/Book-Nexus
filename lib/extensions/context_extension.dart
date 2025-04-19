import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  void get pop => Navigator.pop(this);

  void push(Widget screen) {
    Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  void pushReplacement(Widget screen) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }
}

extension SizeExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
}
