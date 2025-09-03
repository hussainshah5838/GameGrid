import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/widget/custom_check_box_widget.dart';
import 'package:game_grid/view/widget/custom_drop_down_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class Teams extends StatelessWidget {
  const Teams({super.key});

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
                      Image.asset(Assets.imagesLy, height: 24),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyText(
                              text: 'FC Barcelona',
                              size: 13,
                              weight: FontWeight.w700,
                            ),
                            MyText(
                              paddingTop: 2,
                              text: 'London, England',
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
