
import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/view/screens/research/match_details/match_details.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class MatchesTile extends StatelessWidget {
  const MatchesTile({
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
        Get.to(() => MatchDetails());
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
