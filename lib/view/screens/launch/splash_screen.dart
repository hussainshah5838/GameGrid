import 'dart:async';
import 'package:flutter/material.dart';
import 'package:game_grid/config/routes/routes.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/services/onboard_service.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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


void splashScreenHandler() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  String? uuid = sp.getString("uuid");

  bool isOnBoardSeen = await OnboardingService.instance.hasSeenOnboarding();

  if (!isOnBoardSeen) {
    Future.delayed(Duration(milliseconds: 1200)).then((_) {
      Get.offAllNamed(AppLinks.onBoardingScreen);
    });
  } else {
    Future.delayed(Duration(milliseconds: 1200)).then((_) {
      if (uuid != null && uuid.isNotEmpty) {
        Get.offAllNamed(AppLinks.navbarScreen);
      } else {
        Get.offAllNamed(AppLinks.loginScreen);
      }
    });
  }

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
