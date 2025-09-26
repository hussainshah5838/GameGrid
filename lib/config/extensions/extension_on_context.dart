import 'package:flutter/material.dart';

extension ExtensionOnContext on BuildContext {
   Size get screenSize => MediaQuery.sizeOf(this);

   double get screenHeight => screenSize.height;
   double get screenWidth => screenSize.width;

}