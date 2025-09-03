import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_fonts.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/main.dart';
import 'package:game_grid/view/widget/common_image_view_widget.dart';
import 'package:game_grid/view/widget/custom_check_box_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Details extends StatelessWidget {
  final List<Map<String, dynamic>> _stats = [
    {
      'leading': '2.55',
      'title': 'Expected goals (xG)',
      'trailing': '0.69',
      'progress': 0.79,
      'oppositeProgress': 0.21,
    },
    {
      'leading': '21',
      'title': 'Total shots',
      'trailing': '10',
      'progress': 0.68,
      'oppositeProgress': 0.32,
    },
    {
      'leading': '12',
      'title': 'Shots on target',
      'trailing': '5',
      'progress': 0.71,
      'oppositeProgress': 0.29,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.DEFAULT,
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          decoration: BoxDecoration(
            color: kFillColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: kBorderColor, width: 1.0),
          ),
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: MyText(
                      text: 'Full Time',
                      size: 14,
                      weight: FontWeight.w700,
                    ),
                  ),
                  MyText(
                    onTap: () {
                      Get.bottomSheet(
                        _AdditionalOdds(),
                        isScrollControlled: true,
                      );
                    },
                    text: 'Additional odds',
                    size: 14,
                    weight: FontWeight.w500,
                    color: kSecondaryColor,
                  ),
                ],
              ),
              Container(
                height: 1,
                color: kBorderColor,
                margin: EdgeInsets.symmetric(vertical: 12),
              ),
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: kFillColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1.0, color: kBorderColor),
                      ),
                      child: Row(
                        children: [
                          MyText(
                            text: '1',
                            size: 12,
                            weight: FontWeight.w500,
                            color: kQuaternaryColor,
                          ),
                          Expanded(
                            child: MyText(
                              text: '-143',
                              size: 14,
                              weight: FontWeight.w500,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: kFillColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1.0, color: kBorderColor),
                      ),
                      child: Row(
                        children: [
                          MyText(
                            text: 'x',
                            size: 12,
                            weight: FontWeight.w500,
                            color: kQuaternaryColor,
                          ),
                          Expanded(
                            child: MyText(
                              text: '+240',
                              size: 14,
                              weight: FontWeight.w500,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: kFillColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1.0, color: kBorderColor),
                      ),
                      child: Row(
                        children: [
                          MyText(
                            text: '2',
                            size: 12,
                            weight: FontWeight.w500,
                            color: kQuaternaryColor,
                          ),
                          Expanded(
                            child: MyText(
                              text: '+110',
                              size: 14,
                              weight: FontWeight.w500,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: kFillColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: kBorderColor, width: 1.0),
          ),
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(
                textAlign: TextAlign.center,
                text: 'Momentum',
                size: 12,
                color: kQuaternaryColor,
                weight: FontWeight.w500,
                paddingBottom: 10,
              ),
              SizedBox(
                height: 80,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Assets.imagesLy, height: 18),
                        SizedBox(height: 14),
                        Image.asset(Assets.imagesRd, height: 18),
                      ],
                    ),
                    SizedBox(width: 8),
                    Expanded(child: _Chart()),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                spacing: 6,
                children: [
                  MyText(text: '0’', size: 12, weight: FontWeight.w500),
                  Expanded(child: Image.asset(Assets.imagesDottedBorder)),
                  MyText(text: 'HT', size: 12, weight: FontWeight.w500),
                  Expanded(child: Image.asset(Assets.imagesDottedBorder2)),
                  MyText(text: 'HT', size: 12, weight: FontWeight.w500),
                ],
              ),
              MyText(
                paddingTop: 10,
                textAlign: TextAlign.center,
                text: 'Ball Possession',
                size: 12,
                color: kQuaternaryColor,
                weight: FontWeight.w500,
                paddingBottom: 10,
              ),

              SfLinearGauge(
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                animateAxis: true,
                showAxisTrack: false,
                axisTrackStyle: LinearAxisTrackStyle(
                  thickness: 8,
                  edgeStyle: LinearEdgeStyle.bothCurve,
                  color: kTertiaryColor.withValues(alpha: 0.08),
                ),

                ranges: [
                  LinearGaugeRange(
                    startWidth: 32,
                    endWidth: 32,
                    startValue: 0,
                    endValue: 37.5,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: '47%',
                        paddingLeft: 10,
                        size: 14,
                        color: kRedColor,
                        weight: FontWeight.w500,
                      ),
                    ),
                    color: kRedColor.withValues(alpha: 0.5),
                    edgeStyle: LinearEdgeStyle.startCurve,
                  ),
                  LinearGaugeRange(
                    startWidth: 32,
                    endWidth: 32,
                    startValue: 39,
                    endValue: 100,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: MyText(
                        text: '53%',
                        paddingRight: 10,
                        size: 14,
                        color: kGreenColor2,
                        weight: FontWeight.w500,
                      ),
                    ),
                    color: kGreenColor2.withValues(alpha: 0.5),
                    edgeStyle: LinearEdgeStyle.endCurve,
                  ),
                ],
              ),
              SizedBox(height: 10),
              ...List.generate(_stats.length, (index) {
                final stat = _stats[index];
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == _stats.length - 1 ? 0 : 8,
                  ),
                  child: _StatsTile(
                    leading: stat['leading'],
                    title: stat['title'],
                    trailing: stat['trailing'],
                    progress: stat['progress'],
                    oppositeProgress: stat['oppositeProgress'],
                  ),
                );
              }),
            ],
          ),
        ),

        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: kFillColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: kBorderColor, width: 1.0),
          ),
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                spacing: 8,
                children: [
                  MyText(text: '2’', size: 12, weight: FontWeight.w700),
                  Image.asset(Assets.imagesFootball, height: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: kTertiaryColor,
                              fontFamily: AppFonts.Satoshi,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(text: 'Lamine Yamal ('),
                              TextSpan(
                                text: '1',
                                style: TextStyle(color: kGreenColor3),
                              ),
                              TextSpan(text: ' - 0)'),
                            ],
                          ),
                        ),
                        MyText(
                          paddingTop: 2,
                          text: 'Assist by Pedri',
                          size: 12,
                          color: kQuaternaryColor,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 8,
                children: [
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        style: TextStyle(
                          color: kTertiaryColor,
                          fontFamily: AppFonts.Satoshi,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(text: 'Kylian Mbappe '),
                          TextSpan(text: '(1 - '),
                          TextSpan(
                            text: '1',
                            style: TextStyle(color: kGreenColor3),
                          ),
                          TextSpan(text: ')'),
                        ],
                      ),
                    ),
                  ),
                  Image.asset(Assets.imagesFootball, height: 24),
                  MyText(text: '8’', size: 12, weight: FontWeight.w700),
                ],
              ),
              SizedBox(height: 16),
              Row(
                spacing: 8,
                children: [
                  MyText(text: '26’', size: 12, weight: FontWeight.w700),
                  Image.asset(Assets.imagesBarYellow, height: 24),
                  Expanded(
                    child: MyText(
                      text: 'Alex Freeman',
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: MyText(
                      text: 'Maximiliano Falcon',
                      size: 14,
                      textAlign: TextAlign.end,
                      weight: FontWeight.w500,
                    ),
                  ),
                  Image.asset(Assets.imagesBarYellow, height: 24),
                  MyText(text: '36’', size: 12, weight: FontWeight.w700),
                ],
              ),
              SizedBox(height: 16),
              Row(
                spacing: 8,
                children: [
                  MyText(text: '82’', size: 12, weight: FontWeight.w700),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(Assets.imagesNext, height: 16),
                            Expanded(
                              child: MyText(
                                paddingLeft: 4,
                                text: 'Ramiro Enrique',
                                size: 14,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Image.asset(Assets.imagesBack, height: 16),
                            Expanded(
                              child: MyText(
                                paddingLeft: 4,
                                text: 'Luis Muriel',
                                size: 14,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),
              Row(
                spacing: 8,
                children: [
                  MyText(text: '82’', size: 12, weight: FontWeight.w700),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(Assets.imagesNext, height: 16),
                            Expanded(
                              child: MyText(
                                paddingLeft: 4,
                                text: 'Kyle Smith',
                                size: 14,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Image.asset(Assets.imagesBack, height: 16),
                            Expanded(
                              child: MyText(
                                paddingLeft: 4,
                                text: 'Eduard Atuesta',
                                size: 14,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),
              Row(
                spacing: 8,
                children: [
                  Spacer(flex: 5),
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: MyText(
                                paddingRight: 4,
                                text: 'Federico Redondo',
                                size: 14,
                                weight: FontWeight.w500,
                              ),
                            ),
                            Image.asset(Assets.imagesNext, height: 16),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Expanded(
                              child: MyText(
                                paddingRight: 4,
                                text: 'Yannick Bright',
                                size: 14,
                                weight: FontWeight.w500,
                              ),
                            ),
                            Image.asset(Assets.imagesBack, height: 16),
                          ],
                        ),
                      ],
                    ),
                  ),
                  MyText(text: '82’', size: 12, weight: FontWeight.w700),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        _majorLeagueScore(),
        SizedBox(height: 8),
        _teamForm(),
        SizedBox(height: 8),
        _headToHead(),
        SizedBox(height: 8),
        _topRated(),
        SizedBox(height: 8),
        _insights(),
      ],
    );
  }

  Container _majorLeagueScore() {
    return Container(
      decoration: BoxDecoration(
        color: kFillColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kBorderColor, width: 1.0),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            text: 'Major League Soccer',
            size: 14,
            weight: FontWeight.w700,
          ),
          Container(
            height: 1,
            color: kBorderColor,
            margin: EdgeInsets.symmetric(vertical: 12),
          ),
          Row(
            spacing: 20,
            children: [
              Spacer(flex: 4),
              Expanded(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(7, (index) {
                    final columns = ['PL', 'W', 'D', 'L', '+/-', 'GD', 'PTS'];
                    return MyText(
                      text: columns[index],
                      size: 10,
                      color: kQuaternaryColor,
                      weight: FontWeight.w600,
                    );
                  }),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            spacing: 20,
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    MyText(
                      text: '4',
                      size: 10,
                      weight: FontWeight.w600,
                      paddingRight: 8,
                    ),
                    Image.asset(Assets.imagesFc, height: 20),
                    MyText(
                      text: 'FC Barcelona',
                      paddingLeft: 4,
                      size: 10,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(7, (index) {
                    final columns = [
                      '26',
                      '12',
                      '8',
                      '6',
                      '50-34',
                      '+16',
                      '44',
                    ];
                    return MyText(
                      text: columns[index],
                      size: 10,
                      weight: FontWeight.w600,
                    );
                  }),
                ),
              ),
            ],
          ),

          SizedBox(height: 10),
          Row(
            spacing: 20,
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    MyText(
                      text: '6',
                      size: 10,
                      weight: FontWeight.w600,
                      paddingRight: 8,
                    ),
                    Image.asset(Assets.imagesRd, height: 20),
                    MyText(
                      text: 'Real Madrid',
                      paddingLeft: 4,
                      size: 10,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(7, (index) {
                    final columns = [
                      '26',
                      '12',
                      '8',
                      '6',
                      '50-34',
                      '+16',
                      '44',
                    ];
                    return MyText(
                      text: columns[index],
                      size: 10,
                      weight: FontWeight.w600,
                    );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _teamForm() {
    return Container(
      decoration: BoxDecoration(
        color: kFillColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kBorderColor, width: 1.0),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(text: 'Team Form', size: 14, weight: FontWeight.w700),
          Container(
            height: 1,
            color: kBorderColor,
            margin: EdgeInsets.symmetric(vertical: 12),
          ),
          Row(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: 3,
                  padding: AppSizes.ZERO,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      spacing: 10,
                      children: [
                        Image.asset(Assets.imagesLy, height: 22),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: index == 1
                                ? kTertiaryColor.withValues(alpha: 0.5)
                                : kRedColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: MyText(
                              text: '1-2',
                              size: 12,
                              weight: FontWeight.w500,
                              paddingTop: 1,
                            ),
                          ),
                        ),
                        Image.asset(Assets.imagesRd, height: 22),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                ),
              ),

              Expanded(
                child: ListView.separated(
                  itemCount: 3,
                  padding: AppSizes.ZERO,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 10,
                      children: [
                        Image.asset(Assets.imagesLy, height: 22),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: index == 1
                                ? kTertiaryColor.withValues(alpha: 0.5)
                                : kGreenColor2,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: MyText(
                              text: '1-2',
                              size: 12,
                              weight: FontWeight.w500,
                              paddingTop: 1,
                            ),
                          ),
                        ),
                        Image.asset(Assets.imagesRd, height: 22),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _headToHead() {
    return Container(
      decoration: BoxDecoration(
        color: kFillColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kBorderColor, width: 1.0),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: MyText(
                  text: 'Head-to-Head',
                  size: 14,
                  weight: FontWeight.w700,
                ),
              ),
              MyText(
                text: 'Last 10 matches',
                size: 12,
                color: kQuaternaryColor,
                weight: FontWeight.w500,
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
                child: Row(
                  spacing: 8,
                  children: [
                    Image.asset(Assets.imagesFc, height: 36),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: '5',
                          size: 16,
                          color: kGreenColor3,
                          weight: FontWeight.w700,
                          paddingBottom: 4,
                        ),
                        MyText(
                          text: 'FC Barcelona',
                          size: 12,
                          color: kQuaternaryColor,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 8,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyText(
                          text: '3',
                          size: 16,
                          color: kRedColor2,
                          weight: FontWeight.w700,
                          paddingBottom: 4,
                        ),
                        MyText(
                          text: 'Real Madrid',
                          size: 12,
                          color: kQuaternaryColor,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Image.asset(Assets.imagesRd, height: 36),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _insights() {
    return Container(
      decoration: BoxDecoration(
        color: kFillColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kBorderColor, width: 1.0),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: MyText(
                  text: 'Insights',
                  size: 14,
                  weight: FontWeight.w700,
                ),
              ),
              CustomCheckBox(isActive: false, onTap: () {}),
              MyText(
                text: 'Bristol U21',
                size: 12,
                weight: FontWeight.w500,
                paddingLeft: 8,
                paddingRight: 8,
              ),
              CustomCheckBox(isActive: false, onTap: () {}),
              MyText(
                text: 'Wolves U21',
                size: 12,
                weight: FontWeight.w500,
                paddingLeft: 8,
              ),
            ],
          ),
          Container(
            height: 1,
            color: kBorderColor,
            margin: EdgeInsets.symmetric(vertical: 12),
          ),
          ListView.separated(
            itemCount: 3,
            shrinkWrap: true,
            padding: AppSizes.ZERO,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final insights = [
                'Have score 6 goals in their last 5 matches.',
                'Haven’t kept a clean sheet in 9 matches.',
                'Luca Petrasso has create the most big chances for CF Montreal (6)',
              ];
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: kSecondaryColor, width: 2),
                  ),
                  color: kTertiaryColor.withValues(alpha: 0.05),
                ),
                child: MyText(
                  text: insights[index],
                  size: 12,
                  weight: FontWeight.w500,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 8);
            },
          ),
        ],
      ),
    );
  }

  Container _topRated() {
    return Container(
      decoration: BoxDecoration(
        color: kFillColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kBorderColor, width: 1.0),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(text: 'Top Rated', size: 14, weight: FontWeight.w700),
          Container(
            height: 1,
            color: kBorderColor,
            margin: EdgeInsets.symmetric(vertical: 12),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  spacing: 8,
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
                            height: 36,
                            width: 36,
                            radius: 100,
                            url: dummyImg,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 14.4,
                            width: 14.4,
                            decoration: BoxDecoration(
                              color: kFillColor,
                              border: Border.all(
                                width: 0.79,
                                color: kTertiaryColor,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(Assets.imagesLy, height: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Fermín (9.5)',
                          size: 14,
                          weight: FontWeight.w500,
                          paddingBottom: 2,
                        ),
                        MyText(
                          text: 'Midfielder',
                          size: 12,
                          color: kQuaternaryColor,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 8,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Fermín (9.5)',
                          size: 14,
                          weight: FontWeight.w500,
                          paddingBottom: 2,
                        ),
                        MyText(
                          text: 'Midfielder',
                          size: 12,
                          color: kQuaternaryColor,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
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
                            height: 36,
                            width: 36,
                            radius: 100,
                            url: dummyImg,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 14.4,
                            width: 14.4,
                            decoration: BoxDecoration(
                              color: kFillColor,
                              border: Border.all(
                                width: 0.79,
                                color: kTertiaryColor,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(Assets.imagesLy, height: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: Row(
                  spacing: 8,
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
                            height: 36,
                            width: 36,
                            radius: 100,
                            url: dummyImg,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 14.4,
                            width: 14.4,
                            decoration: BoxDecoration(
                              color: kFillColor,
                              border: Border.all(
                                width: 0.79,
                                color: kTertiaryColor,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(Assets.imagesLy, height: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Fermín (9.5)',
                          size: 14,
                          weight: FontWeight.w500,
                          paddingBottom: 2,
                        ),
                        MyText(
                          text: 'Midfielder',
                          size: 12,
                          color: kQuaternaryColor,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 8,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Fermín (9.5)',
                          size: 14,
                          weight: FontWeight.w500,
                          paddingBottom: 2,
                        ),
                        MyText(
                          text: 'Midfielder',
                          size: 12,
                          color: kQuaternaryColor,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
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
                            height: 36,
                            width: 36,
                            radius: 100,
                            url: dummyImg,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 14.4,
                            width: 14.4,
                            decoration: BoxDecoration(
                              color: kFillColor,
                              border: Border.all(
                                width: 0.79,
                                color: kTertiaryColor,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(Assets.imagesLy, height: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AdditionalOdds extends StatefulWidget {
  @override
  State<_AdditionalOdds> createState() => _AdditionalOddsState();
}

class _AdditionalOddsState extends State<_AdditionalOdds> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      height: Get.height * 0.9,
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
          Row(
            children: [
              Expanded(
                child: MyText(
                  text: 'Additional Odds',
                  size: 16,
                  paddingLeft: 20,
                  weight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 22),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: AppSizes.HORIZONTAL,
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: kFillColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kBorderColor, width: 1.0),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MyText(
                        text: 'Full Time',
                        size: 14,
                        weight: FontWeight.w500,
                        paddingBottom: 10,
                      ),
                      Row(
                        spacing: 8,
                        children: List.generate(3, (index) {
                          return Expanded(
                            child: _OddButton(
                              leading: index == 0
                                  ? '1'
                                  : index == 1
                                  ? 'X'
                                  : '2',
                              value: index == 0
                                  ? '-143'
                                  : index == 1
                                  ? '+290'
                                  : '+375',
                              imagesGoingDown: true,
                              isSelected: index == 0,
                              onTap: () {},
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: kFillColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kBorderColor, width: 1.0),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MyText(
                        text: 'Double Chance',
                        size: 14,
                        weight: FontWeight.w500,
                        paddingBottom: 10,
                      ),
                      Row(
                        spacing: 8,
                        children: List.generate(3, (index) {
                          return Expanded(
                            child: _OddButton(
                              leading: index == 0
                                  ? '1x'
                                  : index == 1
                                  ? 'x2'
                                  : '1.2',
                              value: index == 0
                                  ? '-143'
                                  : index == 1
                                  ? '+290'
                                  : '+375',
                              imagesGoingDown: index == 0,
                              isSelected: index == 0 || index == 2,
                              onTap: () {},
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: kFillColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kBorderColor, width: 1.0),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MyText(
                        text: '1st Half',
                        size: 14,
                        weight: FontWeight.w500,
                        paddingBottom: 10,
                      ),
                      Row(
                        spacing: 8,
                        children: List.generate(3, (index) {
                          return Expanded(
                            child: _OddButton(
                              leading: index == 0
                                  ? '1'
                                  : index == 1
                                  ? 'X'
                                  : '2',
                              value: index == 0
                                  ? '-143'
                                  : index == 1
                                  ? '+290'
                                  : '+375',
                              imagesGoingDown: index != 1,
                              isSelected: index == 0,
                              onTap: () {},
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: kFillColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kBorderColor, width: 1.0),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MyText(
                        text: 'Draw no bet',
                        size: 14,
                        weight: FontWeight.w500,
                        paddingBottom: 10,
                      ),
                      Row(
                        spacing: 8,
                        children: List.generate(2, (index) {
                          return Expanded(
                            child: _OddButton(
                              leading: index == 0 ? '1' : '2',
                              value: index == 0 ? '-143' : '+375',
                              imagesGoingDown: false,
                              isSelected: index == 0,
                              onTap: () {},
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: kFillColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kBorderColor, width: 1.0),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MyText(
                        text: 'Both teams to score',
                        size: 14,
                        weight: FontWeight.w500,
                        paddingBottom: 10,
                      ),
                      Row(
                        spacing: 8,
                        children: List.generate(2, (index) {
                          return Expanded(
                            child: _OddButton(
                              leading: index == 0 ? 'Yes' : 'No',
                              value: index == 0 ? '-143' : '+375',
                              imagesGoingDown: true,
                              isSelected: index == 1,
                              onTap: () {},
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14),
                MyText(
                  text: 'Both teams to score',
                  size: 14,
                  weight: FontWeight.w500,
                  paddingBottom: 10,
                ),
                Row(
                  spacing: 12,
                  children: [
                    Expanded(child: SizedBox()),
                    Expanded(
                      child: MyText(
                        text: 'Over',
                        size: 12,
                        textAlign: TextAlign.center,
                        weight: FontWeight.w500,
                        color: kTertiaryColor.withValues(alpha: 0.5),
                      ),
                    ),
                    Expanded(
                      child: MyText(
                        text: 'Under',
                        size: 12,
                        textAlign: TextAlign.center,
                        weight: FontWeight.w500,
                        color: kTertiaryColor.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      spacing: 12,
                      children: [
                        Expanded(
                          child: MyText(
                            text: '0.5',
                            size: 12,
                            textAlign: TextAlign.center,
                            weight: FontWeight.w500,
                            color: kTertiaryColor.withValues(alpha: 0.5),
                          ),
                        ),
                        Expanded(
                          child: _OddButton(
                            leading: 'Yes',
                            value: '-2500',
                            haveLeading: false,
                            imagesGoingDown: false,
                            isSelected: true,
                            onTap: () {},
                          ),
                        ),
                        Expanded(
                          child: _OddButton(
                            leading: 'No',
                            haveLeading: false,
                            value: '+1100',
                            imagesGoingDown: true,
                            isSelected: false,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      spacing: 12,
                      children: [
                        Expanded(
                          child: MyText(
                            text: '1.5',
                            size: 12,
                            textAlign: TextAlign.center,
                            weight: FontWeight.w500,
                            color: kTertiaryColor.withValues(alpha: 0.5),
                          ),
                        ),
                        Expanded(
                          child: _OddButton(
                            leading: 'Yes',
                            value: '+290',
                            haveLeading: false,
                            imagesGoingDown: true,
                            isSelected: true,
                            onTap: () {},
                          ),
                        ),
                        Expanded(
                          child: _OddButton(
                            leading: 'No',
                            haveLeading: false,
                            value: '+375',
                            imagesGoingDown: false,
                            isSelected: false,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      spacing: 12,
                      children: [
                        Expanded(
                          child: MyText(
                            text: '-2.5',
                            size: 12,
                            textAlign: TextAlign.center,
                            weight: FontWeight.w500,
                            color: kTertiaryColor.withValues(alpha: 0.5),
                          ),
                        ),
                        Expanded(
                          child: _OddButton(
                            leading: 'Yes',
                            value: '+290',
                            haveLeading: false,
                            imagesGoingDown: false,
                            isSelected: false,
                            onTap: () {},
                          ),
                        ),
                        Expanded(
                          child: _OddButton(
                            leading: 'No',
                            haveLeading: false,
                            value: '+375',
                            imagesGoingDown: true,
                            isSelected: true,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      spacing: 12,
                      children: [
                        Expanded(
                          child: MyText(
                            text: '3.5',
                            size: 12,
                            textAlign: TextAlign.center,
                            weight: FontWeight.w500,
                            color: kTertiaryColor.withValues(alpha: 0.5),
                          ),
                        ),
                        Expanded(
                          child: _OddButton(
                            leading: 'Yes',
                            value: '+290',
                            haveLeading: false,
                            imagesGoingDown: false,
                            isSelected: false,
                            onTap: () {},
                          ),
                        ),
                        Expanded(
                          child: _OddButton(
                            leading: 'No',
                            haveLeading: false,
                            value: '+375',
                            imagesGoingDown: true,
                            isSelected: true,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OddButton extends StatelessWidget {
  const _OddButton({
    required this.leading,
    required this.value,
    required this.imagesGoingDown,
    required this.isSelected,
    required this.onTap,
    this.haveLeading = true,
  });

  final String leading, value;
  final bool imagesGoingDown;
  final bool isSelected;
  final bool? haveLeading;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? kSecondaryColor.withValues(alpha: .1) : kFillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1.0,
          color: isSelected ? kSecondaryColor : kBorderColor,
        ),
      ),
      child: Row(
        children: [
          if (haveLeading!)
            MyText(
              text: leading,
              size: 12,
              weight: FontWeight.w500,
              color: kQuaternaryColor,
            ),
          Expanded(
            child: Row(
              mainAxisAlignment: haveLeading!
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  imagesGoingDown
                      ? Assets.imagesGoingDown
                      : Assets.imagesGoingUp,
                  height: 5,
                ),
                MyText(
                  paddingLeft: 6,
                  text: value,
                  size: 12,
                  weight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsTile extends StatelessWidget {
  const _StatsTile({
    required this.leading,
    required this.title,
    required this.trailing,
    required this.progress,
    required this.oppositeProgress,
  });

  final String leading;
  final String title;
  final String trailing;
  final double progress;
  final double oppositeProgress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(text: leading, size: 12, weight: FontWeight.w500),
            MyText(text: title, size: 12, weight: FontWeight.w500),
            MyText(text: trailing, size: 12, weight: FontWeight.w500),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: LinearPercentIndicator(
                lineHeight: 4,
                padding: AppSizes.ZERO,
                percent: progress,
                backgroundColor: kTertiaryColor.withValues(alpha: 0.08),
                progressColor: kGreenColor3,
                barRadius: Radius.circular(50),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: LinearPercentIndicator(
                lineHeight: 4,
                padding: AppSizes.ZERO,
                percent: oppositeProgress,
                backgroundColor: kTertiaryColor.withValues(alpha: 0.08),
                progressColor: kRedColor2,
                barRadius: Radius.circular(50),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Chart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      backgroundColor: Colors.transparent,
      plotAreaBackgroundColor: Colors.transparent,
      borderWidth: 0,
      plotAreaBorderColor: Colors.transparent,
      plotAreaBorderWidth: 0,
      borderColor: Colors.transparent,
      primaryXAxis: CategoryAxis(
        isVisible: false,
        borderColor: Colors.transparent,
        majorTickLines: MajorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        isVisible: true,
        borderWidth: 0,
        axisLine: AxisLine(width: 0, color: Colors.transparent),
        borderColor: Colors.transparent,
        labelStyle: const TextStyle(fontSize: 0),
        majorTickLines: MajorTickLines(width: 0),
        minorTickLines: MinorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
        plotBands: <PlotBand>[
          PlotBand(
            borderWidth: 0,
            borderColor: Colors.transparent,
            isVisible: true,
            start: 0,
            end: 20,
            // adjust as needed
            color: kGreenColor2.withValues(alpha: 0.1),
          ),
          PlotBand(
            borderWidth: 0,
            borderColor: Colors.transparent,
            isVisible: true,
            start: -20,
            end: 0,
            color: kRedColor.withValues(alpha: 0.1),
          ),
        ],
      ),

      series: <CartesianSeries>[
        ColumnSeries<ChartData, String>(
          dataSource: getChartData(),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          pointColorMapper: (ChartData data, _) =>
              data.y >= 0 ? kGreenColor2 : kRedColor,
          spacing: 0.75,
        ),
      ],
      annotations: <CartesianChartAnnotation>[
        CartesianChartAnnotation(
          widget: Column(
            children: [
              Icon(Icons.circle, color: Colors.red, size: 8),
              Expanded(child: Container(width: 1, color: kRedColor)),
            ],
          ),
          coordinateUnit: CoordinateUnit.point,
          x: 'H', // last point
          y: 0,
        ),
      ],
    );
  }

  List<ChartData> getChartData() {
    return [
      ChartData('A', 2),
      ChartData('B', -3),
      ChartData('C', 6),
      ChartData('D', -8),
      ChartData('E', 10),
      ChartData('F', -12),
      ChartData('G', 4),
      ChartData('H', -5),
    ];
  }
}

class ChartData {
  final String x;
  final double y;
  ChartData(this.x, this.y);
}
