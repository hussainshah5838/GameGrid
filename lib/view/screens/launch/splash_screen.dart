import 'dart:async';
import 'package:flutter/material.dart';
import 'package:game_grid/config/routes/routes.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenHandler();
  }

  void splashScreenHandler() {
    Future.delayed(Duration(milliseconds: 1200)).then((v){
      Get.offAllNamed( AppLinks.onBoardingScreen );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomContainer(
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(text: '', size: 16),
              Center(child: Image.asset(Assets.imagesLogo, height: 100)),
              MyText(
                text: 'Powered by Gamegrid',
                size: 16,
                textAlign: TextAlign.center,
                weight: FontWeight.w500,
                color: kSecondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
