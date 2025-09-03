import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/main.dart';
import 'package:game_grid/view/screens/profile/change_password.dart';
import 'package:game_grid/view/screens/profile/edit_profile.dart';
import 'package:game_grid/view/screens/profile/help_and_support.dart';
import 'package:game_grid/view/screens/profile/privacy_policy.dart';
import 'package:game_grid/view/screens/profile/user_preferences.dart';
import 'package:game_grid/view/screens/subscription/manage_subscription/manage_subscription.dart';
import 'package:game_grid/view/widget/common_image_view_widget.dart';
import 'package:game_grid/view/widget/custom_app_bar.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/custom_dialog_widget.dart';
import 'package:game_grid/view/widget/heading_tile_widget.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'User Profile'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1.0, color: kSecondaryColor),
                    ),
                    child: CommonImageView(
                      height: 80,
                      width: 80,
                      radius: 100.0,
                      url: dummyImg,
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 0,
                    child: Image.asset(Assets.imagesPro, height: 24),
                  ),
                ],
              ),
            ),
            MyText(
              paddingTop: 12,
              size: 16,
              textAlign: TextAlign.center,
              weight: FontWeight.w700,
              text: 'Kevin Backer',
            ),
            MyText(
              paddingTop: 6,
              size: 14,
              textAlign: TextAlign.center,
              weight: FontWeight.w500,
              color: kQuaternaryColor,
              text: 'kevinbacker23@gmail.com',
              paddingBottom: 16,
            ),
            Center(
              child: SizedBox(
                width: 130,
                child: MyButton(
                  height: 36,
                  buttonText: '',
                  onTap: () {
                    Get.to(() => EditProfile());
                  },
                  customChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.imagesEditIcon, height: 16),
                      MyText(
                        paddingLeft: 4,
                        paddingRight: 4,
                        text: "Edit Profile",
                        size: 14,
                        color: kPrimaryColor,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.0, 1.0],
                  colors: [
                    Color(0xffE5FF6E).withValues(alpha: 0.6),
                    Color(0xffC8EE19).withValues(alpha: 0.6),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Image.asset(Assets.imagesPremiumMember, height: 44),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          text: 'Premium Member',
                          size: 14,
                          weight: FontWeight.w700,
                          color: kTertiaryColor,
                          paddingBottom: 2,
                        ),
                        MyText(
                          text: 'Member since August 2024',
                          size: 12,
                          weight: FontWeight.w500,
                          color: kTertiaryColor.withValues(alpha: 0.6),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 66,
                    child: MyButton(
                      bgColor: kTertiaryColor,
                      buttonText: 'Manage',
                      onTap: () {
                        Get.to(() => ManageSubscription());
                      },
                      radius: 8,
                      height: 32,
                      textSize: 13,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            HeadingTile(title: 'General Settings'),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: kFillColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: kBorderColor, width: 1),
              ),
              padding: const EdgeInsets.all(12),
              child: ListView.separated(
                itemCount: 4,
                shrinkWrap: true,
                padding: AppSizes.ZERO,
                physics: BouncingScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 1,
                    color: kBorderColor,
                    margin: EdgeInsets.symmetric(vertical: 12),
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  final details = [
                    {
                      'icon': Assets.imagesUserPreferences,
                      'title': 'User Preferences',
                    },
                    {
                      'icon': Assets.imagesChangePassword,
                      'title': 'Change Password',
                    },
                    {'icon': Assets.imagesPayment, 'title': 'Payment History'},
                    {'icon': Assets.imagesJoinDiscord, 'title': 'Join Discord'},
                  ];
                  final detail = details[index];
                  return _ProfileTile(
                    icon: detail['icon'] ?? '',
                    title: detail['title'] ?? '',
                    onTap: () {
                      switch (index) {
                        case 0:
                          Get.to(() => UserPreferences());
                          break;
                        case 1:
                          Get.to(() => ChangePassword());
                          break;
                        case 2:
                          Get.toNamed('/paymentHistory');
                          break;
                        case 3:
                          break;
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            HeadingTile(title: 'Support'),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: kFillColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: kBorderColor, width: 1),
              ),
              padding: const EdgeInsets.all(12),
              child: ListView.separated(
                itemCount: 3,
                shrinkWrap: true,
                padding: AppSizes.ZERO,
                physics: BouncingScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 1,
                    color: kBorderColor,
                    margin: EdgeInsets.symmetric(vertical: 12),
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  final details = [
                    {
                      'icon': Assets.imagesHelpSupport,
                      'title': 'Help & Support',
                    },
                    {
                      'icon': Assets.imagesPrivacyPolicy,
                      'title': 'Privacy Policy',
                    },
                    {'icon': Assets.imagesLogout, 'title': 'Logout'},
                  ];
                  final detail = details[index];
                  return _ProfileTile(
                    icon: detail['icon'] ?? '',
                    title: detail['title'] ?? '',
                    showArrow: index < 2,
                    onTap: () {
                      switch (index) {
                        case 0:
                          Get.to(() => HelpAndSupport());
                          break;
                        case 1:
                          Get.to(() => PrivacyPolicy());
                          break;
                        case 2:
                          Get.bottomSheet(
                            CustomDialog(
                              image: Assets.imagesLo,
                              title: 'Logout?',
                              subTitle:
                                  'Are you sure want to logout from the app. This might lose some of your data.',
                              buttonText: 'Yes, Logout',
                              onTap: () {
                                Get.back();
                              },
                            ),
                            isScrollControlled: false,
                          );
                          break;
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.showArrow = true,
  });
  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(icon, height: 20),
          Expanded(
            child: MyText(
              paddingLeft: 8,
              text: title,
              size: 16,
              weight: FontWeight.w500,
            ),
          ),
          if (showArrow) Image.asset(Assets.imagesArrowNext, height: 20),
        ],
      ),
    );
  }
}
