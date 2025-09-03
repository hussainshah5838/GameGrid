import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/widget/custom_app_bar.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(
          title: "Notifications",
          actions: [
            Center(
              child: MyText(
                text: 'Clear all',
                size: 16,
                weight: FontWeight.w500,
                color: kSecondaryColor,
                paddingRight: 20,
              ),
            ),
          ],
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          itemCount: 3,
          itemBuilder: (ctx, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // MyText(
                //   text: index == 0
                //       ? "Today"
                //       : index == 1
                //       ? "Yesterday"
                //       : 'Past',
                //   size: 16,
                //   color: kTertiaryColor.withValues(alpha: 0.4),
                //   weight: FontWeight.w700,
                //   paddingTop: index == 0 ? 0 : 10,
                //   paddingBottom: 8,
                // ),
                ...List.generate(index == 0 ? 3 : 2, (i) {
                  // Sample notification data
                  final notifications = [
                    {
                      'title': 'Account Created!',
                      'subTitle': 'Your account has been successfully created!',
                      'time': '12 mins ago',
                    },
                    {
                      'title': 'Added to favorites',
                      'subTitle': 'You have added a game to your favorites.',
                      'time': '12 mins ago',
                    },
                    {
                      'title': 'Payment Method added',
                      'subTitle':
                          'You have added our master card payment method.',
                      'time': '12 mins ago',
                    },
                  ];

                  return _NotificationTile(
                    title: notifications[i]['title']!,
                    subTitle: notifications[i]['subTitle']!,
                    time: notifications[i]['time']!,
                    onRemove: () {},
                  );
                }),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final String title, subTitle, time;
  final VoidCallback onRemove;
  const _NotificationTile({
    required this.title,
    required this.time,
    required this.onRemove,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.22,
        motion: ScrollMotion(),
        children: [
          Expanded(
            child: Container(
              width: Get.width,
              margin: EdgeInsets.only(bottom: 8, left: 8),
              decoration: BoxDecoration(
                color: kRedColor.withValues(alpha: 0.1),
                border: Border.all(color: kRedColor, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Image.asset(Assets.imagesTrash, height: 32)),
            ),
          ),
        ],
      ),
      child: Container(
        width: Get.width,
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: kFillColor,
          border: Border.all(width: 1.0, color: kBorderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: MyText(
                    text: title,
                    size: 16,
                    weight: FontWeight.w500,
                    paddingBottom: 2,
                  ),
                ),
                MyText(
                  text: time,
                  size: 12,
                  weight: FontWeight.w500,
                  color: kTertiaryColor.withValues(alpha: 0.4),
                ),
              ],
            ),
            MyText(
              paddingTop: 4,
              text: subTitle,
              size: 12,
              weight: FontWeight.w500,
              color: kTertiaryColor.withValues(alpha: 0.6),
            ),
          ],
        ),
      ),
    );
  }
}
