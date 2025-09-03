import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/main.dart';
import 'package:game_grid/view/widget/common_image_view_widget.dart';
import 'package:game_grid/view/widget/custom_drop_down_widget.dart';
import 'package:game_grid/view/widget/custom_slider_thumb_widget.dart';
import 'package:game_grid/view/widget/custom_slider_tool_tip.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Players extends StatelessWidget {
  const Players({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.HORIZONTAL,
      physics: BouncingScrollPhysics(),
      children: [
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: MyDropDown(
                havePrefix: false,
                prefixIcon: '',
                hint: 'Last 5 match...',
                items: ['Last 5 match...'],
                onChanged: (value) {},
                selectedValue: 'Last 5 match...',
              ),
            ),
            Expanded(
              child: MyDropDown(
                havePrefix: false,
                prefixIcon: '',
                hint: 'Select',
                items: ['Select'],
                onChanged: (value) {},
                selectedValue: 'Select',
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.bottomSheet(_Filter(), isScrollControlled: true);
              },
              child: Image.asset(Assets.imagesFilters, height: 36),
            ),
          ],
        ),
        SizedBox(height: 12),
        ListView.separated(
          itemCount: 10,
          padding: AppSizes.ZERO,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 12);
          },
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kFillColor,
                gradient: LinearGradient(
                  stops: [0.1, 0.9],
                  colors: index.isOdd
                      ? [
                          kRedColor2.withValues(alpha: 0),
                          kRedColor2.withValues(alpha: 0.2),
                        ]
                      : [
                          kGreenColor2.withValues(alpha: 0),
                          kGreenColor2.withValues(alpha: 0.2),
                        ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                border: Border.all(width: 1.0, color: kBorderColor),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1.0,
                                color: kTertiaryColor,
                              ),
                            ),
                            child: CommonImageView(
                              height: 24,
                              width: 24,
                              radius: 100,
                              url: dummyImg,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Image.asset(Assets.imagesPlayer, height: 10),
                          ),
                        ],
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
                              text: 'Under 20.5 pts+ Ast',
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var i = 0; i < 6; i++) ...[
                        Column(
                          children: [
                            MyText(
                              text: [
                                'H2H',
                                'L5',
                                'L10',
                                'L20',
                                '24-25',
                                '23-25',
                              ][i],
                              size: 10,
                              weight: FontWeight.w500,
                              color: kQuaternaryColor,
                              paddingBottom: 4,
                            ),
                            MyText(
                              text: [
                                '67%',
                                '62%',
                                '90%',
                                '60%',
                                '66%',
                                '25%',
                              ][i],
                              size: 12,
                              color: [
                                kGreenColor,
                                kYellowColor2,
                                kGreenColor,
                                kYellowColor2,
                                kYellowColor2,
                                kRedColor2,
                              ][i],
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                        if (i < 5)
                          Container(
                            width: 1,
                            height: 28,
                            color: kBorderColor,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                          ),
                      ],
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(height: 40),
      ],
    );
  }
}

class _Filter extends StatefulWidget {
  @override
  State<_Filter> createState() => _FilterState();
}

double _lowerOdds = 0;
double _higherOdds = 60;

double _lowerHitRate = 0;
double _higherHitRate = 100;

