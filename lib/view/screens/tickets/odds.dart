import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/widget/custom_app_bar.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/custom_drop_down_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';

class Odds extends StatelessWidget {
  const Odds({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Odds'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kFillColor,
                border: Border.all(width: 1.0, color: kBorderColor),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyText(
                              text: 'Some Game Parley',
                              size: 13,
                              weight: FontWeight.w700,
                            ),
                            MyText(
                              paddingTop: 2,
                              text: 'Barcelona vs Real Madrid | 7:30 PM EST',
                              size: 11,
                              weight: FontWeight.w500,
                              color: kQuaternaryColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 92,
                        child: MyDropDown(
                          prefixIcon: Assets.imagesShield,
                          hint: '-143',
                          items: ['-143'],
                          onChanged: (value) {},
                          selectedValue: '-143',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyText(
                              text: 'Set Wager',
                              size: 12,
                              weight: FontWeight.w500,
                              color: kQuaternaryColor,
                              paddingBottom: 6,
                            ),
                            MyDropDown(
                              havePrefix: false,
                              hint: '\$30',
                              items: ['\$30'],
                              selectedValue: '\$30',
                              onChanged: (value) {},
                              prefixIcon: '',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyText(
                              text: 'Select Odds',
                              size: 12,
                              weight: FontWeight.w500,
                              color: kQuaternaryColor,
                              paddingBottom: 6,
                            ),
                            MyDropDown(
                              hint: '-143',
                              items: ['-143'],
                              selectedValue: '-143',
                              onChanged: (value) {},
                              prefixIcon: Assets.imagesShield,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyText(
                              text: 'Payout',
                              size: 12,
                              weight: FontWeight.w500,
                              color: kQuaternaryColor,
                              paddingBottom: 6,
                            ),
                            SizedBox(
                              height: 36,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: MyText(
                                  text: '\$658.88',
                                  size: 14,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    color: kBorderColor,
                    margin: EdgeInsets.symmetric(vertical: 12),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyText(
                              text: 'Payout',
                              size: 12,
                              weight: FontWeight.w500,
                              color: kQuaternaryColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyText(
                              text: 'Odds',
                              size: 12,
                              weight: FontWeight.w500,
                              color: kQuaternaryColor,
                              paddingBottom: 6,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  ListView.separated(
                    shrinkWrap: true,
                    padding: AppSizes.ZERO,
                    physics: BouncingScrollPhysics(),
                    itemCount: 5,
                    separatorBuilder: (context, index) => SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 36,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: MyText(
                                  text: '\$658.88',
                                  size: 14,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 36,
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              color: Color(0xff272924).withValues(alpha: 0.6),
                              border: Border.all(
                                width: 1,
                                color: kTertiaryColor.withValues(alpha: 0.08),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Image.asset(Assets.imagesShield, height: 15),
                                Container(
                                  margin: EdgeInsets.only(left: 6),
                                  width: 1,
                                  color: kTertiaryColor.withValues(alpha: 0.08),
                                ),
                                Expanded(
                                  child: MyText(
                                    text: '-105',
                                    size: 12,
                                    textAlign: TextAlign.center,
                                    weight: FontWeight.w500,
                                    color: kTertiaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
