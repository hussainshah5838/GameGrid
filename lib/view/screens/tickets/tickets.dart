import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/main.dart';
import 'package:game_grid/view/screens/profile/profile.dart';
import 'package:game_grid/view/screens/tickets/odds.dart';
import 'package:game_grid/view/widget/common_image_view_widget.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/custom_drop_down_widget.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class Tickets extends StatelessWidget {
  const Tickets({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: kFillColor,
          toolbarHeight: 72,
          automaticallyImplyLeading: false,
          titleSpacing: 20.0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(text: 'Tickets', size: 20, weight: FontWeight.w500),
              MyText(
                paddingTop: 4,
                text: 'Here you can find your favorite plays',
                size: 12,
                weight: FontWeight.w500,
                color: kQuaternaryColor,
              ),
            ],
          ),
          actions: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => Profile());
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.0, color: kTertiaryColor),
                  ),
                  child: CommonImageView(
                    height: 38,
                    width: 38,
                    radius: 100,
                    url: dummyImg,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
          ],
          shape: Border(bottom: BorderSide(color: kBorderColor, width: 1.0)),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: const BouncingScrollPhysics(),
          children: [
            MyText(
              text: 'Straight Play',
              size: 14,
              weight: FontWeight.w700,
              paddingBottom: 8,
            ),
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
                      Image.asset(Assets.imagesLy, height: 24),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyText(
                              text: 'Lamine Yamal',
                              size: 13,
                              weight: FontWeight.w700,
                            ),
                            MyText(
                              paddingTop: 2,
                              text: '1.5 Shots on target | BCN vs RMA',
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
                  MyBorderButton(
                    radius: 12,
                    height: 42,
                    textSize: 14,
                    weight: FontWeight.w500,
                    bgColor: kSecondaryColor.withValues(alpha: 0.1),
                    textColor: kSecondaryColor,
                    buttonText: 'Generate Link',
                    onTap: () {},
                  ),
                ],
              ),
            ),

            MyText(
              paddingTop: 16,
              text: 'Parlay',
              size: 14,
              weight: FontWeight.w700,
              paddingBottom: 8,
            ),
            Container(
              padding: EdgeInsets.all(10),
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
                      height: 28,
                      width: 28,
                      radius: 100,
                      url: dummyImg,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          text: 'Lamine Yamal',
                          size: 13,
                          weight: FontWeight.w700,
                        ),
                        MyText(
                          paddingTop: 2,
                          text: '20.5 points | Clippers @Lakers',
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
            ),

            MyText(
              paddingTop: 16,
              text: 'Same Game Parlay',
              size: 14,
              weight: FontWeight.w700,
              paddingBottom: 8,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => Odds());
              },
              child: Container(
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
                    Container(
                      height: 1,
                      color: kBorderColor,
                      margin: EdgeInsets.symmetric(vertical: 12),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Image.asset(Assets.imagesStepper, height: 114),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            spacing: 14,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ...List.generate(3, (index) {
                                final items = [
                                  {
                                    'player': 'Lamine Yamal',
                                    'description':
                                        'Player to have 3 more shots on target',
                                  },
                                  {
                                    'player': 'Barcelona',
                                    'description': 'Money Line',
                                  },
                                  {
                                    'player': 'Kylion Mbappe',
                                    'description': 'To score or assist',
                                  },
                                ];
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    MyText(
                                      text: items[index]['player']!,
                                      weight: FontWeight.w700,
                                    ),
                                    MyText(
                                      paddingTop: 4,
                                      text: items[index]['description']!,
                                      size: 12,
                                      weight: FontWeight.w500,
                                      color: kQuaternaryColor,
                                    ),
                                  ],
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14),
                    MyBorderButton(
                      radius: 12,
                      height: 42,
                      textSize: 14,
                      weight: FontWeight.w500,
                      bgColor: kSecondaryColor.withValues(alpha: 0.1),
                      textColor: kSecondaryColor,
                      buttonText: 'Generate Link',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
