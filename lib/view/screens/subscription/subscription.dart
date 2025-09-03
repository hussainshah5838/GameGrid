import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_fonts.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/screens/subscription/premium_plan.dart';
import 'package:game_grid/view/widget/custom_app_bar.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  /// 0 = Free, 1 = Premium
  int currentPlanIndex = 0;

  void selectPlan(int index) {
    setState(() {
      currentPlanIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(
          haveBorder: false,
          title: '',
          haveLeading: false,
          actions: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(Assets.imagesClose, height: 24),
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.HORIZONTAL,
          physics: BouncingScrollPhysics(),
          children: [
            Image.asset(Assets.imagesPremium, height: 48),
            MyText(
              paddingTop: 16,
              text: 'Premium Plans',
              size: 26,
              textAlign: TextAlign.center,
              paddingBottom: 8,
              weight: FontWeight.w600,
            ),
            MyText(
              text:
                  'We offer affordable and provide amazing benefits that will surely help you bet better.',
              size: 14,
              lineHeight: 1.5,
              weight: FontWeight.w500,
              paddingBottom: 35,
              textAlign: TextAlign.center,
              color: kQuaternaryColor,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(7, (index) {
                      final features = [
                        'Access to Scoreboard and list of games.',
                        'Access to all premium features',
                        'Access to the Special Discord',
                        'Become a VIP member of our discord.',
                        'Access to our trends and statistics',
                        'Chat Feature (AI-Based)',
                        'Deeper data insights',
                      ];
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(Assets.imagesFeature, height: 16),
                          Expanded(
                            child: MyText(
                              paddingLeft: 6,
                              text: features[index],
                              size: 12,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => selectPlan(0),
                  child: Container(
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: currentPlanIndex == 0
                            ? kSecondaryColor
                            : Colors.transparent,
                      ),
                      color: currentPlanIndex == 0
                          ? kSecondaryColor.withValues(alpha: 0.08)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        MyText(
                          text: 'Free',
                          size: 12,
                          weight: FontWeight.w500,
                          color: kQuaternaryColor,
                          paddingBottom: 16,
                        ),
                        Column(
                          children: List.generate(7, (index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: index < 4
                                    ? 28
                                    : index == 4
                                    ? 20
                                    : 14,
                              ),
                              child: Text(
                                (index == 1 ||
                                        index == 3 ||
                                        index == 5 ||
                                        index == 6)
                                    ? '❌'
                                    : '✅',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: AppFonts.Satoshi,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12),
                GestureDetector(
                  onTap: () => selectPlan(1),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: currentPlanIndex == 1
                            ? kSecondaryColor
                            : Colors.transparent,
                      ),
                      color: currentPlanIndex == 1
                          ? kSecondaryColor.withValues(alpha: 0.08)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        MyText(
                          text: 'Premium',
                          size: 12,
                          weight: FontWeight.w500,
                          color: kQuaternaryColor,
                          paddingBottom: 16,
                        ),
                        Column(
                          children: List.generate(7, (index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: index < 4
                                    ? 28
                                    : index == 4
                                    ? 20
                                    : 14,
                              ),
                              child: Text(
                                '✅',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: AppFonts.Satoshi,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              MyText(
                text:
                    'After free trial ends, You’ll be able to upgrade and enjoy all the access of the application.',
                size: 12,
                paddingLeft: 20,
                paddingRight: 20,
                lineHeight: 1.5,
                weight: FontWeight.w500,
                color: kQuaternaryColor,
                paddingBottom: 12,
                textAlign: TextAlign.center,
              ),
              MyButton(
                buttonText: currentPlanIndex == 1
                    ? 'Subscribe'
                    : 'Continue with free plan',
                onTap: () {
                  if (currentPlanIndex == 1) Get.to(() => PremiumPlan());
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 12,
                      color: kQuaternaryColor,
                      height: 1.5,
                      fontFamily: AppFonts.Satoshi,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: 'By clicking on subscribe you agree to our ',
                      ),
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: TextStyle(
                          color: kTertiaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: kTertiaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
