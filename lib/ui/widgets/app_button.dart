import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

import '../../app/constants/app_constant.dart';

enum ButtonType { primary, outlined }

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool isStartIcon;
  final bool isEndIcon;
  final Widget? icon;
  final String text;
  final ButtonType? type;
  const AppButton(
      {super.key,
      this.onPressed,
      required this.text,
      this.type = ButtonType.primary,
      this.icon,
      this.isStartIcon = false,
      this.isEndIcon = false});

  @override
  Widget build(BuildContext context) {
    const Size buttonSize = Size(double.infinity, AC.appButtonHeight);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        maximumSize: buttonSize,
        minimumSize: buttonSize,
        shape: RoundedRectangleBorder(
          borderRadius: AC.appButtonRadius.borderRadius,
          side: type == ButtonType.outlined
              ? BorderSide(width: 1, color: context.primaryColor)
              : const BorderSide(
                  width: 0,
                  color: Colors.transparent,
                ),
        ),
        elevation: AC.appButtonElevation,
        backgroundColor:
            type == ButtonType.outlined ? Colors.white : context.primaryColor,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isStartIcon) ...{
            icon!,
            12.width,
          },
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: context.bodyMedium.copyWith(
                  color: type == ButtonType.primary
                      ? Colors.white
                      : context.primaryColor),
            ),
          ),
          if (isEndIcon) ...{
            12.width,
            icon!,
          }
        ],
      ),
    );
  }
}
