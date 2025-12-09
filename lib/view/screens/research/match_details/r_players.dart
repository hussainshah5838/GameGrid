import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_fonts.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/model/match_details_model.dart';
import 'package:game_grid/view/widget/common_image_view_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class RPlayers extends StatefulWidget {
  final Data details;
  const RPlayers({super.key, required this.details});

  @override
  State<RPlayers> createState() => _RPlayersState();
}

class _RPlayersState extends State<RPlayers> {
  int selectedIndex = 0;

  // FootyStats CDN host for logo paths like "teams/foo.png"
  static const String _imageBase = 'https://cdn.footystats.org/img/';

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

  Map<String, dynamic> _asMap(dynamic raw) {
    if (raw is Map<String, dynamic>) return raw;
    if (raw is Map) return raw.cast<String, dynamic>();
    return <String, dynamic>{};
  }

  String _playerName(Map<String, dynamic> player) {
    return (player['name'] ??
            player['player_name'] ??
            player['player'] ??
            player['fullname'] ??
            '--')
        .toString();
  }

  String _playerPosition(Map<String, dynamic> player) {
    return (player['position'] ?? player['pos'] ?? '--').toString();
  }

  String _playerNumber(Map<String, dynamic> player) {
    final value = player['number'] ??
        player['shirt_number'] ??
        player['shirtNo'] ??
        player['jersey'] ??
        player['kit_number'];
    if (value == null || value.toString().isEmpty) return '--';
    return '#${value.toString()}';
  }

  String _playerImage(Map<String, dynamic> player) {
    final photo = player['image'] ?? player['photo'] ?? player['img'] ?? '';
    return _resolveImageUrl(photo.toString());
  }

  @override
  Widget build(BuildContext context) {
    final teamAPlayers = (widget.details.lineups?.teamA ?? [])
        .map(_asMap)
        .toList();
    final teamBPlayers = (widget.details.lineups?.teamB ?? [])
        .map(_asMap)
        .toList();

    final List<Map<String, dynamic>> tabs = [
      {
        'icon': _resolveImageUrl(widget.details.awayImage, fallback: widget.details.awayUrl),
        'title': widget.details.awayName ?? 'Away',
        'players': teamBPlayers,
      },
      {
        'icon': _resolveImageUrl(widget.details.homeImage, fallback: widget.details.homeUrl),
        'title': widget.details.homeName ?? 'Home',
        'players': teamAPlayers,
      },
    ];
    final List<Map<String, dynamic>> players =
        tabs[selectedIndex]['players'] as List<Map<String, dynamic>>;
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
                        url: tabs[index]['icon'],
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
        players.isEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: MyText(
                    text: 'No lineup available for this team.',
                    size: 14,
                    color: kQuaternaryColor,
                    weight: FontWeight.w500,
                  ),
                ),
              )
            : ListView.separated(
                itemCount: players.length,
                shrinkWrap: true,
                padding: AppSizes.VERTICAL,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final player = players[index];
                  return GestureDetector(
                    onTap: () {
                      // Get.to(() => PlayerDetails());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: kFillColor,
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          stops: [0.0, 1.0],
                          colors: [
                            kSecondaryColor.withValues(alpha: 0),
                            kSecondaryColor.withValues(alpha: 0.08),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        border: Border.all(color: kBorderColor, width: 1.0),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        spacing: 8,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 1.0, color: kTertiaryColor),
                                ),
                                child: CommonImageView(
                                  height: 36,
                                  width: 36,
                                  radius: 100,
                                  url: _playerImage(player),
                                  placeHolder: Assets.imagesPlayer,
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
                                    child: CommonImageView(
                                      url: tabs[selectedIndex]['icon'],
                                      height: 10,
                                      width: 10,
                                      radius: 5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MyText(
                                  text: _playerName(player),
                                  size: 16,
                                  weight: FontWeight.w700,
                                  paddingBottom: 2,
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                                MyText(
                                  text: _playerPosition(player),
                                  size: 12,
                                  color: kQuaternaryColor,
                                  weight: FontWeight.w500,
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kTertiaryColor.withValues(alpha: 0.05),
                            ),
                            alignment: Alignment.center,
                            child: MyText(
                              text: _playerNumber(player),
                              size: 12,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 8);
                },
              ),
      ],
    );
  }
}
