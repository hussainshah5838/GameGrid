import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/main.dart';
import 'package:game_grid/view/widget/common_image_view_widget.dart';
import 'package:game_grid/view/widget/custom_app_bar.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/heading_tile_widget.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_field_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: "Edit Profile"),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            HeadingTile(title: 'Avatar'),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kFillColor,
                border: Border.all(width: 1.0, color: kBorderColor),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1.0, color: kTertiaryColor),
                    ),
                    child: CommonImageView(
                      height: 50,
                      width: 50,
                      radius: 100.0,
                      url: dummyImg,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          text: "Profile Photo",
                          size: 16,
                          weight: FontWeight.w500,
                        ),
                        MyText(
                          paddingTop: 4,
                          text: "Maximum size 20kb",
                          size: 14,
                          weight: FontWeight.w500,
                          color: kQuaternaryColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 66,
                    child: MyButton(
                      height: 32,
                      buttonText: '',
                      onTap: () {},
                      radius: 8,
                      customChild: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(Assets.imagesEditIcon, height: 16),
                          MyText(
                            paddingLeft: 4,
                            paddingRight: 4,
                            text: "Edit",
                            size: 14,
                            color: kPrimaryColor,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            HeadingTile(title: 'Personal Information'),
            SizedBox(height: 12),
            MyTextField(labelText: "First Name", hintText: 'Kevin'),
            MyTextField(labelText: "Last Name", hintText: 'Backer'),
            MyTextField(
              labelText: "Email Address",
              hintText: 'Kevinbacker234@gmail.com',
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(buttonText: "Update", onTap: () {}),
        ),
      ),
    );
  }
}
