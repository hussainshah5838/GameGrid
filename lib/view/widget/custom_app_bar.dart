import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

AppBar simpleAppBar({
  bool haveLeading = true,
  String? title,
  Widget? leadingWidget,
  bool? centerTitle = false,
  bool? haveBorder = true,
  List<Widget>? actions,
  Color? bgColor,
  VoidCallback? onLeadingTap,
}) {
  return AppBar(
    backgroundColor: kFillColor,
    centerTitle: centerTitle,
    automaticallyImplyLeading: false,
    titleSpacing: 0.0,
    leadingWidth: 80,
    leading: haveLeading
        ? leadingWidget ??
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: onLeadingTap ?? () => Get.back(),
                    child: Image.asset(
                      Assets.imagesArrowBackRounded,
                      height: 40,
                    ),
                  ),
                ],
              )
        : null,
    title: MyText(
      text: title ?? '',
      size: 18,
      color: kTertiaryColor,
      weight: FontWeight.w600,
    ),
    actions: actions,
    elevation: 0,
    shape: haveBorder!
        ? Border(bottom: BorderSide(color: kBorderColor, width: 1.0))
        : null,
  );
}

// AppBar customAppBar({
//   bool haveLeading = true,
//   String? title,
//   Widget? leadingWidget,
//   bool? centerTitle = true,
//   List<Widget>? actions,
//   Color? bgColor,
//   VoidCallback? onLeadingTap,
// }) {
//   return AppBar(
//     backgroundColor: Colors.transparent,
//     centerTitle: centerTitle,
//     automaticallyImplyLeading: false,
//     titleSpacing: 16.0,
//     leading: haveLeading
//         ? leadingWidget ??
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: onLeadingTap ?? () => Get.back(),
//                     child: Image.asset(Assets.imagesClose, height: 24),
//                   ),
//                 ],
//               )
//         : null,
//     title: MyText(
//       text: title ?? '',
//       size: 14,
//       color: kTertiaryColor,
//       weight: FontWeight.w600,
//     ),
//     actions: actions,
//   );
// }
