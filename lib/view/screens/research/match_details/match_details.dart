import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_fonts.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/screens/notifications/notifications.dart';
import 'package:game_grid/view/screens/research/match_details/r_players.dart';
import 'package:game_grid/view/widget/common_image_view_widget.dart';
import 'package:game_grid/view/widget/custom_check_box_widget.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/custom_drop_down_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MatchDetails extends StatelessWidget {
  const MatchDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabViews = ['Teams', 'Players'];
    return DefaultTabController(
      length: tabViews.length,
      initialIndex: 0,
      child: CustomContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: NestedScrollView(
            physics: BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  centerTitle: true,
                  expandedHeight: 220,
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
                        child: Image.asset(
                          Assets.imagesArrowBackRounded,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                  title: Image.asset(Assets.imagesLogoTextual, height: 28),
                  actions: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => Notifications());
                        },
                        child: CommonImageView(
                          imagePath: Assets.imagesNotify,
                          height: 40,
                          width: 40,
                          radius: 100,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                  ],

                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: AppSizes.DEFAULT,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 40),
                            decoration: BoxDecoration(
                              color: kFillColor,
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  kPrimaryColor.withValues(alpha: .25),
                                  kSecondaryColor.withValues(alpha: .25),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              border: Border.all(color: kBorderColor, width: 1),
                            ),
                            padding: EdgeInsets.all(14),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset(Assets.imagesFc, height: 36),
                                    MyText(
                                      paddingTop: 12,
                                      text: 'FC Barcelona',
                                      size: 13,
                                      weight: FontWeight.w700,
                                    ),
                                  ],
                                ),

                                Expanded(
                                  child: Column(
                                    children: [
                                      MyText(
                                        text: 'Agg: 1 - 0',
                                        size: 12,
                                        weight: FontWeight.w500,
                                        color: kQuaternaryColor,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 4),
                                      MyText(
                                        text: 'November 11, 2024',
                                        size: 12,
                                        textAlign: TextAlign.center,
                                        weight: FontWeight.w700,
                                      ),
                                      SizedBox(height: 4),
                                      MyText(
                                        text: 'California, USA',
                                        size: 12,
                                        weight: FontWeight.w500,
                                        color: kQuaternaryColor,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Image.asset(Assets.imagesRd, height: 36),
                                    MyText(
                                      paddingTop: 12,
                                      text: 'Real Madrid',
                                      size: 13,
                                      weight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(48),
                    child: TabBar(
                      indicatorWeight: 1,
                      labelPadding: AppSizes.HORIZONTAL,
                      automaticIndicatorColorAdjustment: false,
                      indicatorColor: kSecondaryColor,
                      labelColor: kSecondaryColor,
                      unselectedLabelColor: kQuaternaryColor,
                      labelStyle: TextStyle(
                        fontFamily: AppFonts.Satoshi,
                        fontWeight: FontWeight.w500,
                        color: kSecondaryColor,
                        fontSize: 14,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontFamily: AppFonts.Satoshi,
                        fontWeight: FontWeight.w500,
                        color: kQuaternaryColor,
                        fontSize: 14,
                      ),

                      tabs: tabViews
                          .map((e) => Tab(text: e, height: 36))
                          .toList(),
                    ),
                  ),
                  shape: Border(
                    bottom: BorderSide(color: kBorderColor, width: 1.0),
                  ),
                ),
              ];
            },
            body: TabBarView(
              physics: BouncingScrollPhysics(),
              children: [_Teams(), RPlayers()],
            ),
          ),
        ),
      ),
    );
  }
}

class _Teams extends StatefulWidget {

  @override
  State<_Teams> createState() => _TeamsState();
}

