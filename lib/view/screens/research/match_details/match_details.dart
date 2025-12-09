import 'package:flutter/material.dart';
import 'package:game_grid/config/helper/logger.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_fonts.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/controllers/research_controller.dart';
import 'package:game_grid/model/match_details_model.dart';
import 'package:game_grid/view/screens/notifications/notifications.dart';
import 'package:game_grid/view/screens/research/match_details/r_players.dart';
import 'package:game_grid/view/widget/common_image_view_widget.dart';
import 'package:game_grid/view/widget/custom_check_box_widget.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/custom_drop_down_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

// FootyStats CDN host for logo paths like "teams/foo.png"
const String _imageBase = 'https://cdn.footystats.org/img/';

String _resolveImageUrl(String? url, {String? fallback}) {
  final primary = (url ?? '').trim();
  final secondary = (fallback ?? '').trim();
  final candidate = primary.isNotEmpty ? primary : secondary;
  if (candidate.isEmpty) return '';
  if (candidate.startsWith('http')) return candidate;
  if (candidate.startsWith('//')) return 'https:$candidate';
  final trimmed = candidate.startsWith('/') ? candidate.substring(1) : candidate;
  return '$_imageBase$trimmed';
}

String _safeText(String? value, {String fallback = '--'}) =>
    (value == null || value.isEmpty) ? fallback : value;

String _formatPercent(num? value) {
  if (value == null) return '--';
  return '${value.toString()}%';
}

String _formatNum(num? value) {
  if (value == null) return '--';
  return value.toString();
}

num? _safeSum(num? a, num? b) {
  if (a == null && b == null) return null;
  return (a ?? 0) + (b ?? 0);
}

class MatchDetails extends StatefulWidget {
  final String matchId;
  const MatchDetails({super.key, required this.matchId});

