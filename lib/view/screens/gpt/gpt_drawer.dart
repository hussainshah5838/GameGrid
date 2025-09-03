import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class GptDrawer extends StatelessWidget {
  const GptDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chatHistory = [
      {
        'date': 'Yesterday',
        'chats': [
          'Tournament Bet Creation',
          'Best bet for today',
          'I need ur help with analyzing t...',
        ],
      },
      {
        'date': 'Last Week',
        'chats': [
          'How can i find the best playing...',
          'Best time to place a bid',
          'i need your serious help',
          'What are the latest trends goi ...',
          'Wan to research on this team’s ..',
        ],
      },
    ];
    return Container(
      width: Get.width * 0.7,
      color: kPrimaryColor,
      padding: AppSizes.HORIZONTAL,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 55),
          Row(children: [Image.asset(Assets.imagesLogo, height: 48)]),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kFillColor,
              border: Border.all(width: 1.0, color: kBorderColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: MyText(
                    text: 'New Chat',
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                ),
                Image.asset(Assets.imagesNewChat, height: 20),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: AppSizes.ZERO,
              physics: BouncingScrollPhysics(),
              itemCount: chatHistory.length,
              itemBuilder: (context, index) {
                final dayHistory = chatHistory[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: dayHistory['date'],
                      size: 12,
                      color: kQuaternaryColor,
                      weight: FontWeight.w500,
                      paddingTop: 24,
                      paddingBottom: 12,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      padding: AppSizes.ZERO,
                      physics: BouncingScrollPhysics(),
                      itemCount: dayHistory['chats'].length,
                      separatorBuilder: (context, chatIndex) => Container(
                        color: kBorderColor,
                        height: 1,
                        margin: EdgeInsets.symmetric(vertical: 14),
                      ),
                      itemBuilder: (context, chatIndex) {
                        final chat = dayHistory['chats'][chatIndex];
                        return MyText(
                          text: chat,
                          size: 14,
                          maxLines: 1,
                          textOverflow: TextOverflow.ellipsis,
                          weight: FontWeight.w500,
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