class _TeamsState extends State<_Teams> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tabs = [
      {'icon': Assets.imagesFc, 'title': 'FC Barcelona'},
      {'icon': Assets.imagesRd, 'title': 'Real Madrid'},
    ];
    final List<Map<String, String>> milestones = [
      {'type': 'Win %', 'overall': '80%', 'home': '67%', 'away': '100%'},
      {'type': 'AVG', 'overall': '3.90', 'home': '4.33', 'away': '3.25'},
      {'type': 'Scored', 'overall': '3.10', 'home': '3.17', 'away': '3.00'},
      {'type': 'Conceded', 'overall': '0.80', 'home': '1.17', 'away': '0.25'},
      {'type': 'BTTS', 'overall': '40%', 'home': '50%', 'away': '0%'},
      {'type': 'CS', 'overall': '60%', 'home': '0%', 'away': '1.75'},
      {'type': 'xGA', 'overall': '0.95', 'home': '0.90', 'away': '1.11'},
    ];

    final List<Map<String, dynamic>> customMilestones = [
      {'type': 'Overall', 'value': '2.60', 'widget': null},
      {'type': 'Home', 'value': '2.60', 'widget': null},
      {'type': 'Away', 'value': '2.60', 'widget': null},
    ];
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.DEFAULT,
      physics: BouncingScrollPhysics(),
      children: [
        Row(
          spacing: 10,
          children: List.generate(2, (index) {
            final isSelected = selectedIndex == index;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? kSecondaryColor.withValues(alpha: 0.1)
                        : kFillColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1.0,
                      color: selectedIndex == index
                          ? kSecondaryColor
                          : kBorderColor,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 6,
                    children: [
                      Image.asset(tabs[index]['icon'], height: 24),
                      Text(
                        tabs[index]['title'],
                        style: TextStyle(
                          fontFamily: AppFonts.Satoshi,
                          color: kTertiaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 2),
                    ],
                  ),
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
                horizontalPadding: 12,
                iconSize: 20,
                textSize: 14,
                havePrefix: false,
                hint: 'Home',
                items: ['Home'],
                selectedValue: 'Home',
                onChanged: (value) {},
                prefixIcon: '',
              ),
            ),
            Expanded(
              child: MyDropDown(
                height: 44,
                horizontalPadding: 12,
                iconSize: 20,
                textSize: 14,
                havePrefix: false,
                hint: 'La Liga',
                items: ['La Liga'],
                selectedValue: 'La Liga',
                onChanged: (value) {},
                prefixIcon: '',
              ),
            ),
          ],
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
                  MyText(
                    text: 'Total Matches:',
                    size: 16,
                    weight: FontWeight.w500,
                  ),
                  MyText(text: ' 6', size: 16, weight: FontWeight.w700),
                ],
              ),
              SizedBox(height: 14),

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
                    endValue: 50,
                    child: Align(
                      alignment: Alignment.center,
                      child: MyText(
                        text: '50%',
                        size: 14,
                        color: kGreenColor2,
                        weight: FontWeight.w700,
                      ),
                    ),
                    color: kGreenColor2.withValues(alpha: 0.25),
                    edgeStyle: LinearEdgeStyle.startCurve,
                  ),
                  LinearGaugeRange(
                    startWidth: 32,
                    endWidth: 32,
                    startValue: 50,
                    endValue: 83,
                    child: Align(
                      alignment: Alignment.center,
                      child: MyText(
                        text: '33%',
                        size: 14,
                        color: kYellowColor2,
                        weight: FontWeight.w700,
                      ),
                    ),
                    color: kYellowColor2.withValues(alpha: 0.25),
                    edgeStyle: LinearEdgeStyle.bothFlat,
                  ),
                  LinearGaugeRange(
                    startWidth: 32,
                    endWidth: 32,
                    startValue: 83,
                    endValue: 100,
                    child: Align(
                      alignment: Alignment.center,
                      child: MyText(
                        text: '17%',
                        size: 14,
                        color: kRedColor2,
                        weight: FontWeight.w700,
                      ),
                    ),
                    color: kRedColor2.withValues(alpha: 0.25),
                    edgeStyle: LinearEdgeStyle.endCurve,
                  ),
                ],
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
                    startWidth: 20,
                    endWidth: 20,
                    startValue: 0,
                    endValue: 50,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: MyText(
                        text: '3 Wins',
                        size: 12,
                        color: kQuaternaryColor,
                        weight: FontWeight.w700,
                      ),
                    ),
                    color: Colors.transparent,
                    edgeStyle: LinearEdgeStyle.startCurve,
                  ),
                  LinearGaugeRange(
                    startWidth: 20,
                    endWidth: 20,
                    startValue: 50,
                    endValue: 83,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: MyText(
                        text: '2 Draws',
                        size: 12,
                        color: kQuaternaryColor,
                        weight: FontWeight.w700,
                      ),
                    ),
                    color: Colors.transparent,
                    edgeStyle: LinearEdgeStyle.bothFlat,
                  ),
                  LinearGaugeRange(
                    startWidth: 20,
                    endWidth: 20,
                    startValue: 83,
                    endValue: 100,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: MyText(
                        text: '1 Wins',
                        size: 12,
                        color: kQuaternaryColor,
                        weight: FontWeight.w700,
                      ),
                    ),
                    color: Colors.transparent,
                    edgeStyle: LinearEdgeStyle.endCurve,
                  ),
                ],
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      spacing: 5,
                      children: [
                        Image.asset(Assets.imagesFc, height: 20),
                        MyText(
                          text: 'FC Barcelona',
                          size: 12,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 5,
                      children: [
                        Image.asset(Assets.imagesRd, height: 20),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Real Madrid ',
                                style: TextStyle(
                                  fontFamily: AppFonts.Satoshi,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: kTertiaryColor,
                                ),
                              ),
                              TextSpan(
                                text: '(25%)',
                                style: TextStyle(
                                  fontFamily: AppFonts.Satoshi,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: kQuaternaryColor,
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
                    text: 'At California',
                    size: 12,
                    weight: FontWeight.w500,
                    paddingLeft: 8,
                    paddingRight: 8,
                  ),
                  CustomCheckBox(isActive: false, onTap: () {}),
                  MyText(
                    text: 'This Tournament',
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

        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: MyText(
                text: 'Prediction Stats',
                size: 16,
                weight: FontWeight.w700,
              ),
            ),
            MyText(
              text: 'Barcelona / Real Madrid',
              size: 14,
              color: kQuaternaryColor,
              weight: FontWeight.w500,
            ),
          ],
        ),
        SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          padding: AppSizes.ZERO,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 65,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            final List<Map<String, dynamic>> predictionStats = [
              {
                'percentage': '50%',
                'label': 'over 1.5',
                'desc': 'League average: 59%',
                'color': kGreenColor2,
              },
              {
                'percentage': '33%',
                'label': 'over 2.5',
                'desc': 'League average: 59%',
                'color': kRedColor,
              },
              {
                'percentage': '17%',
                'label': 'BTTS',
                'desc': 'League average: 59%',
                'color': kYellowColor2,
              },
              {
                'percentage': '50%',
                'label': 'Goals/Match',
                'desc': 'League average: 59%',
                'color': kYellowColor2,
              },
            ];

            final stat = predictionStats[index];
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: kFillColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: kBorderColor, width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: AppFonts.Satoshi,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: kTertiaryColor,
                          ),
                          children: [
                            TextSpan(
                              text: stat['percentage'],
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            TextSpan(text: ' ${stat['label']}'),
                          ],
                        ),
                      ),
                      MyText(
                        paddingTop: 4,
                        text: stat['desc']!,
                        size: 12,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        weight: FontWeight.w500,
                        color: kQuaternaryColor,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: -2,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Container(
                      height: 38,
                      width: 4,
                      decoration: BoxDecoration(
                        color: stat['color'],
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: DataTable(
            checkboxHorizontalMargin: 0,
            columnSpacing: 0,
            horizontalMargin: 0,
            border: TableBorder.all(
              color: kBorderColor,
              width: 1.0,
              borderRadius: BorderRadius.circular(8),
            ),
            // headingRowColor: WidgetStateProperty.resolveWith<Color?>(
            //   (Set<WidgetState> states) => kBorderColor,
            // ),
            headingRowHeight: 40,
            decoration: BoxDecoration(
              color: kFillColor,
              borderRadius: BorderRadius.circular(8),
            ),
            dataRowMinHeight: 40,
            dataRowMaxHeight: 40,
            columns: List.generate(
              3,
              (index) => DataColumn(
                headingRowAlignment: MainAxisAlignment.center,
                columnWidth: FixedColumnWidth(
                  index == 0
                      ? 60
                      : index == 1
                      ? 120
                      : 60,
                ),
                label: MyText(
                  text: ['1', '1', '1'][index],
                  size: 12,
                  color: kQuaternaryColor,
                  weight: FontWeight.w500,
                ),
              ),
            ),
            rows: List.generate(customMilestones.length, (rowIndex) {
              final m = customMilestones[rowIndex];
              return DataRow(
                cells: List.generate(3, (cellIndex) {
                  if (cellIndex == 0) {
                    return DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: MyText(
                          text: m['type']!,
                          size: 12,
                          weight: FontWeight.w500,
                          textAlign: TextAlign.center,
                          color: kQuaternaryColor,
                        ),
                      ),
                    );
                  } else if (cellIndex == 1) {
                    return DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: rowIndex == 0
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 2,
                                children: List.generate(5, (index) {
                                  return Container(
                                    height: 18,
                                    width: 18,
                                    decoration: BoxDecoration(
                                      color: kGreenColor2,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: MyText(
                                        text: 'W',
                                        size: 10,
                                        weight: FontWeight.w500,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                }),
                              )
                            : rowIndex == 1
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 2,
                                children: List.generate(4, (index) {
                                  return Container(
                                    height: 18,
                                    width: 18,
                                    decoration: BoxDecoration(
                                      color: index > 1
                                          ? kYellowColor2
                                          : kGreenColor2,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: MyText(
                                        text: index > 1 ? 'D' : 'W',
                                        size: 10,
                                        weight: FontWeight.w500,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                }),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 2,
                                children: List.generate(3, (index) {
                                  return Container(
                                    height: 18,
                                    width: 18,
                                    decoration: BoxDecoration(
                                      color: kGreenColor2,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: MyText(
                                        text: 'W',
                                        size: 10,
                                        weight: FontWeight.w500,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                      ),
                    );
                  } else {
                    return DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: kGreenColor2,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: MyText(
                            text: m['value']!,
                            size: 10,
                            weight: FontWeight.w500,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }
                }),
              );
            }),
          ),
        ),

        SizedBox(height: 12),

        GridView.builder(
          shrinkWrap: true,
          padding: AppSizes.ZERO,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 65,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            final List<Map<String, dynamic>> predictionStats = [
              {
                'percentage': '50%',
                'label': 'over 1.5',
                'desc': '3 / 6 matches',
                'color': kRedColor,
              },
              {
                'percentage': '33%',
                'label': 'over 2.5',
                'desc': '2 / 6 matches',
                'color': kYellowColor2,
              },
              {
                'percentage': '17%',
                'label': 'over 1.5',
                'desc': '1 / 6 matches',
                'color': kGreenColor2,
              },
              {
                'percentage': '50%',
                'label': 'BTTS',
                'desc': '3 / 6 matches',
                'color': kRedColor,
              },
              {
                'percentage': '67%',
                'label': 'clean sheets',
                'desc': 'Bristol U21',
                'color': kRedColor,
              },
              {
                'percentage': '50%',
                'label': 'clean sheets',
                'desc': 'Wolves U21',
                'color': kYellowColor2,
              },
            ];

            final stat = predictionStats[index];
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: kFillColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: kBorderColor, width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: AppFonts.Satoshi,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: kTertiaryColor,
                          ),
                          children: [
                            TextSpan(
                              text: stat['percentage'],
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            TextSpan(text: ' ${stat['label']}'),
                          ],
                        ),
                      ),
                      MyText(
                        paddingTop: 4,
                        text: stat['desc']!,
                        size: 12,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        weight: FontWeight.w500,
                        color: kQuaternaryColor,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: -2,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Container(
                      height: 38,
                      width: 4,
                      decoration: BoxDecoration(
                        color: stat['color'],
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: DataTable(
            checkboxHorizontalMargin: 0,
            columnSpacing: 0,
            horizontalMargin: 0,
            border: TableBorder.all(
              color: kBorderColor,
              width: 1.0,
              borderRadius: BorderRadius.circular(8),
            ),
            // headingRowColor: WidgetStateProperty.resolveWith<Color?>(
            //   (Set<WidgetState> states) => kBorderColor,
            // ),
            headingRowHeight: 40,
            decoration: BoxDecoration(
              color: kFillColor,
              borderRadius: BorderRadius.circular(8),
            ),

            dataRowMinHeight: 40,
            dataRowMaxHeight: 40,
            columns: ['Stats', 'Overall', 'Home', 'Away']
                .map(
                  (title) => DataColumn(
                    headingRowAlignment: MainAxisAlignment.center,
                    columnWidth: FixedColumnWidth(60),
                    label: MyText(
                      text: title,
                      size: 12,
                      textAlign: TextAlign.center,
                      color: title == 'Overall'
                          ? kSecondaryColor
                          : kQuaternaryColor,
                      weight: FontWeight.w500,
                    ),
                  ),
                )
                .toList(),
            rows: milestones.map((m) {
              return DataRow(
                cells: [
                  DataCell(
                    Align(
                      alignment: Alignment.center,
                      child: MyText(
                        text: m['type']!,
                        size: 12,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.start,
                        color: kQuaternaryColor,
                      ),
                    ),
                  ),
                  DataCell(
                    Align(
                      alignment: Alignment.center,
                      child: MyText(
                        text: m['overall']!,
                        size: 12,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        color: kSecondaryColor,
                      ),
                    ),
                  ),
                  DataCell(
                    Align(
                      alignment: Alignment.center,
                      child: MyText(
                        text: m['home']!,
                        size: 12,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        color: kQuaternaryColor,
                      ),
                    ),
                  ),
                  DataCell(
                    Align(
                      alignment: Alignment.center,
                      child: MyText(
                        text: m['away']!,
                        size: 12,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        color: kQuaternaryColor,
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),

        SizedBox(height: 16),
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