  @override
  State<MatchDetails> createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> {

  late final ResearchController controller;


  @override
  void initState() {
    super.initState();
    controller = Get.find<ResearchController>();
    controller.fetchMatchDetails(endpoint: "match", matchId:widget.matchId);
  }
  @override
  Widget build(BuildContext context) {
    final List<String> tabViews = ['Teams', 'Players'];
    
    return Obx( () { 
      if(controller.isDetailsLoading.value){
        return const Center(child: CircularProgressIndicator());
      }

      if(controller.detailsError.value.isNotEmpty){
        prettyLogger(controller.detailsError.value);
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Error: ${controller.detailsError.value}',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => controller.fetchMatchDetails(
                  endpoint: "match",
                  matchId: widget.matchId,
                ),
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      }

      final MatchDetailsModel? detailsModel = controller.matchDetails.value;
      final Data? details = detailsModel?.data;

      if (details == null) {
        return const Center(child: Text('No details available.'));
      }

     return  DefaultTabController(
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
                              spacing: 10,
                              children: [
                                Column(
                                  children: [
                                    CommonImageView(
                                      url: _resolveImageUrl(
                                        details.awayImage ?? "",
                                        fallback: details.awayUrl,
                                      ),
                                      height: 36,
                                      width: 36,
                                      radius: 18,
                                    ),
                                    MyText(
                                      paddingTop: 12,
                                      text: _safeText(details.awayName),
                                      size: 13,
                                      weight: FontWeight.w700,
                                    ),
                                  ],
                                ),

                                Expanded(
                                  child: Column(
                                    children: [
                                      MyText(
                                        text: 'Agg: ${details.homeGoalCount} - ${details.awayGoalCount}',
                                        size: 12,
                                        weight: FontWeight.w500,
                                        color: kQuaternaryColor,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 4),
                                      MyText(
                                        text: details.season ?? "",
                                        size: 12,
                                        textAlign: TextAlign.center,
                                        weight: FontWeight.w700,
                                      ),
                                      SizedBox(height: 4),
                                      MyText(
                                        text: _safeText(details.stadiumLocation),
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
                                    CommonImageView(
                                      url: _resolveImageUrl(
                                        details.homeImage ?? "",
                                        fallback: details.homeUrl,
                                      ),
                                      height: 36,
                                      width: 36,
                                      radius: 18,
                                    ),
                                    MyText(
                                      paddingTop: 12,
                                      text: _safeText(details.homeName),
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
              children: [_Teams(details: details), RPlayers(details: details)],
            ),
          ),
        ),
      ),
    );
  });
  }

}

class _Teams extends StatefulWidget {
  final Data details;
  const _Teams({required this.details});

  @override
  State<_Teams> createState() => _TeamsState();
}

class _TeamsState extends State<_Teams> {
  int selectedIndex = 0;

  bool get _isAwaySelected => selectedIndex == 0;

  String get _selectedTeamName =>
      _isAwaySelected ? _safeText(widget.details.awayName) : _safeText(widget.details.homeName);

  String get _opponentTeamName =>
      _isAwaySelected ? _safeText(widget.details.homeName) : _safeText(widget.details.awayName);

  num? _selectedValue({num? home, num? away}) => _isAwaySelected ? away : home;

  num? _opponentValue({num? home, num? away}) => _isAwaySelected ? home : away;

  int _extractFromMap(Map<String, int> source, List<String> keys) {
    for (final key in keys) {
      if (source.containsKey(key)) return source[key] ?? 0;
    }
    return 0;
  }

  double _percent(int value, int total) {
    if (total <= 0) return 0;
    return ((value / total) * 100).clamp(0, 100);
  }

  String _formatKeyLabel(String key) {
    if (key.isEmpty) return '--';
    final label = key.replaceAll('_', ' ');
    return '${label[0].toUpperCase()}${label.substring(1)}';
  }

  @override
  Widget build(BuildContext context) {
    final details = widget.details;

    final List<Map<String, dynamic>> tabs = [
      {
        'icon': widget.details.awayImage,
        'title': _safeText(widget.details.awayName),
        'secondary': widget.details.awayUrl,
      },
      {
        'icon': widget.details.homeImage,
        'title': _safeText(widget.details.homeName),
        'secondary': widget.details.homeUrl,
      },
    ];
    final Map<String, int> previousResults = details.h2H?.previousMatchesResults ?? {};
    final Map<String, int> bettingStats = details.h2H?.bettingStats ?? {};
    final int selectedWins = _extractFromMap(
      previousResults,
      _isAwaySelected
          ? ['team_b_wins', 'away_wins', 'team_b', 'away']
          : ['team_a_wins', 'home_wins', 'team_a', 'home'],
    );
    final int opponentWins = _extractFromMap(
      previousResults,
      _isAwaySelected
          ? ['team_a_wins', 'home_wins', 'team_a', 'home']
          : ['team_b_wins', 'away_wins', 'team_b', 'away'],
    );
    final int draws = _extractFromMap(previousResults, ['draws', 'draw']);

    final int totalMatches = selectedWins + opponentWins + draws;
    final double winPercent = totalMatches == 0 ? 0 : _percent(selectedWins, totalMatches);
    final double drawPercent = totalMatches == 0 ? 0 : _percent(draws, totalMatches);
    final double lossPercent = totalMatches == 0
        ? 0
        : (100 - winPercent - drawPercent).clamp(0, 100);
    final double drawRangeEnd = (winPercent + drawPercent).clamp(0, 100);

    final List<Map<String, String>> statsRows = [
      {
        'type': 'Goals',
        'total': _formatNum(details.totalGoalCount),
        'team': _formatNum(_selectedValue(home: details.homeGoalCount, away: details.awayGoalCount)),
        'opponent': _formatNum(_opponentValue(home: details.homeGoalCount, away: details.awayGoalCount)),
      },
      {
        'type': 'Possession %',
        'total': _formatPercent(details.avgPotential),
        'team': _formatNum(_selectedValue(home: details.teamAPossession, away: details.teamBPossession)),
        'opponent': _formatNum(_opponentValue(home: details.teamAPossession, away: details.teamBPossession)),
      },
      {
        'type': 'Shots',
        'total': _formatNum(_safeSum(details.teamAShots, details.teamBShots)),
        'team': _formatNum(_selectedValue(home: details.teamAShots, away: details.teamBShots)),
        'opponent': _formatNum(_opponentValue(home: details.teamAShots, away: details.teamBShots)),
      },
      {
        'type': 'On Target',
        'total': _formatNum(_safeSum(details.teamAShotsOnTarget, details.teamBShotsOnTarget)),
        'team': _formatNum(_selectedValue(home: details.teamAShotsOnTarget, away: details.teamBShotsOnTarget)),
        'opponent': _formatNum(_opponentValue(home: details.teamAShotsOnTarget, away: details.teamBShotsOnTarget)),
      },
      {
        'type': 'Corners',
        'total': _formatNum(details.totalCornerCount),
        'team': _formatNum(_selectedValue(home: details.teamACorners, away: details.teamBCorners)),
        'opponent': _formatNum(_opponentValue(home: details.teamACorners, away: details.teamBCorners)),
      },
      {
        'type': 'Yellow Cards',
        'total': _formatNum(_safeSum(details.teamAYellowCards, details.teamBYellowCards)),
        'team': _formatNum(_selectedValue(home: details.teamAYellowCards, away: details.teamBYellowCards)),
        'opponent': _formatNum(_opponentValue(home: details.teamAYellowCards, away: details.teamBYellowCards)),
      },
      {
        'type': 'Red Cards',
        'total': _formatNum(_safeSum(details.teamARedCards, details.teamBRedCards)),
        'team': _formatNum(_selectedValue(home: details.teamARedCards, away: details.teamBRedCards)),
        'opponent': _formatNum(_opponentValue(home: details.teamARedCards, away: details.teamBRedCards)),
      },
      {
        'type': 'xG',
        'total': _formatNum(details.totalXg),
        'team': _formatNum(_selectedValue(home: details.teamAXg, away: details.teamBXg)),
        'opponent': _formatNum(_opponentValue(home: details.teamAXg, away: details.teamBXg)),
      },
      {
        'type': 'Penalties Won',
        'total': _formatNum(_safeSum(details.teamAPenaltiesWon, details.teamBPenaltiesWon)),
        'team': _formatNum(_selectedValue(home: details.teamAPenaltiesWon, away: details.teamBPenaltiesWon)),
        'opponent': _formatNum(_opponentValue(home: details.teamAPenaltiesWon, away: details.teamBPenaltiesWon)),
      },
      {
        'type': 'Dangerous Attacks',
        'total': _formatNum(_safeSum(details.teamADangerousAttacks, details.teamBDangerousAttacks)),
        'team': _formatNum(_selectedValue(home: details.teamADangerousAttacks, away: details.teamBDangerousAttacks)),
        'opponent': _formatNum(_opponentValue(home: details.teamADangerousAttacks, away: details.teamBDangerousAttacks)),
      },
      {
        'type': 'Attacks',
        'total': _formatNum(_safeSum(details.teamAAttacks, details.teamBAttacks)),
        'team': _formatNum(_selectedValue(home: details.teamAAttacks, away: details.teamBAttacks)),
        'opponent': _formatNum(_opponentValue(home: details.teamAAttacks, away: details.teamBAttacks)),
      },
    ];

    final List<Map<String, String>> teamFormRows = [
      {
        'type': 'PPG',
        'team': _formatNum(_selectedValue(home: details.homePpg, away: details.awayPpg)),
        'opponent': _formatNum(_opponentValue(home: details.homePpg, away: details.awayPpg)),
      },
      {
        'type': 'Pre-match PPG',
        'team': _formatNum(_selectedValue(home: details.preMatchHomePpg, away: details.preMatchAwayPpg)),
        'opponent': _formatNum(_opponentValue(home: details.preMatchHomePpg, away: details.preMatchAwayPpg)),
      },
      {
        'type': 'xG (pre-match)',
        'team': _formatNum(_selectedValue(home: details.teamAXgPrematch, away: details.teamBXgPrematch)),
        'opponent': _formatNum(_opponentValue(home: details.teamAXgPrematch, away: details.teamBXgPrematch)),
      },
    ];
    Widget buildKeyValue(String label, String value) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: MyText(
                text: _formatKeyLabel(label),
                size: 12,
                weight: FontWeight.w500,
                color: kQuaternaryColor,
              ),
            ),
            MyText(
              text: value,
              size: 12,
              weight: FontWeight.w700,
              color: kTertiaryColor,
            ),
          ],
        ),
      );
    }

    List<Map<String, dynamic>> _topPredictionStats(Data details) {
      return [
        {
          'label': 'over 1.5',
          'value': details.o15Potential,
          'desc': 'Match potential',
          'color': kGreenColor2,
          'isPercent': true,
        },
        {
          'label': 'over 2.5',
          'value': details.o25Potential,
          'desc': 'Match potential',
          'color': kYellowColor2,
          'isPercent': true,
        },
        {
          'label': 'BTTS',
          'value': details.bttsPotential,
          'desc': 'Both teams to score',
          'color': kRedColor,
          'isPercent': true,
        },
        {
          'label': 'Goals/Match',
          'value': details.totalGoalCount,
          'desc': 'Total goals',
          'color': kYellowColor2,
          'isPercent': false,
        },
      ];
    }

    List<Map<String, dynamic>> _bottomPredictionStats(Data details) {
      return [
        {
          'label': 'over 0.5',
          'value': details.o05Potential,
          'desc': 'Match potential',
          'color': kGreenColor2,
          'isPercent': true,
        },
        {
          'label': 'HT over 1.5',
          'value': details.o15HtPotential,
          'desc': 'First half potential',
          'color': kYellowColor2,
          'isPercent': true,
        },
        {
          'label': 'over 2.5',
          'value': details.o25Potential,
          'desc': 'Match potential',
          'color': kRedColor,
          'isPercent': true,
        },
        {
          'label': 'BTTS 1H',
          'value': details.bttsFhgPotential,
          'desc': 'Both teams first half',
          'color': kYellowColor2,
          'isPercent': true,
        },
        {
          'label': 'Corners',
          'value': details.cornersPotential,
          'desc': 'Corner potential',
          'color': kRedColor,
          'isPercent': true,
        },
        {
          'label': 'Cards',
          'value': details.cardsPotential,
          'desc': 'Card potential',
          'color': kYellowColor2,
          'isPercent': true,
        },
      ];
    }
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
                      CommonImageView(
                        url: _resolveImageUrl(
                          tabs[index]['icon'] ?? '',
                          fallback: tabs[index]['secondary'],
                        ),
                        height: 24,
                        width: 24,
                        radius: 12,
                      ),
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
                hint: _selectedTeamName,
                items: [_selectedTeamName],
                selectedValue: _selectedTeamName,
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
                hint: _safeText(details.season),
                items: [_safeText(details.season)],
                selectedValue: _safeText(details.season),
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
                  MyText(
                    text: ' $totalMatches',
                    size: 16,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(height: 14),
              if (totalMatches == 0) ...[
                MyText(
                  text: 'No head-to-head data for these teams yet.',
                  size: 12,
                  weight: FontWeight.w500,
                  color: kQuaternaryColor,
                ),
              ] else ...[
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
                      endValue: winPercent.clamp(0, 100),
                      child: Align(
                        alignment: Alignment.center,
                        child: MyText(
                          text: '${winPercent.toStringAsFixed(0)}%',
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
                      startValue: winPercent,
                      endValue: drawRangeEnd,
                      child: Align(
                        alignment: Alignment.center,
                        child: MyText(
                          text: '${drawPercent.toStringAsFixed(0)}%',
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
                      startValue: drawRangeEnd,
                      endValue: 100,
                      child: Align(
                        alignment: Alignment.center,
                        child: MyText(
                          text: '${lossPercent.toStringAsFixed(0)}%',
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
                      endValue: winPercent.clamp(0, 100),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: MyText(
                          text: '$selectedWins Wins',
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
                      startValue: winPercent,
                      endValue: drawRangeEnd,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: MyText(
                          text: '$draws Draws',
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
                      startValue: drawRangeEnd,
                      endValue: 100,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: MyText(
                          text: '$opponentWins Losses',
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
              ],
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      spacing: 5,
                      children: [
                        CommonImageView(
                          url: _resolveImageUrl(
                            tabs[selectedIndex]['icon'] ?? '',
                            fallback: tabs[selectedIndex]['secondary'],
                          ),
                          height: 20,
                          width: 20,
                          radius: 10,
                        ),
                        MyText(
                          text: _selectedTeamName,
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
                        CommonImageView(
                          url: _resolveImageUrl(
                            tabs[1 - selectedIndex]['icon'] ?? '',
                            fallback: tabs[1 - selectedIndex]['secondary'],
                          ),
                          height: 20,
                          width: 20,
                          radius: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: _opponentTeamName,
                                style: TextStyle(
                                  fontFamily: AppFonts.Satoshi,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: kTertiaryColor,
                                ),
                              ),
                              TextSpan(
                                text: totalMatches == 0
                                    ? ''
                                    : ' (${lossPercent.toStringAsFixed(0)}%)',
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
              if (previousResults.isEmpty && bettingStats.isEmpty)
                MyText(
                  text: 'No H2H stats available for these teams yet.',
                  size: 12,
                  weight: FontWeight.w500,
                  color: kQuaternaryColor,
                ),
              if (previousResults.isNotEmpty) ...[
                MyText(
                  text: 'Previous match results',
                  size: 12,
                  weight: FontWeight.w700,
                ),
                ...previousResults.entries
                    .map((e) => buildKeyValue(e.key, e.value.toString()))
                    .toList(),
              ],
              if (bettingStats.isNotEmpty) ...[
                SizedBox(height: 8),
                MyText(
                  text: 'Betting stats',
                  size: 12,
                  weight: FontWeight.w700,
                ),
                ...bettingStats.entries
                    .map((e) => buildKeyValue(e.key, e.value.toString()))
                    .toList(),
              ],
              if ((details.h2H?.previousMatchesIds?.isNotEmpty ?? false)) ...[
                SizedBox(height: 8),
                MyText(
                  text:
                      'Previous match IDs: ${details.h2H!.previousMatchesIds!.length}',
                  size: 12,
                  weight: FontWeight.w500,
                  color: kQuaternaryColor,
                ),
              ],
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
              text: '$_selectedTeamName / $_opponentTeamName',
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
          itemCount: _topPredictionStats(details).length,
          itemBuilder: (context, index) {
            final stat = _topPredictionStats(details)[index];
            final String valueText = stat['isPercent'] == true
                ? _formatPercent(stat['value'] as num?)
                : _formatNum(stat['value'] as num?);
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
                        text: _safeText(valueText),
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            TextSpan(text: ' ${stat['label']}'),
                          ],
                        ),
                      ),
                      MyText(
                        paddingTop: 4,
                        text: _safeText(stat['desc'] as String?),
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
                        color: stat['color'] as Color? ?? kSecondaryColor,
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
            columns: [
              DataColumn(
                headingRowAlignment: MainAxisAlignment.center,
                label: MyText(
                  text: 'Metric',
                  size: 12,
                  color: kQuaternaryColor,
                  weight: FontWeight.w500,
                ),
              ),
              DataColumn(
                headingRowAlignment: MainAxisAlignment.center,
                label: MyText(
                  text: _selectedTeamName,
                  size: 12,
                  color: kSecondaryColor,
                  weight: FontWeight.w500,
                ),
              ),
              DataColumn(
                headingRowAlignment: MainAxisAlignment.center,
                label: MyText(
                  text: _opponentTeamName,
                  size: 12,
                  color: kQuaternaryColor,
                  weight: FontWeight.w500,
                ),
              ),
            ],
            rows: teamFormRows.map((m) {
              return DataRow(
                cells: [
                  DataCell(
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: m['type']!,
                        size: 12,
                        weight: FontWeight.w500,
                        color: kQuaternaryColor,
                      ),
                    ),
                  ),
                  DataCell(
                    Align(
                      alignment: Alignment.center,
                      child: MyText(
                        text: m['team']!,
                        size: 12,
                        weight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  DataCell(
                    Align(
                      alignment: Alignment.center,
                      child: MyText(
                        text: m['opponent']!,
                        size: 12,
                        weight: FontWeight.w600,
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
          itemCount: _bottomPredictionStats(details).length,
          itemBuilder: (context, index) {
            final stat = _bottomPredictionStats(details)[index];
            final String valueText = stat['isPercent'] == true
                ? _formatPercent(stat['value'] as num?)
                : _formatNum(stat['value'] as num?);
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
                        text: _safeText(valueText),
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(text: ' ${stat['label']}'),
                      ],
                    ),
                  ),
                  MyText(
                    paddingTop: 4,
                    text: _safeText(stat['desc'] as String?),
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
                        color: stat['color'] as Color? ?? kSecondaryColor,
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
            columns: ['Stat', 'Total', _selectedTeamName, _opponentTeamName]
                .map(
                  (title) => DataColumn(
                    headingRowAlignment: MainAxisAlignment.center,
                    columnWidth: FixedColumnWidth(60),
                    label: MyText(
                      text: title,
                      size: 12,
                      textAlign: TextAlign.center,
                      color: title == 'Total'
                          ? kSecondaryColor
                          : kQuaternaryColor,
                      weight: FontWeight.w500,
                    ),
                  ),
                )
                .toList(),
            rows: statsRows.map((m) {
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
                        text: m['total']!,
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
                        text: m['team']!,
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
                        text: m['opponent']!,
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
