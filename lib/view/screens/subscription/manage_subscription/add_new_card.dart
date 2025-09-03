import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/widget/custom_app_bar.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_field_widget.dart';

class AddNewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Add new Card'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            MyTextField(
              labelText: 'Card Number',
              hintText: '4566 - 457656 - 567 - 6',
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(Assets.imagesMaster, height: 24)],
              ),
            ),
            MyTextField(
              labelText: 'Card Holder Name',
              hintText: 'Kevin backer',
            ),
            Row(
              children: [
                Expanded(
                  child: MyTextField(
                    labelText: 'Expiry Date',
                    hintText: '05/29',
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: MyTextField(labelText: 'CVV', hintText: '058'),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(buttonText: 'Add', onTap: () {}),
        ),
      ),
    );
  }
}
