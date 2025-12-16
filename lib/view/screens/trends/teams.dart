import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/controllers/trends_controller.dart';
import 'package:game_grid/model/league_team_model.dart';
import 'package:game_grid/model/team_league_model.dart';
import 'package:game_grid/view/widget/common_image_view_widget.dart';
import 'package:game_grid/view/widget/custom_check_box_widget.dart';
import 'package:game_grid/view/widget/custom_drop_down_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class Teams extends StatefulWidget {
  const Teams({super.key});

  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  late final TrendsController controller;
  final List<String> labels = const [
    'H2H',
    'L5',
    'L10',
    'L20',
    '24-25',
    '23-25'
  ];

  @override
  void initState() {
    super.initState();
    controller = Get.find<TrendsController>();
  }

  String _formatPercent(num? value) {
    if (value == null) return '--';
    return '${value.toString()}%';
  }

  Color _valueColor(num? value) {
    if (value == null) return kQuaternaryColor;
    if (value >= 70) return kGreenColor;
    if (value >= 40) return kYellowColor2;
    return kRedColor2;
  }

  List<num?> _extractStats(Data data) {
    return [
      data.homeWinPercentage,
      data.seasonOver05PercentageOverall,
      data.seasonOver15PercentageOverall,
      data.seasonOver25PercentageOverall,
      data.seasonOver35PercentageOverall,
      data.seasonOver45PercentageOverall,
    ];
  }

  List<num?> _teamStatValues(LeagueTeam team) {
    return [
      team.h2h,
      team.l5,
      team.l10,
      team.l20,
      team.over2425,
      team.over2325,
    ];
  }

  Widget _buildTrendRow(List<num?> values) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(labels.length, (i) {
        final value = i < values.length ? values[i] : null;
        return Row(
          children: [
            Column(
              children: [
                MyText(
                  text: labels[i],
                  size: 10,
                  weight: FontWeight.w500,
                  color: kQuaternaryColor,
                  paddingBottom: 4,
                ),
                MyText(
                  text: _formatPercent(value),
                  size: 12,
                  color: _valueColor(value),
                  weight: FontWeight.w500,
                ),
              ],
            ),
            if (i < labels.length - 1)
              Container(
                width: 1,
                height: 28,
                color: kBorderColor,
                margin: EdgeInsets.symmetric(horizontal: 8),
              ),
          ],
        );
      }),
    );
  }

  String _safeLabel(Data? league, {required String? fallback}) {
    if (league == null) return fallback ?? '--';
    return dbEnglishNameValues.reverse[league.englishName] ??
        league.shortHand ??
        fallback ??
        '--';
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (controller.error.value.isNotEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyText(
                text: controller.error.value,
                size: 13,
                color: kQuaternaryColor,
                weight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (controller.selectedSeasonId.value.isNotEmpty) {
                    controller
                        .fetchLeagueSeason(controller.selectedSeasonId.value);
                  } else {
                    controller.fetchLeagues();
                  }
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      }
      final league = controller.leagueDetails.value?.data;
      final leagues = controller.leagues;
      final selectedLeague = controller.selectedLeague.value;
      final seasons = selectedLeague?.seasons ?? [];
      final selectedSeasonId = controller.selectedSeasonId.value;
      final List<LeagueTeam> teams =
          controller.leagueTeams.cast<LeagueTeam>().toList();

      if (league == null && controller.error.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      if (selectedLeague == null || seasons.isEmpty) {
        return Center(
          child: MyText(
            text: 'No leagues found.',
            size: 14,
            color: kQuaternaryColor,
            weight: FontWeight.w600,
          ),
        );
      }

      final statValues =
          league != null ? _extractStats(league) : List<num?>.filled(6, 0);

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
                  hint: selectedLeague.name ?? 'League',
                  items: leagues.map((e) => e.name ?? '--').toList(),
                  onChanged: (value) {
                    final match =
                        leagues.firstWhereOrNull((e) => e.name == value);
                    if (match != null) {
                      controller.selectLeague(match);
                    }
                  },
                  selectedValue: selectedLeague.name ?? '',
                ),
              ),
              Expanded(
                child: MyDropDown(
                  havePrefix: false,
                  prefixIcon: '',
                  hint: selectedSeasonId.isEmpty
                      ? 'Season'
                      : seasons
                              .firstWhereOrNull(
                                  (s) => s.id?.toString() == selectedSeasonId)
                              ?.year ??
                          selectedSeasonId,
                  items: seasons
                      .map((e) => e.year ?? e.id?.toString() ?? '--')
                      .toList(),
                  onChanged: (value) {
                    final season = seasons.firstWhereOrNull(
                      (s) => s.year == value || s.id?.toString() == value,
                    );
                    if (season != null) {
                      controller.selectLeague(selectedLeague,
                          seasonIndex: seasons.indexOf(season));
                    }
                  },
                  selectedValue: seasons
                          .firstWhereOrNull(
                              (s) => s.id?.toString() == selectedSeasonId)
                          ?.year ??
                      (selectedSeasonId.isNotEmpty ? selectedSeasonId : ''),
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
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kFillColor,
              gradient: LinearGradient(
                stops: [0.1, 0.9],
                colors: [
                  kSecondaryColor.withValues(alpha: 0),
                  kSecondaryColor.withValues(alpha: 0.12),
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
                            text: _safeLabel(
                              league,
                              fallback: selectedLeague.leagueName ??
                                  selectedLeague.name,
                            ),
                            size: 13,
                            weight: FontWeight.w700,
                          ),
                          MyText(
                            paddingTop: 2,
                            text: league?.country ??
                                selectedLeague.country ??
                                '--',
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
                        hint: league?.shortHand ??
                            selectedLeague.leagueName ??
                            '--',
                        items: [
                          league?.shortHand ?? selectedLeague.leagueName ?? '--'
                        ],
                        onChanged: (value) {},
                        selectedValue: league?.shortHand ??
                            selectedLeague.leagueName ??
                            '--',
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  color: kBorderColor,
                  margin: EdgeInsets.symmetric(vertical: 12),
                ),
                _buildTrendRow(statValues),
              ],
            ),
          ),
          if (teams.isNotEmpty) ...[
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kFillColor,
                border: Border.all(width: 1.0, color: kBorderColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyText(
                    text: 'Teams',
                    size: 14,
                    weight: FontWeight.w700,
                    paddingBottom: 8,
                  ),
                  ...teams.take(8).map(
                        (t) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kFillColor,
                              gradient: LinearGradient(
                                stops: [0.1, 0.9],
                                colors: [
                                  kSecondaryColor.withValues(alpha: 0),
                                  kSecondaryColor.withValues(alpha: 0.12),
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
                                    CommonImageView(
                                      url: t.logo ?? '',
                                      height: 28,
                                      width: 28,
                                      radius: 14,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: MyText(
                                        text: t.name ?? '--',
                                        size: 13,
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                    MyText(
                                      text: t.country ?? '',
                                      size: 11,
                                      color: kQuaternaryColor,
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 1,
                                  color: kBorderColor,
                                  margin: EdgeInsets.symmetric(vertical: 12),
                                ),
                                _buildTrendRow(_teamStatValues(t)),
                              ],
                            ),
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ],
          SizedBox(height: 40),
        ],
      );
    });
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
