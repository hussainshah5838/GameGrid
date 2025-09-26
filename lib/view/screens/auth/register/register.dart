import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_fonts.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/controllers/auth_controllers.dart';
import 'package:game_grid/view/widget/custom_check_box_widget.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/heading_widget.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_field_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthController authController = Get.find();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: authController.formKey,
          child: ListView(
            shrinkWrap: true,
            padding: AppSizes.DEFAULT,
            physics: BouncingScrollPhysics(),
            children: [
              AuthHeading(
                title: 'Create Account!',
                subTitle: 'Please enter the information to get started.',
              ),
            Obx(
            () =>   MyTextField(
                controller: _nameController,
                labelText: 'Full name',
                hintText: 'Enter your full name',
                errorMessage: authController.nameError.value,
                  validator: (value) {
    final valid = authController.validateName(value); 
    if (!valid) return authController.nameError.value; 
    return null; 
  },
                suffix: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset(Assets.imagesUser, height: 24)],
                ),
              )),
              SizedBox(height: 10,),
             Obx(
            () =>  MyTextField(
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
              )),
              SizedBox(height: 10,),

            Obx(
            () =>   MyTextField(
                controller: _passwordController,
                marginBottom: 40,
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
                suffix: InkWell(
                  onTap: () {
                   authController.togglePassword();
                  },
                  child: Icon(
                    authController.isPasswordHide.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: kBorderColor2,
                  ),
                ),
              )),
              SizedBox(height: 10,),

              Row(
                spacing: 8,
                children: [
                 Obx(
            () => CustomCheckBox(
              isActive: authController.isTermsChecked.value,
              isError: authController.termsError.value,
              onTap: () {
                authController.toggleCheckBox();
              },
            ),
          ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFonts.Satoshi,
                          color: kTertiaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: 'I agree to the ',
                            style: TextStyle(
                              fontSize: 16,
                              color: kTertiaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                              fontSize: 16,
                              color: kTertiaryColor,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                              
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Obx(
                () => MyButton(
                  buttonText: 'Continue',
                  isLoading: authController.isLoading.value,
                  onTap: () async {
                 bool validData =  authController.validateForm(_nameController.text, _emailController.text, _passwordController.text);
                 if(!validData) {
                  return;
                 } else {
                  await authController.signUp(_emailController.text.trim(), 
                  _passwordController.text.trim(), _nameController.text.trim());
                 };
                  },
                ),
              ),
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
                      text: 'or sign up',
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
                    text: "Already have an Account?",
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
                    color: kTertiaryColor,
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