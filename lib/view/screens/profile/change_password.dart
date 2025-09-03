import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/widget/custom_app_bar.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_field_widget.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
        appBar: simpleAppBar(title: 'Change Password'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            MyTextField(
              labelText: 'Current Password',
              hintText: '********',
              isObSecure: true,
              controller: _emailController,
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(Assets.imagesVisibility, height: 24)],
              ),
            ),
            MyTextField(
              labelText: 'Create new password',
              hintText: '********',
              isObSecure: true,
              controller: _passwordController,
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(Assets.imagesVisibility, height: 24)],
              ),
            ),
            MyTextField(
              labelText: 'Confirm new password',
              hintText: '********',
              isObSecure: true,
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(Assets.imagesVisibility, height: 24)],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(buttonText: 'Update', onTap: () {}),
        ),
      ),
    );
  }
}
