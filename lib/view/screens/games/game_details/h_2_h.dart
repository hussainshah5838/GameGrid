import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/widget/custom_check_box_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class H2H extends StatelessWidget {
  final List<Map<String, dynamic>> _stats = [
    {
      'leading': '3',
      'title': 'No Losses',
      'trailing': '3',
      'progress': 0.5,
      'oppositeProgress': 0.5,
    },
    {
      'leading': '4',
      'title': 'No Wins',
      'trailing': '6',
      'progress': 0.4,
      'oppositeProgress': 0.6,
    },
    {
      'leading': '6',
      'title': 'No Clean Sheet',
      'trailing': '8',
      'progress': 0.429,
      'oppositeProgress': 0.571,
    },
    {
      'leading': '5/6',
      'title': 'Over 2.5 goals',
      'trailing': '4/5',
      'progress': 5 / 6,
      'oppositeProgress': 4 / 5,
    },
    {
      'leading': '9/10',
      'title': 'Both teams to score',
      'trailing': '8/10',
      'progress': 0.9,
      'oppositeProgress': 0.8,
    },
    {
      'leading': '6/10',
      'title': 'Under 4.5 cards',
      'trailing': '4/10',
      'progress': 0.6,
      'oppositeProgress': 0.4,
    },
  ];

  final List<Map<String, dynamic>> _shotsStats = [
    {
      'leading': '6',
      'title': 'No clean sheet',
      'trailing': '8',
      'progress': 0.75,
      'oppositeProgress': 1.0,
    },
    {
      'leading': '8/8',
      'title': 'First to Score',
      'trailing': '6/10',
      'progress': 1.0,
      'oppositeProgress': 0.6,
    },
    {
      'leading': '6/10',
      'title': 'Under 4.5 cards',
      'trailing': '4/10',
      'progress': 0.6,
      'oppositeProgress': 0.4,
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
              MyText(
                text: 'Full Time',
                size: 14,
                weight: FontWeight.w700,
                paddingBottom: 10,
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
                              text: '+190',
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
                        Image.asset(Assets.imagesFc, height: 20),
                        MyText(
                          text: 'FC Barcelona',
                          size: 14,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 8,
                      children: [
                        Image.asset(Assets.imagesRd, height: 20),
                        MyText(
                          text: 'Real Madrid',
                          size: 14,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
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
              MyText(
                text: 'Head-to-Head Streaks',
                size: 14,
                weight: FontWeight.w700,
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
                        Image.asset(Assets.imagesFc, height: 20),
                        MyText(
                          text: 'FC Barcelona',
                          size: 14,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 8,
                      children: [
                        Image.asset(Assets.imagesRd, height: 20),
                        MyText(
                          text: 'Real Madrid',
                          size: 14,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ...List.generate(_shotsStats.length, (index) {
                final stat = _shotsStats[index];
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == _shotsStats.length - 1 ? 0 : 8,
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
              MyText(text: 'Odds', size: 14, weight: FontWeight.w700),
              Container(
                height: 1,
                color: kBorderColor,
                margin: EdgeInsets.symmetric(vertical: 12),
              ),
              Row(
                spacing: 8,
                children: [
                  Image.asset(Assets.imagesFc, height: 36),
                  Expanded(
                    child: MyText(
                      text: '+110 = 48%',
                      size: 12,
                      color: kQuaternaryColor,
                      weight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: kSecondaryColor,
                    ),
                    alignment: Alignment.center,
                    child: MyText(
                      text: 'W: 36%',
                      size: 12,
                      weight: FontWeight.w500,
                      color: kPrimaryColor,
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
              Row(
                children: [
                  Expanded(
                    child: MyText(
                      text: 'H2H',
                      size: 14,
                      weight: FontWeight.w700,
                    ),
                  ),
                  CustomCheckBox(isActive: false, onTap: () {}),
                  MyText(
                    text: 'At Home',
                    size: 12,
                    weight: FontWeight.w500,
                    paddingLeft: 8,
                    paddingRight: 8,
                  ),
                  CustomCheckBox(isActive: false, onTap: () {}),
                  MyText(
                    text: 'La Liga',
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
                  return _MatchesTile(
                    isActive: true,
                    onTap: () {},
                    time: '09:45 am',
                    team1: 'FC Barcelona',
                    team2: 'Real Madrid',
                    team1Logo: Assets.imagesLy,
                    team2Logo: Assets.imagesLy,
                    subtitle: index.isEven ? '89’' : 'FT',
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16);
                },
              ),
            ],
          ),
        ),
      ],
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

// ignore: unused_element
class _MatchesTile extends StatelessWidget {
  const _MatchesTile({
    required this.isActive,
    required this.onTap,
    required this.time,
    required this.subtitle,
    required this.team1,
    required this.team2,
    required this.team1Logo,
    required this.team2Logo,
  });
  final bool isActive;
  final VoidCallback onTap;
  final String time;
  final String subtitle;
  final String team1;
  final String team2;
  final String team1Logo;
  final String team2Logo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MyText(
                text: time,
                size: 13,
                weight: FontWeight.w700,
                paddingBottom: 6,
              ),
              MyText(
                text: subtitle,
                size: 12,
                weight: FontWeight.w500,
                color: kRedColor2,
              ),
            ],
          ),
          Container(
            height: 42,
            width: 1,
            color: kBorderColor,
            margin: EdgeInsets.symmetric(horizontal: 12),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Image.asset(team1Logo, height: 20),
                    Expanded(
                      child: MyText(
                        text: team1,
                        size: 12,
                        weight: FontWeight.w500,
                        paddingLeft: 8,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Image.asset(team2Logo, height: 20),
                    Expanded(
                      child: MyText(
                        text: team2,
                        size: 12,
                        weight: FontWeight.w500,
                        paddingLeft: 8,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 42,
            width: 1,
            color: isActive ? kSecondaryColor : kBorderColor,
            margin: EdgeInsets.symmetric(horizontal: 10),
          ),
          GestureDetector(
            onTap: onTap,
            child: Image.asset(
              isActive
                  ? Assets.imagesNotificationFilled
                  : Assets.imagesNotificationEmpty,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
