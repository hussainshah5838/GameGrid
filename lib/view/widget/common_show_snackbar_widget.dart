
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

showCommonSnackbarWidget(
 final String title, 
 final String mesage,
  final Color textColor,
  final Color messageTextColor,  
  final Color bgColor,  

){
Get.showSnackbar(
  
        GetSnackBar(
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          borderRadius: 20,
          title: "Success",
          titleText: MyText(text: title, color: textColor, weight: FontWeight.bold,),
          messageText: MyText(text: mesage, color: messageTextColor, weight: FontWeight.bold,),
          backgroundColor: bgColor,
        )
      );

}