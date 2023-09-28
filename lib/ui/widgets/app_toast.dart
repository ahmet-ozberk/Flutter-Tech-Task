import 'package:flutter/material.dart';
import '../../app/constants/app_constant.dart';
import 'package:grock/grock.dart';

typedef Toast = AppCustomizeToast;

class AppCustomizeToast {
  static void show(String message) {
    Grock.toast(
      text: message,
      padding: [24, 10].horizontalAndVerticalP,
      backgroundColor: AC.appPrimaryDarkColor,
      textStyle: const TextStyle(
        fontSize: 13,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}