class _FilterState extends State<_Filter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      height: Get.height * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 25),
              height: 4,
              width: 32,
              decoration: BoxDecoration(
                color: kTertiaryColor.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          MyText(
            text: 'Apply Filters',
            size: 16,
            paddingLeft: 20,
            weight: FontWeight.w500,
            paddingBottom: 16,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: AppSizes.HORIZONTAL,
              physics: BouncingScrollPhysics(),
              children: [
                MyDropDown(
                  height: 44,
                  textSize: 14,
                  iconSize: 24,
                  horizontalPadding: 12,
                  havePrefix: false,
                  hint: 'Select Game',
                  items: ['Select Game'],
                  selectedValue: 'Select Game',
                  onChanged: (v) {},
                  prefixIcon: '',
                ),
                SizedBox(height: 8),
                Container(
                  height: 44,
                  padding: EdgeInsets.symmetric(horizontal: 12),
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
                      Expanded(
                        child: MyText(
                          text: 'Playing Today',
                          size: 14,
                          weight: FontWeight.w500,
                          color: kTertiaryColor,
                        ),
                      ),
                      AdvancedSwitch(
                        // controller: controller,
                        activeColor: kSecondaryColor,
                        inactiveColor: const Color(0xffDADADA),
                        activeChild: Image.asset(Assets.imagesOn, height: 6.45),
                        inactiveChild: Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: Image.asset(Assets.imagesOff, height: 6.45),
                        ),
                        borderRadius: BorderRadius.circular(50),
                        width: 30.0,
                        height: 20.0,
                        enabled: true,
                        disabledOpacity: 0.5,
                        onChanged: (newValue) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                MyDropDown(
                  height: 44,
                  textSize: 14,
                  iconSize: 24,
                  horizontalPadding: 12,
                  havePrefix: false,
                  hint: 'Select Stats Type',
                  items: ['Select Stats Type'],
                  selectedValue: 'Select Stats Type',
                  onChanged: (v) {},
                  prefixIcon: '',
                ),
                MyText(
                  paddingTop: 16,
                  text: 'Over and Under',
                  size: 14,
                  weight: FontWeight.w500,
                  paddingBottom: 12,
                ),
                Row(
                  spacing: 8,
                  children: List.generate(3, (index) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 36,
                          decoration: BoxDecoration(
                            color: index == 1
                                ? kSecondaryColor.withValues(alpha: 0.1)
                                : kFillColor,
                            border: Border.all(
                              width: 1.0,
                              color: index == 1
                                  ? kSecondaryColor
                                  : kBorderColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: MyText(
                              weight: FontWeight.w500,
                              text: index == 0
                                  ? 'All'
                                  : index == 1
                                  ? 'Over'
                                  : 'Under',
                              color: index == 1
                                  ? kSecondaryColor
                                  : kTertiaryColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                MyText(
                  paddingTop: 16,
                  text: 'Odds',
                  size: 14,
                  weight: FontWeight.w500,
                  paddingBottom: 12,
                ),
                // Odds slider
                Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Color(0xff272924).withValues(alpha: 0.6),
                    border: Border.all(
                      width: 1,
                      color: kTertiaryColor.withValues(alpha: 0.08),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: FlutterSlider(
                    values: [_lowerOdds, _higherOdds],
                    rangeSlider: true,
                    min: 0,
                    max: 60,
                    tooltip: CustomSliderToolTip(),
                    handler: FlutterSliderHandler(
                      decoration: BoxDecoration(),
                      child: CustomSliderThumb(),
                    ),
                    rightHandler: FlutterSliderHandler(
                      decoration: BoxDecoration(),
                      child: CustomSliderThumb(),
                    ),
                    trackBar: FlutterSliderTrackBar(
                      activeTrackBarHeight: 6,
                      inactiveTrackBarHeight: 6,
                      activeTrackBar: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      inactiveTrackBar: BoxDecoration(
                        color: Color(0xff3F413C),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      setState(() {
                        _lowerOdds = lowerValue;
                        _higherOdds = upperValue;
                      });
                    },
                  ),
                ),
                MyText(
                  paddingTop: 16,
                  text:
                      'Hit Rate Range ${_lowerHitRate.toInt()}% - ${_higherHitRate.toInt()}%',
                  size: 14,
                  weight: FontWeight.w500,
                  paddingBottom: 12,
                ),
                // Hit Rate slider
                Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Color(0xff272924).withValues(alpha: 0.6),
                    border: Border.all(
                      width: 1,
                      color: kTertiaryColor.withValues(alpha: 0.08),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: FlutterSlider(
                    values: [_lowerHitRate, _higherHitRate],
                    rangeSlider: true,
                    min: 0,
                    max: 100,
                    tooltip: CustomSliderToolTip(),
                    handler: FlutterSliderHandler(
                      decoration: BoxDecoration(),
                      child: CustomSliderThumb(),
                    ),
                    rightHandler: FlutterSliderHandler(
                      decoration: BoxDecoration(),
                      child: CustomSliderThumb(),
                    ),
                    trackBar: FlutterSliderTrackBar(
                      activeTrackBarHeight: 6,
                      inactiveTrackBarHeight: 6,
                      activeTrackBar: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      inactiveTrackBar: BoxDecoration(
                        color: Color(0xff3F413C),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      setState(() {
                        _lowerHitRate = lowerValue;
                        _higherHitRate = upperValue;
                      });
                    },
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
          Padding(
            padding: AppSizes.DEFAULT,
            child: Row(
              spacing: 10,
              children: [
                Expanded(
                  child: MyBorderButton(
                    buttonText: 'Clear all',
                    onTap: () {},
                    borderColor: kBorderColor,
                    bgColor: kFillColor,
                    textColor: kQuaternaryColor,
                    radius: 12,
                  ),
                ),
                Expanded(
                  child: MyButton(
                    buttonText: 'Apply Filters',
                    onTap: () {},
                    radius: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
