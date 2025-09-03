import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/screens/gpt/gpt_chat_screen.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class GPT extends StatelessWidget {
  GPT({super.key});

  static const List<String> suggestions = [
    'Want to analyze data ?',
    'Give me the best bet for today!',
    'Ask GG Anything!',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.DEFAULT,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            text: "Meet GG your\nAI Assistant",
            size: 28,
            lineHeight: 1.5,
            weight: FontWeight.w700,
            paddingBottom: 8,
            textAlign: TextAlign.center,
          ),
          MyText(
            text:
                "Get instant, data-driven insights by chatting with your smart betting assistant.",
            size: 14,
            weight: FontWeight.w500,
            color: kQuaternaryColor,
            lineHeight: 1.5,
            textAlign: TextAlign.center,
            paddingBottom: 24,
          ),
          Column(
            children: List.generate(
              suggestions.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => GptChatScreen());
                  },
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kFillColor,
                      border: Border.all(width: 1.0, color: kBorderColor),
                    ),
                    child: Center(
                      child: MyText(
                        text: suggestions[index],
                        textAlign: TextAlign.center,
                        weight: FontWeight.w500,
                        color: kTertiaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
