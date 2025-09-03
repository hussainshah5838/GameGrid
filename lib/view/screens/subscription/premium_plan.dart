import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_fonts.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/screens/subscription/welcome_to_premium.dart';
import 'package:game_grid/view/widget/custom_app_bar.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/custom_dialog_widget.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_field_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class PremiumPlan extends StatefulWidget {
  const PremiumPlan({super.key});

  @override
  State<PremiumPlan> createState() => _PremiumPlanState();
}

class _PremiumPlanState extends State<PremiumPlan> {
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
          padding: AppSizes.ZERO,
          physics: BouncingScrollPhysics(),
          children: [
            Image.asset(Assets.imagesPremium, height: 48),
            MyText(
              paddingTop: 16,
              text: 'Premium Plans',
              paddingLeft: 20,
              paddingRight: 20,
              size: 26,
              textAlign: TextAlign.center,
              paddingBottom: 8,
              weight: FontWeight.w600,
            ),
            MyText(
              paddingLeft: 20,
              paddingRight: 20,
              text:
                  'We offer affordable and provide amazing benefits that will surely help you bet better.',
              size: 14,
              lineHeight: 1.5,
              weight: FontWeight.w500,
              paddingBottom: 35,
              textAlign: TextAlign.center,
              color: kQuaternaryColor,
            ),
            SizedBox(
              height: 350,
              child: PageView.builder(
                itemCount: 3,
                physics: BouncingScrollPhysics(),
                controller: PageController(viewportFraction: 0.94),
                onPageChanged: (index) => selectPlan(index),
                itemBuilder: (context, index) {
                 return GestureDetector(
                    onTap: () => selectPlan(index),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: currentPlanIndex == index
                            ? kSecondaryColor.withValues(alpha: 0.08)
                            : kFillColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: currentPlanIndex == index
                              ? kSecondaryColor
                              : kBorderColor,
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 18,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyText(
                            text: '\$19.99',
                            size: 28,
                            weight: FontWeight.w700,
                            paddingBottom: 12,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    MyText(
                                      text: 'Premium Features',
                                      size: 16,
                                      weight: FontWeight.bold,
                                      paddingBottom: 4,
                                      color: kTertiaryColor,
                                    ),
                                    MyText(
                                      text:
                                          'Exclusive features in our premium.',
                                      size: 12,
                                      weight: FontWeight.w500,
                                      color: kQuaternaryColor,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: kTertiaryColor.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 13,
                                  vertical: 4,
                                ),
                                child: Text(
                                  'Annually',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: kTertiaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 1,
                            color: kBorderColor,
                            margin: EdgeInsets.symmetric(vertical: 12),
                          ),
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 12);
                              },
                              itemCount: 6,
                              padding: AppSizes.ZERO,
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final features = [
                                  'Access to Scoreboard and list of games.',
                                  'Access to all premium features',
                                  'Become a VIP member of our discord.',
                                  'Access to our trends and statistics',
                                  'Deeper data insights',
                                  'Become a VIP member of our discord.',
                                  'Chat Feature (AI-Based)',
                                ];
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      Assets.imagesFeature,
                                      height: 16,
                                    ),
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
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),

        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              MyButton(
                buttonText: 'Subscribe',
                onTap: () {
                  Get.bottomSheet(_MakePurchase(), isScrollControlled: true);
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

class _MakePurchase extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            text: 'Card Information',
            size: 24,
            weight: FontWeight.w700,
            textAlign: TextAlign.center,
            paddingBottom: 8,
          ),
          MyText(
            text:
                'Please enter the correct card information mentioned on your debit/credit card',
            size: 16,
            weight: FontWeight.w500,
            color: kQuaternaryColor,
            textAlign: TextAlign.center,
            paddingBottom: 20,
          ),
          MyTextField(
            labelText: 'Card Number',
            hintText: '4566 - 457656 - 567 - 6',
            suffix: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(Assets.imagesMaster, height: 24)],
            ),
          ),
          MyTextField(labelText: 'Card Holder Name', hintText: 'Kevin backer'),
          Row(
            children: [
              Expanded(
                child: MyTextField(labelText: 'Expiry Date', hintText: '05/29'),
              ),
              SizedBox(width: 8),
              Expanded(
                child: MyTextField(labelText: 'CVV', hintText: '058'),
              ),
            ],
          ),
          SizedBox(height: 10),
          MyButton(
            buttonText: 'Confirm',
            onTap: () {
              Get.to(() => WelcomeToPremium());
            },
          ),
        ],
      ),
    );
  }
}
