import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';

class WelcomeToPremium extends StatelessWidget {
  const WelcomeToPremium({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(Assets.imagesSuccess, height: 150),
              MyText(
                paddingTop: 24,
                text: 'Welcome to Premium',
                size: 28,
                weight: FontWeight.w700,
                textAlign: TextAlign.center,
                paddingBottom: 8,
              ),
              MyText(
                text:
                    'Congratulations!\nYou have been successfully upgraded to premium version, now you can explore all the amazing features of the app.',
                size: 14,
                weight: FontWeight.w500,
                color: kQuaternaryColor,
                lineHeight: 1.5,
                textAlign: TextAlign.center,
                paddingBottom: 22,
              ),
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
                      margin: EdgeInsets.symmetric(vertical: 12),
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final details = [
                      {'title': 'Activation Date', 'value': 'June 23, 2025'},
                      {'title': 'Subscription Package', 'value': 'Premium'},
                      {'title': 'Payment Method', 'value': 'Mastercard ***23'},
                      {'title': 'Next Renewal Date', 'value': 'June 23, 2026'},
                    ];
                    final detail = details[index];
                    return Row(
                      children: [
                        Expanded(
                          child: MyText(
                            text: detail['title'] ?? '',
                            size: 12,
                            weight: FontWeight.w500,
                            color: kQuaternaryColor,
                          ),
                        ),
                        MyText(
                          text: detail['value'] ?? '',
                          size: 12,
                          weight: FontWeight.w500,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(buttonText: 'Go the Home page', onTap: () {}),
        ),
      ),
    );
  }
}
