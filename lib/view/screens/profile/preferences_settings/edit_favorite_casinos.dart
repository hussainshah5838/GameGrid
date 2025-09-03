import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/screens/subscription/subscription.dart';
import 'package:game_grid/view/widget/custom_app_bar.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_field_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class EditFavoriteCasinos extends StatefulWidget {
  const EditFavoriteCasinos({super.key});

  @override
  State<EditFavoriteCasinos> createState() => _EditFavoriteCasinosState();
}

class _EditFavoriteCasinosState extends State<EditFavoriteCasinos> {
  final List<String> _teams = [
    'Golden Ace Casino',
    'High Stakes Palace',
    'Diamond Fortune',
    'Fuel Due',
    'Jackpot Junction',
    'The Grand Gamble',
  ];

  final Set<String> _selectedSports = {};

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Set Preferences'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            MyText(
              text: 'Your Favorite Casinos',
              size: 18,
              weight: FontWeight.w700,
              paddingBottom: 6,
            ),
            MyText(
              text:
                  'Please select your favorite casino that will help us show you the best data based on your selection.',
              weight: FontWeight.w500,
              color: kQuaternaryColor,
              lineHeight: 1.5,
              paddingBottom: 16,
            ),
            CustomSearchBar(),
            MyText(
              paddingTop: 12,
              text: 'Popular Searches',
              size: 12,
              weight: FontWeight.w500,
              color: kQuaternaryColor,
              paddingBottom: 8,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _teams.map((sport) {
                final isSelected = _selectedSports.contains(sport);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedSports.remove(sport);
                      } else {
                        _selectedSports.add(sport);
                      }
                    });
                  },
                  child: _toggleButton(sport, isSelected),
                );
              }).toList(),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(
            buttonText: 'Update',
            onTap: () {
              Get.to(() => Subscription());
            },
          ),
        ),
      ),
    );
  }

  Container _toggleButton(String sport, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 11, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? kSecondaryColor.withValues(alpha: 0.2) : kFillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? kSecondaryColor : kBorderColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.imagesAdd,
            width: 18,
            height: 18,
            color: isSelected ? kSecondaryColor : kTertiaryColor,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 6),
          Text(
            sport,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? kSecondaryColor : kTertiaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 4),
        ],
      ),
    );
  }
}
