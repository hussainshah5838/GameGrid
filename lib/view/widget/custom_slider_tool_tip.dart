import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:game_grid/constants/app_colors.dart';

FlutterSliderTooltip CustomSliderToolTip() {
  return FlutterSliderTooltip(
    textStyle: TextStyle(fontSize: 10, color: kPrimaryColor),
    boxStyle: FlutterSliderTooltipBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: kTertiaryColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3.83),
            blurRadius: 5.74,
            spreadRadius: -1.91,
            color: kPrimaryColor.withValues(alpha: .06),
          ),
          BoxShadow(
            offset: Offset(0, 11.48),
            blurRadius: 15.3,
            spreadRadius: -3.83,
            color: kPrimaryColor.withValues(alpha: .06),
          ),
        ],
      ),
    ),
  );
}
