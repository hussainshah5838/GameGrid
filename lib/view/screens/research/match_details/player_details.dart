import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_fonts.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/widget/custom_check_box_widget.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/custom_drop_down_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PlayerDetails extends StatelessWidget {
  const PlayerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kFillColor,
          actionsPadding: EdgeInsets.zero,
          automaticallyImplyLeading: false,
          titleSpacing: 20.0,
          leadingWidth: 80,
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Image.asset(Assets.imagesArrowBackRounded, height: 40),
              ),
            ],
          ),
          title: Image.asset(Assets.imagesLogoTextual, height: 28),
          shape: Border(bottom: BorderSide(color: kBorderColor, width: 1.0)),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.VERTICAL,
          physics: BouncingScrollPhysics(),
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              _Filter(),
                              isScrollControlled: true,
                            );
                          },
                          child: Container(
                            margin: AppSizes.HORIZONTAL,
                            width: 145,
                            height: 32,
                            padding: EdgeInsets.symmetric(horizontal: 8),
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
                      ],
                    ),
                    MyText(
                      paddingTop: 8,
                      text: 'Lamine',
                      size: 33.64,
                      paddingLeft: 20,
                    ),
                    MyText(
                      text: 'Yamal',
                      size: 33.64,
                      weight: FontWeight.w700,
                      paddingLeft: 20,
                      paddingBottom: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0.0, 1.0],
                          colors: [
                            Color(0xFFD3FF00).withValues(alpha: 0.25),
                            Color(0xFFD3FF00).withValues(alpha: 0.00),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Image.asset(Assets.imagesLy, height: 32),
                                SizedBox(width: 6),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      MyText(
                                        text: 'FC',
                                        size: 14,
                                        weight: FontWeight.w500,
                                      ),
                                      MyText(
                                        paddingTop: 2,
                                        text: 'Barcelona',
                                        size: 14,
                                        weight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  child: Image.asset(Assets.imagesPlayerImage, height: 275),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      stops: [0.0, 0.11],
                      colors: [
                        kPrimaryColor.withValues(alpha: 0.0),
                        kPrimaryColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  height: Get.height,
                  padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                  margin: EdgeInsets.only(top: 200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        spacing: 8,
                        children: List.generate(3, (index) {
                          final List<Map<String, dynamic>> stats = [
                            {'icon': Assets.imagesSpain, 'title': 'Spain'},
                            {'icon': Assets.imagesLy, 'title': '256 Matches'},
                            {'icon': Assets.imagesForward, 'title': 'Forwards'},
                          ];

                          final stat = stats[index];
                          return Expanded(
                            child: Container(
                              height: 80,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: kFillColor,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: kBorderColor,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(stat['icon'], height: 24),
                                  MyText(
                                    text: stat['title'],
                                    size: 12,
                                    maxLines: 1,
                                    textOverflow: TextOverflow.ellipsis,
                                    weight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 8),
                      Row(
                        spacing: 8,
                        children: [
                          Expanded(
                            child: MyDropDown(
                              height: 44,
                              horizontalPadding: 8,
                              iconSize: 20,
                              textSize: 14,
                              havePrefix: false,
                              hint: 'Barcelona',
                              items: ['Barcelona'],
                              selectedValue: 'Barcelona',
                              onChanged: (value) {},
                              prefixIcon: '',
                            ),
                          ),
                          Expanded(
                            child: MyDropDown(
                              height: 44,
                              horizontalPadding: 8,
                              iconSize: 20,
                              textSize: 14,
                              havePrefix: false,
                              hint: 'Barcelona',
                              items: ['Barcelona'],
                              selectedValue: 'Barcelona',
                              onChanged: (value) {},
                              prefixIcon: '',
                            ),
                          ),
                        ],
                      ),
                      MyText(
                        paddingTop: 16,
                        text: 'Player & Team Stats',
                        size: 16,
                        weight: FontWeight.w500,
                        paddingBottom: 10,
                      ),
                      Row(
                        spacing: 7,
                        children: List.generate(4, (index) {
                          final List<Map<String, dynamic>> stats = [
                            {'title': 'Goals', 'value': '9'},
                            {'title': 'Assists', 'value': '12'},
                            {'title': 'Avg SOT', 'value': '2.8'},
                            {'title': 'Touches', 'value': '50'},
                          ];

                          final stat = stats[index];
                          return Expanded(
                            child: Container(
                              height: 68,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: kFillColor,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: kBorderColor,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: stat['title'],
                                    size: 12,
                                    maxLines: 1,
                                    textOverflow: TextOverflow.ellipsis,
                                    color: kTertiaryColor.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                  MyText(
                                    text: stat['value'],
                                    size: 14,
                                    weight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kFillColor,
                          gradient: LinearGradient(
                            stops: [0.1, 0.9],
                            colors: [
                              kGreenColor2.withValues(alpha: 0),
                              kGreenColor2.withValues(alpha: 0.15),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          border: Border.all(width: 1.0, color: kBorderColor),
                        ),
                        child: Column(
                          children: [
                            Row(
                              spacing: 5,
                              children: List.generate(4, (index) {
                                final List<String> buttonLabels = [
                                  'Home',
                                  'Away',
                                  'Played with',
                                  'Played without',
                                ];
                                return Expanded(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: index == 0
                                            ? kSecondaryColor.withValues(
                                                alpha: 0.1,
                                              )
                                            : kFillColor,
                                        border: Border.all(
                                          width: 1.0,
                                          color: index == 0
                                              ? kSecondaryColor
                                              : kBorderColor,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: MyText(
                                          size: 9,
                                          lineHeight: 1.4,
                                          textAlign: TextAlign.center,
                                          weight: FontWeight.w500,
                                          text: buttonLabels[index],
                                          color: index == 0
                                              ? kSecondaryColor
                                              : kTertiaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            SizedBox(height: 10),
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
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                    ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: kFillColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: kBorderColor, width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              spacing: 5,
                              children: [
                                Expanded(
                                  child: MyText(
                                    text: 'Lamine Yamal',
                                    size: 14,
                                    weight: FontWeight.w500,
                                    maxLines: 1,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 32,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(
                                        0xff272924,
                                      ).withValues(alpha: 0.6),
                                      border: Border.all(
                                        width: 1,
                                        color: kTertiaryColor.withValues(
                                          alpha: 0.08,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: MyText(
                                      text: 'BAR vs MAD',
                                      size: 12,
                                      weight: FontWeight.w500,
                                      color: kTertiaryColor,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: MyDropDown(
                                    height: 32,
                                    horizontalPadding: 8,
                                    iconSize: 16,
                                    textSize: 12,
                                    havePrefix: false,
                                    hint: 'Last 5 Mat',
                                    items: ['Last 5 Mat'],
                                    selectedValue: 'Last 5 Mat',
                                    onChanged: (value) {},
                                    prefixIcon: '',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              spacing: 5,
                              children: [
                                Expanded(
                                  child: MyDropDown(
                                    height: 32,
                                    horizontalPadding: 8,
                                    iconSize: 16,
                                    textSize: 12,
                                    havePrefix: false,
                                    hint: 'Barcelona',
                                    items: ['Barcelona'],
                                    selectedValue: 'Barcelona',
                                    onChanged: (value) {},
                                    prefixIcon: '',
                                  ),
                                ),
                                Expanded(
                                  child: MyDropDown(
                                    height: 32,
                                    horizontalPadding: 8,
                                    iconSize: 16,
                                    textSize: 12,
                                    havePrefix: false,
                                    hint: 'Tournament',
                                    items: ['Tournament'],
                                    selectedValue: 'Tournament',
                                    onChanged: (value) {},
                                    prefixIcon: '',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppFonts.Satoshi,
                                  color: kTertiaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(text: '1.5 Shots On Target  | '),
                                  TextSpan(
                                    text: 'O',
                                    style: TextStyle(color: kGreenColor2),
                                  ),
                                  TextSpan(text: '-120'),
                                  TextSpan(text: ' | '),
                                  TextSpan(
                                    text: 'U',
                                    style: TextStyle(color: kRedColor),
                                  ),
                                  TextSpan(text: '+100'),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            _Chart(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Filter extends StatefulWidget {
  @override
  State<_Filter> createState() => _FilterState();
}

class _FilterState extends State<_Filter> {
  final List<String> tournamentTitles = [
    'Eric Football League',
    '2024 Player edition football premier league',
    'England Premier League',
  ];

  final List<String> shotsTitles = [
    'Goals',
    'Expected Goals (xG)',
    'Assists',
    'Expected Assists',
    'Total Shots',
    'Big Chances',
    'Minutes Played',
    'Touches',
  ];
  final List<String> shots2Titles = ['Goals', 'Expected Goals (xG)'];
  // selected items stored as strings
  late List<String> selectedTournaments;
  late List<String> selectedShots;
  late List<String> selectedShots2;

  @override
  void initState() {
    super.initState();
    selectedTournaments = [];
    selectedShots = [];
    selectedShots2 = [];
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
                  text: 'Filters',
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
                  title: 'Tournaments',
                  totalCounter: '${selectedTournaments.length}',
                  child: ListView.separated(
                    itemCount: tournamentTitles.length,
                    shrinkWrap: true,
                    padding: AppSizes.ZERO,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final title = tournamentTitles[index];
                      final isActive = selectedTournaments.contains(title);
                      return _CustomCheckBoxTile(
                        title: title,
                        isActive: isActive,
                        onTap: () {
                          setState(() {
                            if (isActive) {
                              selectedTournaments.remove(title);
                            } else {
                              selectedTournaments.add(title);
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
                  title: 'Shots on Target',
                  totalCounter: '${selectedShots.length}',
                  child: ListView.separated(
                    itemCount: shotsTitles.length,
                    shrinkWrap: true,
                    padding: AppSizes.ZERO,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final title = shotsTitles[index];
                      final isActive = selectedShots.contains(title);
                      return _CustomCheckBoxTile(
                        title: title,
                        isActive: isActive,
                        onTap: () {
                          setState(() {
                            if (isActive) {
                              selectedShots.remove(title);
                            } else {
                              selectedShots.add(title);
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
                  title: 'Shots on Target',
                  totalCounter: '${selectedShots2.length}',
                  child: ListView.separated(
                    itemCount: shots2Titles.length,
                    shrinkWrap: true,
                    padding: AppSizes.ZERO,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final title = shots2Titles[index];
                      final isActive = selectedShots2.contains(title);
                      return _CustomCheckBoxTile(
                        title: title,
                        isActive: isActive,
                        onTap: () {
                          setState(() {
                            if (isActive) {
                              selectedShots2.remove(title);
                            } else {
                              selectedShots2.add(title);
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

class _Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SfCartesianChart(
        tooltipBehavior: TooltipBehavior(enable: true),
        margin: EdgeInsets.zero,
        borderWidth: 0,
        borderColor: Colors.transparent,
        plotAreaBorderWidth: 0,
        enableAxisAnimation: true,
        primaryYAxis: NumericAxis(
          name: 'yAxis',
          maximum: 5,
          minimum: 0,
          interval: 1,
          isVisible: true,
          plotOffset: 10.0,
          majorGridLines: MajorGridLines(width: 1, color: kBorderColor),
          majorTickLines: MajorTickLines(width: 0),
          axisLine: AxisLine(width: 0),
          opposedPosition: false,
          labelStyle: TextStyle(
            color: kTertiaryColor,
            fontSize: 10.0,
            fontWeight: FontWeight.w500,
            fontFamily: AppFonts.Satoshi,
          ),
        ),
        primaryXAxis: CategoryAxis(
          name: 'xAxis',
          maximum: 6,
          minimum: 0,
          interval: 1,
          plotOffset: 5,
          majorGridLines: MajorGridLines(width: 0),
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(width: 0),
          labelStyle: TextStyle(
            color: kTertiaryColor,
            fontSize: 10.0,
            fontWeight: FontWeight.w500,
            fontFamily: AppFonts.Satoshi,
          ),
        ),
        series: graphData(),
      ),
    );
  }

  dynamic graphData() {
    final List<_DataModel> _dataSource = [
      _DataModel('@LAS\n7/15', 4),
      _DataModel('COL\n7/19', 3),
      _DataModel('LAS\n7/22', 2),
      _DataModel('SEA\n7/26', 1),
      _DataModel('PHX\n7/27', 4),
      _DataModel('GSV\n7/31', 3),
      _DataModel('MIN\n8/08', 2),
    ];
    return [
      ColumnSeries<_DataModel, dynamic>(
        dataSource: _dataSource,
        xValueMapper: (_DataModel data, _) => data.xValueMapper,
        yValueMapper: (_DataModel data, _) => data.yValueMapper,
        xAxisName: 'xAxis',
        yAxisName: 'yAxis',
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.9],
          colors: [kGreenColor3, kGreenColor3.withValues(alpha: .0)],
        ),

        width: 0.7,
        spacing: 0,
      ),
    ];
  }
}

class _DataModel {
  _DataModel(this.xValueMapper, this.yValueMapper);

  String? xValueMapper;
  int? yValueMapper;
}
