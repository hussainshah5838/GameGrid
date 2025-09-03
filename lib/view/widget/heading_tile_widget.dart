import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';

class HeadingTile extends StatelessWidget {
  const HeadingTile({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.imagesBar, height: 16),
        Expanded(
          child: MyText(
            text: title,
            paddingLeft: 6,
            weight: FontWeight.w500,
            color: kTertiaryColor.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
