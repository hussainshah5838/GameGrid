
import 'dart:ui';

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
          title: "Success",
          titleText: MyText(text: title, color: textColor,),
          messageText: MyText(text: mesage, color: messageTextColor,),
          backgroundColor: bgColor,
        )
      );


}