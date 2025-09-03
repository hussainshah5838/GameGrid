import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/main.dart';
import 'package:game_grid/view/widget/common_image_view_widget.dart';
import 'package:game_grid/view/widget/custom_check_box_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Statistics extends StatelessWidget {
  final List<Map<String, dynamic>> _stats = [
    {
      'leading': '0.75',
      'title': 'Expected goals (xG)',
      'trailing': '1',
      'progress': 0.4286,
      'oppositeProgress': 0.5714,
    },
    {
      'leading': '5',
      'title': 'Total shots',
      'trailing': '10',
      'progress': 0.3333,
      'oppositeProgress': 0.6667,
    },
    {
      'leading': '1',
      'title': 'Shots on target',
      'trailing': '2',
      'progress': 0.3333,
      'oppositeProgress': 0.6667,
    },
    {
      'leading': '1',
      'title': 'Big Chances',
      'trailing': '2',
      'progress': 0.3333,
      'oppositeProgress': 0.6667,
    },
    {
      'leading': '1',
      'title': 'Big Chances missed',
      'trailing': '1',
      'progress': 0.5,
      'oppositeProgress': 0.5,
    },
    {
      'leading': '216 (74%)',
      'title': 'Accurate Passes',
      'trailing': '313 (79%)',
      'progress': 0.74,
      'oppositeProgress': 0.79,
    },
    {
      'leading': '12',
      'title': 'Fouls Committed',
      'trailing': '9',
      'progress': 0.5714,
      'oppositeProgress': 0.4286,
    },
    {
      'leading': '6/10',
      'title': 'Offsides',
      'trailing': '3',
      'progress': 0.6667,
      'oppositeProgress': 0.3333,
    },
    {
      'leading': '1',
      'title': 'Corners',
      'trailing': '5',
      'progress': 0.1667,
      'oppositeProgress': 0.8333,
    },
  ];

  final List<Map<String, dynamic>> _shotsStats = [
    {
      'leading': '0.75',
      'title': 'Total shots',
      'trailing': '1.42',
      'progress': 0.345,
      'oppositeProgress': 0.655,
    },
    {
      'leading': '5',
      'title': 'Shots off target',
      'trailing': '10',
      'progress': 0.3333,
      'oppositeProgress': 0.6667,
    },
    {
      'leading': '1',
      'title': 'Shots on target',
      'trailing': '2',
      'progress': 0.3333,
      'oppositeProgress': 0.6667,
    },
    {
      'leading': '1',
      'title': 'Block Shots',
      'trailing': '2',
      'progress': 0.3333,
      'oppositeProgress': 0.6667,
    },
    {
      'leading': '1',
      'title': 'Hot Woodwork',
      'trailing': '1',
      'progress': 0.5,
      'oppositeProgress': 0.5,
    },
    {
      'leading': '216 (74%)',
      'title': 'Short Inside Box',
      'trailing': '313 (79%)',
      'progress': 0.74,
      'oppositeProgress': 0.79,
    },
    {
      'leading': '12',
      'title': 'Shots Outside Box',
      'trailing': '9',
      'progress': 0.5714,
      'oppositeProgress': 0.4286,
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
                text: 'Top Statistics',
                size: 16,
                weight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
              MyText(
                paddingTop: 4,
                text: 'Ball Possession',
                size: 12,
                color: kQuaternaryColor,
                textAlign: TextAlign.center,
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
                    endValue: 38,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: '+190',
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
                        text: '+110',
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

                // markerPointers: [
                //   LinearShapePointer(
                //     value: 74,
                //     shapeType: LinearShapePointerType.circle,
                //     color: kSecondaryColor,
                //     height: 14,
                //     width: 14,
                //     elevation: 2,
                //   ),
                // ],
              ),
              Container(
                height: 1,
                color: kBorderColor,
                margin: EdgeInsets.symmetric(vertical: 12),
              ),
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
              MyText(text: 'Shots', size: 14, weight: FontWeight.w700),
              Container(
                height: 1,
                color: kBorderColor,
                margin: EdgeInsets.symmetric(vertical: 12),
              ),
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
        GestureDetector(
          onTap: () {
            Get.bottomSheet(_SetStats(), isScrollControlled: true);
          },
          child: Container(
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
                    text: 'Select Stats',
                    size: 14,
                    paddingRight: 4,
                    weight: FontWeight.w500,
                    color: kTertiaryColor,
                  ),
                ),
                Image.asset(
                  Assets.imagesDropDown,
                  height: 20,
                  color: kTertiaryColor,
                ),
              ],
            ),
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
                text: 'Successful Passes',
                size: 14,
                weight: FontWeight.w700,
              ),
              Container(
                height: 1,
                color: kBorderColor,
                margin: EdgeInsets.symmetric(vertical: 12),
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...List.generate(3, (index) {
                    return _ScoreTile(index: index);
                  }),
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
                text: 'Successful Dribbles',
                size: 14,
                weight: FontWeight.w700,
              ),
              Container(
                height: 1,
                color: kBorderColor,
                margin: EdgeInsets.symmetric(vertical: 12),
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...List.generate(3, (index) {
                    return _ScoreTile(index: index);
                  }),
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
                text: 'Expected Goals (xG)',
                size: 14,
                weight: FontWeight.w700,
              ),
              Container(
                height: 1,
                color: kBorderColor,
                margin: EdgeInsets.symmetric(vertical: 12),
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...List.generate(3, (index) {
                    return _ScoreTile(index: index, trailing: '0.61');
                  }),
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
                text: 'Chances Created',
                size: 14,
                weight: FontWeight.w700,
              ),
              Container(
                height: 1,
                color: kBorderColor,
                margin: EdgeInsets.symmetric(vertical: 12),
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...List.generate(3, (index) {
                    return _ScoreTile(index: index);
                  }),
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
              MyText(text: 'Touches', size: 14, weight: FontWeight.w700),
              Container(
                height: 1,
                color: kBorderColor,
                margin: EdgeInsets.symmetric(vertical: 12),
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...List.generate(3, (index) {
                    return _ScoreTile(index: index);
                  }),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ScoreTile extends StatelessWidget {
  const _ScoreTile({required this.index, this.trailing});
  final int index;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyText(text: '1', paddingRight: 16, weight: FontWeight.w500),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1.0, color: kTertiaryColor),
          ),
          child: CommonImageView(
            height: 24,
            width: 24,
            radius: 100,
            url: dummyImg,
          ),
        ),
        Expanded(
          child: MyText(
            text: 'Annette Black',
            paddingLeft: 4,
            size: 12,
            weight: FontWeight.w500,
          ),
        ),
        Image.asset(Assets.imagesLy, height: 24),
        Container(
          margin: EdgeInsets.only(left: 20),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: index == 0 ? kSecondaryColor : Colors.transparent,
          ),
          alignment: Alignment.center,
          child: MyText(
            text: trailing ?? '44',
            size: 10,
            weight: FontWeight.w500,
            color: index == 0 ? kPrimaryColor : kTertiaryColor,
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

class _SetStats extends StatefulWidget {
  @override
  State<_SetStats> createState() => _SetStatsState();
}

class _SetStatsState extends State<_SetStats> {
  final List<String> topStats = [
    'Goals',
    'Expected Goals (xG)',
    'Assists',
    'Expected Assists',
    'Total Shots',
    'Big Chances',
    'Minutes Played',
    'Touches',
  ];

  final List<String> attacks = [
    'xG on target (xGOT)',
    'Big Chances Created',
    'Chances Created',
    'Shots inside box',
    'Shots outside box',
    'Hit Woodwork',
  ];
  late List<String> selectedTopStats;
  late List<String> selectedAttacks;

  @override
  void initState() {
    super.initState();
    selectedTopStats = [];
    selectedAttacks = [];
  }

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
                  text: 'Statistics',
                  size: 16,
                  paddingLeft: 20,
                  weight: FontWeight.w700,
                ),
              ),
              MyText(
                onTap: () {
                  Get.back();
                },
                text: 'Done',
                size: 16,
                color: kSecondaryColor,
                paddingRight: 20,
                weight: FontWeight.w500,
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
                _FilterTile(
                  title: 'Top Stats',
                  totalCounter: '${selectedTopStats.length}',
                  child: ListView.separated(
                    itemCount: topStats.length,
                    shrinkWrap: true,
                    padding: AppSizes.ZERO,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final title = topStats[index];
                      final isActive = selectedTopStats.contains(title);
                      return _CustomCheckBoxTile(
                        title: title,
                        isActive: isActive,
                        onTap: () {
                          setState(() {
                            if (isActive) {
                              selectedTopStats.remove(title);
                            } else {
                              selectedTopStats.add(title);
                            }
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16);
                    },
                  ),
                ),

                _FilterTile(
                  title: 'Attacks',
                  totalCounter: '${selectedAttacks.length}',
                  child: ListView.separated(
                    itemCount: attacks.length,
                    shrinkWrap: true,
                    padding: AppSizes.ZERO,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final title = attacks[index];
                      final isActive = selectedAttacks.contains(title);
                      return _CustomCheckBoxTile(
                        title: title,
                        isActive: isActive,
                        onTap: () {
                          setState(() {
                            if (isActive) {
                              selectedAttacks.remove(title);
                            } else {
                              selectedAttacks.add(title);
                            }
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16);
                    },
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

class _CustomCheckBoxTile extends StatelessWidget {
  const _CustomCheckBoxTile({
    required this.title,
    required this.isActive,
    required this.onTap,
  });
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MyText(
            text: title,
            size: 14,
            weight: FontWeight.w500,
            color: isActive ? kSecondaryColor : kQuaternaryColor,
          ),
        ),
        CustomCheckBox(isActive: isActive, onTap: onTap),
      ],
    );
  }
}

class _FilterTile extends StatefulWidget {
  const _FilterTile({
    required this.title,
    required this.child,
    required this.totalCounter,
  });
  final String title;
  final Widget child;
  final String totalCounter;

  @override
  State<_FilterTile> createState() => _FilterTileState();
}

class _FilterTileState extends State<_FilterTile> {
  late ExpandableController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ExpandableController(initialExpanded: false);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: ExpandableNotifier(
        controller: _controller,
        child: ScrollOnExpand(
          child: ExpandablePanel(
            controller: _controller,
            theme: ExpandableThemeData(tapHeaderToExpand: true, hasIcon: false),
            header: Container(
              child: Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: MyText(
                      text: widget.title,
                      size: 16,
                      weight: FontWeight.w700,
                    ),
                  ),
                  if (widget.totalCounter != '0')
                    Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kTertiaryColor.withValues(alpha: 0.05),
                      ),
                      child: Center(
                        child: MyText(
                          text: widget.totalCounter,
                          size: 12,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                  RotatedBox(
                    quarterTurns: _controller.expanded ? 2 : 0,
                    child: Image.asset(Assets.imagesDropDown, height: 18),
                  ),
                ],
              ),
            ),
            collapsed: SizedBox(),
            expanded: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  height: 1,
                  color: kBorderColor,
                ),
                widget.child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
