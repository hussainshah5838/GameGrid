import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:get/get.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child;

  const CustomContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesMainBg),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
