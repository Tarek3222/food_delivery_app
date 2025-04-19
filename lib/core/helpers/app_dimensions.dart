import 'package:flutter/material.dart';

class AppDimensions {
  static double screenHeight(context) {
    return MediaQuery.sizeOf(context).height;
  }

  static double screenWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static double pageView(context) => screenHeight(context) / 2.64;
  static double pageViewContainer(context) => screenHeight(context) / 3.25;
  static double pageViewTextContainer(context) => screenHeight(context) / 7.03;
}
