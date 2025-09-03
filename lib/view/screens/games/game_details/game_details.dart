import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_fonts.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/screens/games/game_details/details.dart';
import 'package:game_grid/view/screens/games/game_details/h_2_h.dart';
import 'package:game_grid/view/screens/games/game_details/lineup.dart';
import 'package:game_grid/view/screens/games/game_details/statistics.dart';
import 'package:game_grid/view/screens/notifications/notifications.dart';
import 'package:game_grid/view/widget/common_image_view_widget.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class GameDetails extends StatelessWidget {
  const GameDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabViews = ['Details', 'Lineups', 'Statistics', 'H2H'];
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
                          Stack(
                            clipBehavior: Clip.none,
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
                                  border: Border.all(
                                    color: kBorderColor,
                                    width: 1,
                                  ),
                                ),
                                padding: EdgeInsets.all(14),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(
                                          Assets.imagesFc,
                                          height: 36,
                                        ),
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
                                          SizedBox(height: 3),
                                          MyText(
                                            text: '0 - 4',
                                            size: 14,
                                            color: kRedColor,
                                            textAlign: TextAlign.center,
                                            weight: FontWeight.w700,
                                          ),
                                          SizedBox(height: 3),
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
                                        Image.asset(
                                          Assets.imagesRd,
                                          height: 36,
                                        ),
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
                              Positioned(
                                top: -10,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    width: 44,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: kRedColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 4,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            color: kTertiaryColor,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        MyText(
                                          text: 'LIVE',
                                          size: 10,
                                          weight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(48),
                    child: TabBar(
                      indicatorWeight: 1,
                      padding: AppSizes.ZERO,
                      labelPadding: AppSizes.ZERO,
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
              children: [Details(), Lineup(), Statistics(), H2H()],
            ),
          ),
        ),
      ),
    );
  }
}
