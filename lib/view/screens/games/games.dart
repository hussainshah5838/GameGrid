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
import 'package:game_grid/view/widget/country_widget.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/favroite_widget.dart';
import 'package:game_grid/view/widget/match_title_widget.dart';
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
      'countryFlag' : Assets.usFlag,
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
      'countryFlag' : Assets.armeniaFlag,
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
      'countryFlag' : Assets.chinaFlag,

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
      'countryFlag' : Assets.brazilFlag,

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
      'countryFlag' : Assets.indiaFlag,

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
              Favorites(
                title: 'Favorites',
                totalCounter: '2',
                child: ListView.separated(
                  itemCount: 2,
                  shrinkWrap: true,
                  padding: AppSizes.ZERO,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return MatchesTile(
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
                  return Country(
                    countryImage: country['countryFlag']!,
                    title: country['title']!,
                    totalCounter: country['totalCounter']!,
                    child: ListView.separated(
                      itemCount: matches.length,
                      shrinkWrap: true,
                      padding: AppSizes.ZERO,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final match = matches[index];
                        return MatchesTile(
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
