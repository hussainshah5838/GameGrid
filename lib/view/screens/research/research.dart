
import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_fonts.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/controllers/research_controller.dart';
import 'package:game_grid/main.dart';
import 'package:game_grid/view/screens/profile/profile.dart';
import 'package:game_grid/view/screens/research/match_details/match_details.dart';
import 'package:game_grid/view/widget/common_image_view_widget.dart';
import 'package:game_grid/view/widget/country_widget.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/favroite_widget.dart';
import 'package:game_grid/view/widget/match_title_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Research extends StatefulWidget {
  const Research({super.key});

  @override
  State<Research> createState() => _ResearchState();
}

class _ResearchState extends State<Research> {
  @override
  void initState() {
    super.initState();
    Get.put(ResearchController());
    // ApiServiceForCategory.instance.getMatches(endpoint: "/soccernew/home",);
  }

  @override
  void dispose() {
    if (Get.isRegistered<ResearchController>()) {
      Get.delete<ResearchController>();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final List<String> tabViews = [
      'Cricket',
      'Basketball',
      'Football',
      'Baseball',
      'Soccer ',
    ];
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
                  backgroundColor: kFillColor,
                  actionsPadding: EdgeInsets.zero,
                  automaticallyImplyLeading: false,
                  titleSpacing: 20.0,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MyText(
                        text: 'Research',
                        size: 20,
                        weight: FontWeight.w500,
                      ),
                      MyText(
                        paddingTop: 4,
                        text: 'Here you can find the best ongoing leagues.',
                        size: 12,
                        weight: FontWeight.w500,
                        color: kQuaternaryColor,
                      ),
                    ],
                  ),
                  actions: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => Profile());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1.0,
                              color: kTertiaryColor,
                            ),
                          ),
                          child: CommonImageView(
                            height: 38,
                            width: 38,
                            radius: 100,
                            url: dummyImg,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(48),
                    child: TabBar(
                      isScrollable: true,
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
              children: [
                _Football(),
                _Football(),
                _Football(),
                _Football(),
                _Football(),
                //  Soccer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Replace the existing _Football and _FootballState classes in your UI file.

class _Football extends StatefulWidget {
  const _Football({Key? key}) : super(key: key);

  @override
  State<_Football> createState() => _FootballState();
}

class _FootballState extends State<_Football> {
  int selectedIndex = 3;
  // FootyStats CDN host for logo paths like "teams/foo.png"
  static const String _imageBase = 'https://cdn.footystats.org/img/';
  late final ResearchController controller;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    controller = Get.find<ResearchController>();
  }

  

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.error.value.isNotEmpty) {
        return Center(
          child: Text(
            'Error: ${controller.error.value}',
            style: const TextStyle(color: Colors.white),
          ),
        );
      }

      final matches = controller.matches;
      final availableDates = matches
          .map((m) => DateTime.fromMillisecondsSinceEpoch(m.dateUnix * 1000, isUtc: true).toLocal())
          .map((d) => DateTime(d.year, d.month, d.day))
          .toSet()
          .toList()
        ..sort((a, b) => a.compareTo(b));
      selectedDate ??= availableDates.isNotEmpty ? availableDates.first : null;
      if (availableDates.isNotEmpty && !availableDates.contains(selectedDate)) {
        selectedDate = availableDates.first;
      }
      if (availableDates.isNotEmpty && selectedIndex >= availableDates.length) {
        selectedIndex = 0;
      }
      final currentSelectedIndex =
          selectedDate == null ? -1 : availableDates.indexOf(selectedDate!);
      final filteredMatches = selectedDate == null
          ? matches
          : matches
              .where((m) {
                final date =
                    DateTime.fromMillisecondsSinceEpoch(m.dateUnix * 1000, isUtc: true).toLocal();
                final localDate = DateTime(date.year, date.month, date.day);
                return localDate == selectedDate;
              })
              .toList();
      final favoriteMatches = controller.favoriteMatches;

      if (matches.isEmpty) {
        return const Center(child: Text('No matches found.'));
      }

      return ListView(
        shrinkWrap: true,
        padding: AppSizes.ZERO,
        physics: const BouncingScrollPhysics(),
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: 48,
              decoration: BoxDecoration(
                color: kFillColor,
                border: Border(bottom: BorderSide(color: kBorderColor, width: 1)),
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: availableDates.length,
                padding: AppSizes.HORIZONTAL,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final isSelected = currentSelectedIndex == index;
                  final date = availableDates[index];
                  final label = _formatDateLabel(date);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedDate = date;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      height: Get.height,
                      decoration: BoxDecoration(
                        color: isSelected ? kSecondaryColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        label,
                        style: TextStyle(
                          fontFamily: AppFonts.Satoshi,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? kPrimaryColor : kQuaternaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: AppSizes.DEFAULT,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Favorites(
                  title: 'Favorites',
                  totalCounter: favoriteMatches.length.toString(),
                  child: favoriteMatches.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Center(
                            child: MyText(
                              text: 'No favorite matches yet.',
                              size: 12,
                              weight: FontWeight.w500,
                              color: kQuaternaryColor,
                            ),
                          ),
                        )
                      : ListView.separated(
                          itemCount: favoriteMatches.length,
                          shrinkWrap: true,
                          padding: AppSizes.ZERO,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final match = favoriteMatches[index];
                            return MatchesTile(
                              isActive: match.status == "Live",
                              isFavorite: true,
                              onTap: () => Get.to(
                                () => MatchDetails(matchId: match.id.toString()),
                              ),
                              onFavoriteTap: () => controller.toggleFavorite(match),
                              time: match.stadiumName,
                              team1: match.awayName,
                              team2: match.homeName,
                              team1Logo: _resolveImageUrl(
                                match.awayImage,
                                fallback: match.awayUrl,
                              ),
                              team2Logo: _resolveImageUrl(
                                match.homeImage,
                                fallback: match.homeUrl,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 16);
                          },
                        ),
                ),
                MyText(
                  paddingTop: 12,
                  paddingBottom: 8,
                  text: '${filteredMatches.length} Matches found',
                  size: 12,
                  weight: FontWeight.w500,
                  color: kQuaternaryColor,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  padding: AppSizes.ZERO,
                  itemCount: filteredMatches.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(), // Parent ListView scrolls
                  itemBuilder: (context, matchIndex) {
                    final match = filteredMatches[matchIndex];

                    final isFavorite = controller.isFavorite(match.id);
                    return Country(
                      countryImage:_resolveImageUrl( match.awayImage),
                      title: match.awayName,
                      totalCounter: matches.length.toString(),
                      child: MatchesTile(
                        isActive: match.status == "Live",
                        isFavorite: isFavorite,
                        onTap: () => Get.to(
                          () => MatchDetails(matchId: match.id.toString()),
                        ),
                        onFavoriteTap: () => controller.toggleFavorite(match),
                        time: match.stadiumName,
                        team1: match.awayName,
                        team2: match.homeName,
                        // API already returns full image URLs
                        team1Logo: _resolveImageUrl(
                          match.awayImage,
                          fallback: match.awayUrl,
                        ),
                        team2Logo: _resolveImageUrl(
                          match.homeImage,
                          fallback: match.homeUrl,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  // Ensures images render even when API returns relative paths like "teams/foo.png"
  String _resolveImageUrl(String url, {String? fallback}) {
    if (url.isNotEmpty && url.startsWith('http')) return url;
    if (fallback != null && fallback.startsWith('http')) return fallback;
    if (url.isEmpty && (fallback == null || fallback.isEmpty)) return '';
    final trimmed = url.startsWith('/') ? url.substring(1) : url;
    return '$_imageBase$trimmed';
  }

  String _formatDateLabel(DateTime date) {
    final today = DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);
    final normalizedTarget = DateTime(date.year, date.month, date.day);
    final diff = normalizedTarget.difference(normalizedToday).inDays;

    if (diff == 0) return 'Today';
    if (diff == 1) return 'Tomorrow';
    if (diff == -1) return 'Yesterday';
    return DateFormat('MMM d').format(normalizedTarget);
  }
}
