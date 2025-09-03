import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_fonts.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/main.dart';
import 'package:game_grid/view/screens/research/match_details/player_details.dart';
import 'package:game_grid/view/widget/common_image_view_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class RPlayers extends StatefulWidget {
  const RPlayers({super.key});

  @override
  State<RPlayers> createState() => _RPlayersState();
}

class _RPlayersState extends State<RPlayers> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tabs = [
      {'icon': Assets.imagesFc, 'title': 'FC Barcelona'},
      {'icon': Assets.imagesRd, 'title': 'Real Madrid'},
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
        selectedIndex == 0 ? _team1() : _team2(),
      ],
    );
  }

  ListView _team1() {
    return ListView.separated(
      itemCount: 20,
      shrinkWrap: true,
      padding: AppSizes.VERTICAL,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(() => PlayerDetails());
          },
          child: Container(
            decoration: BoxDecoration(
              color: kFillColor,
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                stops: [0.0, 1.0],
                colors: [
                  Color(0xFF1643F3).withValues(alpha: 0),
                  Color(0xFF1643F3).withValues(alpha: 0.1),
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
                        url: dummyImg,
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
                          child: Image.asset(Assets.imagesLy, height: 10),
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
                        text: 'Marc-André ter Stegen',
                        size: 16,
                        weight: FontWeight.w700,
                        paddingBottom: 2,
                      ),
                      MyText(
                        text: 'Goalkeeper',
                        size: 12,
                        color: kQuaternaryColor,
                        weight: FontWeight.w500,
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
                  child: MyText(text: '#16', size: 12, weight: FontWeight.w500),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 8);
      },
    );
  }

  ListView _team2() {
    return ListView.separated(
      itemCount: 20,
      shrinkWrap: true,
      padding: AppSizes.VERTICAL,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(() => PlayerDetails());
          },
          child: Container(
            decoration: BoxDecoration(
              color: kFillColor,
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                stops: [0.0, 1.0],
                colors: [
                  Color(0xFF1643F3).withValues(alpha: 0),
                  Color(0xFF1643F3).withValues(alpha: 0.1),
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
                        url: dummyImg,
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
                          child: Image.asset(Assets.imagesRd, height: 10),
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
                        text: 'Marc-André ter Stegen',
                        size: 16,
                        weight: FontWeight.w700,
                        paddingBottom: 2,
                      ),
                      MyText(
                        text: 'Goalkeeper',
                        size: 12,
                        color: kQuaternaryColor,
                        weight: FontWeight.w500,
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
                  child: MyText(text: '#16', size: 12, weight: FontWeight.w500),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 8);
      },
    );
  }
}
