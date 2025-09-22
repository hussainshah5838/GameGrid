import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:game_grid/config/helper/validation_helper.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_fonts.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/controllers/auth_controllers.dart';
import 'package:game_grid/view/screens/auth/register/email_verification.dart';
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


   TextEditingController _emailController = TextEditingController();
   TextEditingController _passwordController = TextEditingController();
   TextEditingController _nameController = TextEditingController();

    final key = GlobalKey<FormState>();
  bool isPasswordHide = true;
  bool isTermsChecked = false;



  
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
        body: Form(
          key: key,
          child: ListView(
            shrinkWrap: true,
            padding: AppSizes.DEFAULT,
            physics: BouncingScrollPhysics(),
            children: [
              AuthHeading(
                title: 'Create Account!',
                subTitle: 'Please enter the information to get started.',
              ),
              MyTextField(
                controller: _nameController,
                labelText: 'Full name',
                hintText: 'Enter your full name',
                validator: (v){
                  if(v == null || v.isEmpty){
                    return "This Field is required";
                  }
                 
                  return null;
                },
                suffix: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset(Assets.imagesUser, height: 24)],
                ),
              ),
              MyTextField(
                controller: _emailController,
                labelText: 'Email address',
                hintText: 'Enter your email',
                validator: (v){
                  if (v == null || v.trim().isEmpty) {
    return "This field is required";
  }
  if (!isValidEmail(v.trim())) {
    return "Enter a valid email address";
  }
  return null;
                },
                suffix: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset(Assets.imagesEmail, height: 24)],
                ),
              ),
              MyTextField(
                controller: _passwordController,
                marginBottom: 40,
                labelText: 'Password',
                hintText: '********',
                isObSecure: isPasswordHide,
               validator: (v){
                  if( v == null || v.isEmpty){
                    return "This Field is required";
                  }
                  
                  return null;
                },
                suffix: InkWell(
                  onTap: (){
                    setState(() {
                       isPasswordHide = !isPasswordHide;
                    });
                  },
                  child: Icon(isPasswordHide ? Icons.visibility_outlined : 
                  Icons.visibility_off_outlined, color: kBorderColor2,),
                ),
                
              ),
          
              Row(
                spacing: 8,
                children: [
                  CustomCheckBox(isActive: isTermsChecked, onTap: () {
                        setState(() {
                          isTermsChecked = !isTermsChecked;
                        });
          
                  }),
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
                                // Handle Terms & Conditions tap
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Obx( () => MyButton(
                buttonText: 'Continue',
                isLoading: authController.isLoading.value,
                onTap: () async {
                    if(!key.currentState!.validate()){
                      return;
                    } else if (isTermsChecked == false) {
          
                        Get.showSnackbar(GetSnackBar(
                          title: "Warning",
                          messageText: MyText(text: "Tick the agreement"),
                        ));
          
                    } else {
          
                    //  await authController.signUp(_emailController.text.trim(), 
                    //     _passwordController.text.trim(), _nameController.text.trim() );
          
                    }
          
          
          
                  // Get.to(() => VerificationCode());
                },
              )
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
