import 'package:flutter/material.dart';
import 'package:game_grid/config/routes/routes.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/controllers/auth_controllers.dart';
import 'package:game_grid/view/screens/auth/forgot_password/forgot_password.dart';
import 'package:game_grid/view/screens/auth/register/register.dart';
import 'package:game_grid/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:game_grid/view/widget/custom_check_box_widget.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/heading_widget.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_field_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthController authController = Get.find();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
              title: 'Welcome Back!',
              subTitle: 'Please enter the credentials to get started.',
            ),
          Obx( () => MyTextField(
              controller: _emailController,
              labelText: 'Email address',
              hintText: 'Enter your email',
               hasError: authController.emailError.value.isNotEmpty,
                
                validator: (v) {
       authController.validateEmail(v);
       return;  
    },
    errorMessage: authController.emailError.value,
       onChanged: (value) {
      authController.validateEmail(value);
    },
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(Assets.imagesEmail, height: 24)],
              ),
          )
            ),
            SizedBox(height: 10,),

          Obx( () =>  MyTextField(
              controller: _passwordController,
              marginBottom: 12,
              labelText: 'Password',
              hintText: '********',
             
              isObSecure: authController.isPasswordHide.value,
                                hasError: authController.passwordError.value.isNotEmpty,
                errorMessage: authController.passwordError.value,
                onChanged: (v){
                  authController.validatePassword(v);
                },
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "This Field is required";
                  }
                  return null;
                },
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(Assets.imagesVisibility, height: 24)],
              ),
            )),
            SizedBox(height: 3,),
            MyText(
              onTap: () {
                Get.to(() => ForgotPassword());
              },
              text: 'Forgot Password?',
              size: 16,
              weight: FontWeight.w500,
              textAlign: TextAlign.end,
              paddingBottom: 60,
            ),
            Row(
              children: [
              Obx( () =>  CustomCheckBox(isActive: authController.isRememberMeChecked.value,
              
               onTap: () {
                 authController.toggleRememberMe();
               })),
                Expanded(
                  child: MyText(
                    text: 'Remember me',
                    size: 16,
                    color: kTertiaryColor,
                    paddingLeft: 8,
                    weight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
          Obx( () =>  MyButton(
              isLoading: authController.isLoading.value,
              buttonText: 'Login',
              onTap: () async {
                bool isValidData = authController.validateEmailAndPassword(_emailController.text, _passwordController.text);
                if(!isValidData){
                  return;
                } else {
                  
                  await authController.login(_emailController.text.trim(), _passwordController.text.trim());

                }
              },
            )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: kTertiaryColor.withValues(alpha: 0.1),
                    ),
                  ),
                  MyText(
                    text: 'or sign in',
                    size: 14,
                    color: kGreyColor,
                    paddingLeft: 7,
                    paddingRight: 7,
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: kTertiaryColor.withValues(alpha: 0.1),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Image.asset(Assets.imagesGoogle, height: 48),
                Image.asset(Assets.imagesApple, height: 48),
              ],
            ),
            SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                MyText(
                  text: "Don’t have an Account?",
                  size: 16,
                  weight: FontWeight.w500,
                  color: kQuaternaryColor,
                ),
                MyText(
                  onTap: () {
                    Get.toNamed(AppLinks.signupScreen);
                  },
                  text: ' Register',
                  size: 16,
                  weight: FontWeight.w600,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
