import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/view/screens/auth/register/complete_profile/favorite_sport.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/custom_dialog_widget.dart';
import 'package:game_grid/view/widget/heading_widget.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 54,
      height: 60,
      textStyle: TextStyle(
        fontSize: 30,
        color: kTertiaryColor,
        fontWeight: FontWeight.w500,
      ),
      decoration: BoxDecoration(
        color: kFillColor,
        borderRadius: BorderRadius.circular(12),
        border: Border(bottom: BorderSide(color: kBorderColor, width: 1.0)),
      ),
    );
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthHeading(
                title: 'Verification Code',
                subTitle:
                    'We have sent a verification code on your email address k******@gmail.com',
              ),
              Pinput(
                length: 5,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme,
                submittedPinTheme: defaultPinTheme,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
              SizedBox(height: 50),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  MyText(
                    text: "Didn't receive code?",
                    size: 16,
                    weight: FontWeight.w500,
                    color: kQuaternaryColor,
                  ),
                  MyText(
                    text: " 00:54",
                    size: 16,
                    weight: FontWeight.w600,
                    color: kTertiaryColor,
                  ),
                ],
              ),
              SizedBox(height: 20),
              MyButton(
                buttonText: 'Continue',
                onTap: () {
                  Get.dialog(
                    CustomDialog(
                      image: Assets.imagesSuccess,
                      title: 'Account Created !',
                      subTitle:
                          'You have successfully created your account. You are only one step away for exploring the app.',
                      buttonText: 'Continue',
                      onTap: () {
                        Get.back();
                        Get.to(() => FavoriteSport());
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
