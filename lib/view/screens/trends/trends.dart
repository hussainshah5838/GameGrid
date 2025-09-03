import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_fonts.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/main.dart';
import 'package:game_grid/view/screens/profile/profile.dart';
import 'package:game_grid/view/screens/trends/players.dart';
import 'package:game_grid/view/screens/trends/teams.dart';
import 'package:game_grid/view/widget/common_image_view_widget.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Trends extends StatelessWidget {
  const Trends({super.key});

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
                      MyText(text: 'Trends', size: 20, weight: FontWeight.w500),
                      MyText(
                        paddingTop: 4,
                        text: 'Here you can view the latest trends and games.',
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
                _PlayersAndTeams(),
                _PlayersAndTeams(),
                _PlayersAndTeams(),
                _PlayersAndTeams(),
                _PlayersAndTeams(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlayersAndTeams extends StatefulWidget {
  const _PlayersAndTeams({Key? key}) : super(key: key);

  @override
  State<_PlayersAndTeams> createState() => _PlayersAndTeamsState();
}

class _PlayersAndTeamsState extends State<_PlayersAndTeams> {
  int selectedIndex = 0;
  final List<String> tabs = ['Players', 'Teams'];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.ZERO,
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 16, 20, 12),
          padding: EdgeInsets.all(3),
          height: 40,
          decoration: BoxDecoration(
            color: kFillColor,
            border: Border.all(color: kBorderColor, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
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
                    height: Get.height,
                    decoration: BoxDecoration(
                      color: isSelected ? kSecondaryColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      tabs[index],
                      style: TextStyle(
                        fontFamily: AppFonts.Satoshi,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? kPrimaryColor : kQuaternaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        selectedIndex == 0 ? Players() : Teams(),
      ],
    );
  }
}
