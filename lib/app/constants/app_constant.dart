import 'package:flutter/material.dart';

typedef AC = AppConstant;

class AppConstant {
  AppConstant._();

  /// Numeric constants
  static const double appButtonElevation = 2.0;
  static const double appButtonRadius = 8.0;
  static const double appButtonHeight = 56.0;

  /// Color constants
  static const Color appPrimaryColor = Colors.red;
  static Color appPrimaryDarkColor = Colors.red.shade800;
  static const Color favoriteButtonBackgroundColor = Colors.pink;
  static Color navBarDisabledColor = Colors.blueGrey;

  /// String constants
  static const String baseUrl = "https://pokeapi.co/api/v2/pokemon/";
}
