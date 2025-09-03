import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/view/widget/custom_app_bar.dart';
import 'package:game_grid/view/widget/custom_check_box_widget.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  int selectedIndex = 0;

  final List<Map<String, String>> languages = [
    {'title': 'English'},
    {'title': 'Chinese'},
    {'title': 'Dutch'},
    {'title': 'French'},
    {'title': 'Arabic'},
  ];

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Languages'),
        body: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 8),
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          itemCount: languages.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: kFillColor,
                  border: Border.all(
                    width: 1.0,
                    color: selectedIndex == index
                        ? kSecondaryColor
                        : kBorderColor,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: MyText(
                        text: languages[index]['title'] ?? '',
                        size: 16,
                        weight: FontWeight.w500,
                      ),
                    ),
                    CustomCheckBox(
                      isActive: selectedIndex == index,
                      circularRadius: 100,
                      radius: 16,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
