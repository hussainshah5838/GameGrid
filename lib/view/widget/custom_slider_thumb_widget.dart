import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';

Widget CustomSliderThumb() {
  return Container(
    height: 16,
    width: 16,
    decoration: BoxDecoration(
      color: kSecondaryColor,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 1.91),
          blurRadius: 3.83,
          spreadRadius: -1.91,
          color: kPrimaryColor.withValues(alpha: .06),
        ),
        BoxShadow(
          offset: Offset(0, 3.83),
          blurRadius: 7.65,
          spreadRadius: -1.91,
          color: kPrimaryColor.withValues(alpha: .06),
        ),
      ],
      border: Border.all(width: 1.0, color: kTertiaryColor),
    ),
  );
}
