import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/controllers/auth_controllers.dart';
import 'package:game_grid/view/screens/auth/forgot_password/reset_password.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/custom_dialog_widget.dart';
import 'package:game_grid/view/widget/heading_widget.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_field_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:game_grid/view/widget/common_show_snackbar_widget.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final AuthController authController = Get.find();
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            AuthHeading(
              title: 'Forgot Password',
              subTitle:
                  "Please enter the email address that start’s with k*********@gmail.com",
            ),
            Obx(() => MyTextField(
                  controller: _emailController,
                  labelText: 'Email address',
                  hintText: 'Enter your email',
                  hasError: authController.emailError.value.isNotEmpty,
                  errorMessage: authController.emailError.value,
                  onChanged: authController.validateEmail,
                  validator: (value) {
                    return authController.validateEmail(value) ? null : 'Invalid email address';
                  },
                  suffix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(Assets.imagesEmail, height: 24)],
                  ),
                )),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() => MyButton(
                    isLoading: authController.isResettingPassword.value,
                    buttonText: 'Send Verification Link',
                    onTap: () async {
                      final email = _emailController.text.trim();
                      final success =
                          await authController.sendPasswordReset(email);
                      if (!success) {
                        showCommonSnackbarWidget(
                          "Error",
                          authController.errorMessage.value.isNotEmpty
                              ? authController.errorMessage.value
                              : "Unable to send reset link. Please try again.",
                          kBorderColor2,
                          kBorderColor2,
                          kRedColor,
                        );
                        return;
                      }

                      Get.dialog(
                        CustomDialog(
                          image: Assets.imagesEmailSent,
                          title: 'Mail Sent !',
                          subTitle:
                              'We have sent a mail on your given email address. Please verify and reset your password.',
                          buttonText: 'Check Email',
                          onTap: () {
                            Get.back();
                          },
                        ),
                      );
                    },
                  )),
              SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  MyText(
                    text: "Back to",
                    size: 16,
                    weight: FontWeight.w500,
                    color: kQuaternaryColor,
                  ),
                  MyText(
                    onTap: () {
                      Get.back();
                    },
                    text: ' Login',
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
