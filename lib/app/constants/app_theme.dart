import 'package:flutter/material.dart';

import 'app_constant.dart';

final appThemeData = ThemeData(
  useMaterial3: true,
  primaryColor: AC.appPrimaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AC.appPrimaryColor,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
    iconTheme: IconThemeData(color: Colors.white, size: 20),
  ),
);
