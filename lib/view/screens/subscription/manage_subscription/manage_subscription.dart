import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/screens/subscription/manage_subscription/add_new_card.dart';
import 'package:game_grid/view/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/custom_dialog_widget.dart';
import 'package:game_grid/view/widget/heading_tile_widget.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ManageSubscription extends StatefulWidget {
  const ManageSubscription({super.key});

  @override
  State<ManageSubscription> createState() => _ManageSubscriptionState();
}

class _ManageSubscriptionState extends State<ManageSubscription> {
  int selectedTab = 0; // 0 = Active, 1 = Expired

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Manage Subscription'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: AppSizes.DEFAULT,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: kFillColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: kBorderColor, width: 1),
                ),
                child: Row(
                  children: List.generate(2, (index) {
                    final isSelected = selectedTab == index;
                    final tabTitles = ['Current Plan', 'History'];
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedTab = index),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? kSecondaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: MyText(
                              text: tabTitles[index],
                              size: 14,
                              color: isSelected
                                  ? kPrimaryColor
                                  : kQuaternaryColor,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 4),
            Expanded(child: selectedTab == 0 ? _CurrentPlan() : SizedBox()),
          ],
        ),
      ),
    );
  }
}

class _CurrentPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: AppSizes.HORIZONTAL,
            physics: BouncingScrollPhysics(),
            children: [
              HeadingTile(title: 'Current Plan'),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: kFillColor,
                  border: Border.all(width: 1.0, color: kBorderColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Image.asset(Assets.imagesPremiumMember, height: 44),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              MyText(
                                text: 'Free trial',
                                size: 16,
                                weight: FontWeight.w700,
                                color: kTertiaryColor,
                                paddingBottom: 2,
                              ),
                              MyText(
                                text: 'Your free trial will expire in 2 days.',
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
                            bgColor: kGreenColor2.withValues(alpha: 0.1),
                            textColor: kGreenColor2,
                            buttonText: 'Active',
                            onTap: () {},
                            radius: 100,
                            height: 28,
                            textSize: 13,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    LinearPercentIndicator(
                      lineHeight: 6,
                      percent: 0.8,
                      padding: AppSizes.ZERO,
                      backgroundColor: kTertiaryColor.withValues(alpha: 0.15),
                      progressColor: kSecondaryColor,
                      barRadius: Radius.circular(100),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: MyText(
                            text: 'Subscribed : May 23, 2025',
                            size: 10,
                            weight: FontWeight.w500,
                            color: kQuaternaryColor,
                          ),
                        ),
                        MyText(
                          text: '1 / 3 days used ',
                          size: 10,
                          weight: FontWeight.w500,
                          color: kQuaternaryColor,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 1,
                      color: kTertiaryColor.withValues(alpha: 0.15),
                    ),
                    Row(
                      spacing: 6,
                      children: [
                        Expanded(
                          child: MyButton(
                            radius: 8,
                            height: 36,
                            bgColor: Color(0xff3F413C).withValues(alpha: 0.6),
                            textSize: 14,
                            textColor: kQuaternaryColor,
                            weight: FontWeight.w500,
                            onTap: () {
                              Get.bottomSheet(
                                CustomDialog(
                                  image: Assets.imagesCancelSubscription,
                                  title: 'Cancel Subscription?',
                                  subTitle:
                                      'Are you sure want to cancel your subscription? Game-Grid offers you 50% discount on your next renewal that will be very beneficial for you.',
                                  actionButtons: Row(
                                    spacing: 8,
                                    children: [
                                      Expanded(
                                        child: MyButton(
                                          bgColor: kRedColor.withValues(
                                            alpha: 0.1,
                                          ),
                                          textColor: kRedColor,
                                          buttonText: 'Cancel Anyway',
                                          onTap: () {},
                                        ),
                                      ),
                                      Expanded(
                                        child: MyButton(
                                          buttonText: 'Yes, Keep',
                                          onTap: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                isScrollControlled: true,
                              );
                            },
                            buttonText: 'Cancel',
                          ),
                        ),
                        Expanded(
                          child: MyButton(
                            height: 36,
                            radius: 8,
                            bgColor: kTertiaryColor,
                            textSize: 14,
                            textColor: kPrimaryColor,
                            weight: FontWeight.w500,
                            buttonText: 'Auto Renewal On',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              HeadingTile(title: 'Current Plan'),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: kFillColor,
                  border: Border.all(width: 1.0, color: kBorderColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyText(
                            text: 'Mastercard ***56',
                            size: 16,
                            weight: FontWeight.w700,
                            color: kTertiaryColor,
                            paddingBottom: 2,
                          ),
                          MyText(
                            text: 'Expiry date: 05/29',
                            size: 12,
                            weight: FontWeight.w500,
                            color: kTertiaryColor.withValues(alpha: 0.6),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(Assets.imagesDelete, height: 32),
                    SizedBox(width: 6),
                    Image.asset(Assets.imagesEditRounded, height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(
            buttonText: 'Add new payment method',
            onTap: () {
              Get.to(() => AddNewCard());
            },
          ),
        ),
      ],
    );
  }
}
