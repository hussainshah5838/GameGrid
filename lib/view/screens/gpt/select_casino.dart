import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/widget/custom_app_bar.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/custom_drop_down_widget.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';

class SelectCasino extends StatelessWidget {
  const SelectCasino({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Select Casino'),
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
          ],
        ),
      ),
    );
  }
}
