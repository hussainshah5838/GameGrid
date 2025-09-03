import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_fonts.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/main.dart';
import 'package:game_grid/view/screens/games/game_details/game_details.dart';
import 'package:game_grid/view/screens/profile/profile.dart';
import 'package:game_grid/view/widget/common_image_view_widget.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Games extends StatelessWidget {
  const Games({super.key});

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
                      MyText(text: 'Games', size: 20, weight: FontWeight.w500),
                      MyText(
                        paddingTop: 4,
                        text: 'Here you can view upcoming games.',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Football extends StatefulWidget {
  const _Football({Key? key}) : super(key: key);

  @override
  State<_Football> createState() => _FootballState();
}

class _FootballState extends State<_Football> {
  int selectedIndex = 0;
  final List<String> tabs = [
    'May 14',
    'May 15',
    'Yesterday',
    'Today',
    'Tomorrow',
    'May 19',
    'May 20',
    'May 19',
  ];
  final List<Map<String, dynamic>> countries = [
    {
      'title': 'United States',
      'totalCounter': '10',
      'matches': <Map<String, String>>[
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
      ],
    },
    {
      'title': 'Armenia',
      'totalCounter': '8',
      'matches': <Map<String, String>>[
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
      ],
    },
    {
      'title': 'China',
      'totalCounter': '4',
      'matches': <Map<String, String>>[
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
      ],
    },
    {
      'title': 'Brazil',
      'totalCounter': '22',
      'matches': <Map<String, String>>[
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
      ],
    },
    {
      'title': 'India',
      'totalCounter': '11',
      'matches': <Map<String, String>>[
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
        {
          'time': '09:45 am',
          'team1': 'FC Barcelona',
          'team2': 'Real Madrid',
          'team1Logo': Assets.imagesLy,
          'team2Logo': Assets.imagesLy,
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.ZERO,
      physics: BouncingScrollPhysics(),
      children: [
        // ...existing code...
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          height: 48,
          decoration: BoxDecoration(
            color: kFillColor,
            border: Border(bottom: BorderSide(color: kBorderColor, width: 1)),
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: tabs.length,
            padding: AppSizes.HORIZONTAL,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => SizedBox(width: 12),
            itemBuilder: (context, index) {
              final isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: Get.height,
                  decoration: BoxDecoration(
                    color: isSelected ? kSecondaryColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    tabs[index],
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

        Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Favorites(
                title: 'Favorites',
                totalCounter: '2',
                child: ListView.separated(
                  itemCount: 2,
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
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 16);
                  },
                ),
              ),
              MyText(
                paddingTop: 12,
                paddingBottom: 8,
                text: '34 Matches found',
                size: 12,
                weight: FontWeight.w500,
                color: kQuaternaryColor,
              ),

              ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 8);
                },
                padding: AppSizes.ZERO,
                itemCount: countries.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, countryIndex) {
                  final country = countries[countryIndex];
                  final matches =
                      country['matches'] as List<Map<String, String>>;
                  return _Country(
                    title: country['title']!,
                    totalCounter: country['totalCounter']!,
                    child: ListView.separated(
                      itemCount: matches.length,
                      shrinkWrap: true,
                      padding: AppSizes.ZERO,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final match = matches[index];
                        return _MatchesTile(
                          isActive: index.isOdd,
                          onTap: () {},
                          time: match['time']!,
                          team1: match['team1']!,
                          team2: match['team2']!,
                          team1Logo: match['team1Logo']!,
                          team2Logo: match['team2Logo']!,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Favorites extends StatefulWidget {
  const _Favorites({
    required this.title,
    required this.child,
    required this.totalCounter,
  });
  final String title;
  final Widget child;
  final String totalCounter;

  @override
  State<_Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<_Favorites> {
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kFillColor,
        border: Border.all(color: kBorderColor, width: 1.0),
      ),
      padding: const EdgeInsets.all(10),
      child: ExpandableNotifier(
        controller: _controller,
        child: ScrollOnExpand(
          child: ExpandablePanel(
            controller: _controller,
            theme: ExpandableThemeData(tapHeaderToExpand: true, hasIcon: false),
            header: Container(
              child: Row(
                children: [
                  Image.asset(Assets.imagesStar, height: 18),
                  Expanded(
                    child: MyText(
                      paddingLeft: 2,
                      text: widget.title,
                      size: 16,
                      weight: FontWeight.w500,
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
                  SizedBox(width: 8),
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

class _Country extends StatefulWidget {
  const _Country({
    required this.title,
    required this.child,
    required this.totalCounter,
  });
  final String title;
  final Widget child;
  final String totalCounter;

  @override
  State<_Country> createState() => _CountryState();
}

class _CountryState extends State<_Country> {
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kFillColor,
        border: Border.all(color: kBorderColor, width: 1.0),
      ),
      padding: const EdgeInsets.all(10),
      child: ExpandableNotifier(
        controller: _controller,
        child: ScrollOnExpand(
          child: ExpandablePanel(
            controller: _controller,
            theme: ExpandableThemeData(tapHeaderToExpand: true, hasIcon: false),
            header: Container(
              child: Row(
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
                          height: 32,
                          width: 32,
                          radius: 100,
                          url: dummyImg,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(Assets.imagesPlayer, height: 10),
                      ),
                    ],
                  ),
                  Expanded(
                    child: MyText(
                      paddingLeft: 10,
                      text: widget.title,
                      size: 16,
                      weight: FontWeight.w500,
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
                  SizedBox(width: 8),
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

class _MatchesTile extends StatelessWidget {
  const _MatchesTile({
    required this.isActive,
    required this.onTap,
    required this.time,
    required this.team1,
    required this.team2,
    required this.team1Logo,
    required this.team2Logo,
  });
  final bool isActive;
  final VoidCallback onTap;
  final String time;
  final String team1;
  final String team2;
  final String team1Logo;
  final String team2Logo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => GameDetails());
      },
      child: Row(
        children: [
          MyText(text: time, size: 13, weight: FontWeight.w700),
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
