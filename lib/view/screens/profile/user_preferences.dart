import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/screens/profile/language.dart';
import 'package:game_grid/view/screens/profile/preferences_settings/edit_favorite_casinos.dart';
import 'package:game_grid/view/screens/profile/preferences_settings/edit_favorite_players.dart';
import 'package:game_grid/view/screens/profile/preferences_settings/edit_favorite_sport.dart';
import 'package:game_grid/view/screens/profile/preferences_settings/edit_favorite_team.dart';
import 'package:game_grid/view/widget/custom_app_bar.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/heading_tile_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class UserPreferences extends StatelessWidget {
  const UserPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: "User Preferences"),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kFillColor,
                border: Border.all(width: 1.0, color: kBorderColor),
              ),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => Languages());
                },
                child: Row(
                  children: [
                    Image.asset(Assets.imagesChangeLanguage, height: 20),
                    Expanded(
                      child: MyText(
                        paddingLeft: 8,
                        text: 'Change Language',
                        size: 16,
                        weight: FontWeight.w500,
                      ),
                    ),
                    Image.asset(Assets.imagesArrowNext, height: 20),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            HeadingTile(title: 'Preference Settings'),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: kFillColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: kBorderColor, width: 1),
              ),
              padding: const EdgeInsets.all(12),
              child: ListView.separated(
                itemCount: 4,
                shrinkWrap: true,
                padding: AppSizes.ZERO,
                physics: BouncingScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 1,
                    color: kBorderColor,
                    margin: EdgeInsets.symmetric(vertical: 10),
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  final details = [
                    {'title': 'Favorite Sports'},
                    {'title': 'Favorite Team'},
                    {'title': 'Favorite Player'},
                    {'title': 'Favorite Casino'},
                  ];
                  final detail = details[index];
                  return GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Get.to(() => EditFavoriteSport());
                          break;
                        case 1:
                          Get.to(() => EditFavoriteTeam());
                          break;
                        case 2:
                          Get.to(() => EditFavoritePlayers());
                          break;
                        case 3:
                          Get.to(() => EditFavoriteCasinos());
                          break;
                      }
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: MyText(
                            text: detail['title'] ?? '',
                            size: 14,
                            weight: FontWeight.w500,
                          ),
                        ),
                        Image.asset(Assets.imagesArrowNext, height: 20),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
