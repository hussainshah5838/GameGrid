import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';


class MyTextField extends StatefulWidget {
  MyTextField({
    Key? key,
    this.controller,
    this.errorMessage,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.isObSecure = false,
    this.marginBottom = 8.0,
    this.maxLines = 1,
    this.suffix,
    this.isReadOnly,
    this.onTap,
    this.validator,
    this.hasError = false, 
  }) : super(key: key);

  final String? labelText, hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool? isObSecure, isReadOnly;
  final double? marginBottom;
  final int? maxLines;
  final Widget? suffix;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validator;
  final bool hasError; 
  final String? errorMessage;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late FocusNode _focusNode;
  late TextEditingController _effectiveController;
  bool _createdController = false;

  String? _localErrorMessage; // <-- keep internal error state

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() => setState(() {}));

    if (widget.controller == null) {
      _effectiveController = TextEditingController();
      _createdController = true;
    } else {
      _effectiveController = widget.controller!;
    }

    _effectiveController.addListener(() {
      setState(() {
        if (widget.validator != null) {
          _localErrorMessage = widget.validator!(_effectiveController.text);
        }
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (_createdController) _effectiveController.dispose();
    super.dispose();
  }
@override
Widget build(BuildContext context) {
  final bool isFocused = _focusNode.hasFocus;
  final bool hasValue = _effectiveController.text.isNotEmpty;
  final bool showField = isFocused || hasValue;

  // Combine external + internal error
  final String? effectiveErrorMessage =
      widget.errorMessage ?? _localErrorMessage;
  final bool hasError = widget.hasError ||
      (effectiveErrorMessage != null && effectiveErrorMessage.isNotEmpty);

  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      _focusNode.requestFocus();
      widget.onTap?.call();
    },
    child: Focus(
      focusNode: _focusNode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          Container(
            margin: EdgeInsets.only(bottom: 4), 
            decoration: BoxDecoration(
              color: kFillColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 1.0,
                color: hasError ? kRedColor2 : kBorderColor,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 0, 12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          text: widget.labelText ?? '',
                          size: 12,
                          color: hasError
                              ? kRedColor2
                              : isFocused
                                  ? kQuaternaryColor
                                  : kTertiaryColor,
                          weight: FontWeight.w500,
                        ),
                        if (showField)
                          SizedBox(
                            height: 30,
                            child: TextFormField(
                              controller: _effectiveController,
                              validator: widget.validator,
                              onChanged: widget.onChanged,
                              obscureText: widget.isObSecure!,
                              obscuringCharacter: '*',
                              readOnly: widget.isReadOnly ?? false,
                              cursorColor: kTertiaryColor,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: kTertiaryColor,
                              ),
                              decoration: InputDecoration(
                                hintText: widget.hintText,
                                border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 4
                                  ),
                                  
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: kTertiaryColor.withValues(alpha: 0.4),
                                ),
                               
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (widget.suffix != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: hasError ? kRedColor2 : kTertiaryColor,
                        ),
                        child: widget.suffix!,
                      ),
                    ),
                ],
              ),
            ),
          ),
        
          if (hasError)
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 8),
              child: MyText(
                text: effectiveErrorMessage ?? "",
                color: kRedColor,
                size: 12,
              ),
            ),
        ],
      ),
    ),
  );
}
}

// ignore: must_be_immutable
// class PhoneField extends StatefulWidget {
//   PhoneField({
//     Key? key,
//     this.controller,
//     this.onChanged,
//     this.marginBottom = 16.0,
//   }) : super(key: key);

//   TextEditingController? controller;
//   ValueChanged<String>? onChanged;
//   double? marginBottom;

//   @override
//   State<PhoneField> createState() => _PhoneFieldState();
// }

// class _PhoneFieldState extends State<PhoneField> {
//   String countryFlag = '🇺🇸';
//   String countryCode = '1';
//   bool isFocused = false;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           MyText(
//             text: 'Phone Number',
//             size: 12,
//             color: kTertiaryColor,
//             paddingBottom: 6,
//             weight: FontWeight.w500,
//           ),
//           TextFormField(
//             cursorColor: kTertiaryColor,
//             controller: widget.controller,
//             onChanged: widget.onChanged,
//             textInputAction: TextInputAction.next,
//             style: TextStyle(fontSize: 14, color: kTertiaryColor),
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: kFillColor,
//               prefixIcon: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 100,
//                     child: Row(
//                       children: [
//                         SizedBox(width: 15),
//                         Expanded(
//                           child: MyText(
//                             paddingLeft: 10,
//                             paddingRight: 10,
//                             onTap: () {
//                               showCountryPicker(
//                                 context: context,
//                                 countryListTheme: CountryListThemeData(
//                                   flagSize: 25,
//                                   backgroundColor: kPrimaryColor,
//                                   textStyle: TextStyle(
//                                     fontSize: 14,
//                                     color: kTertiaryColor,
//                                     // fontFamily: AppFonts.URBANIST,
//                                   ),
//                                   bottomSheetHeight: 500,
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(10),
//                                     topRight: Radius.circular(10),
//                                   ),
//                                   searchTextStyle: TextStyle(
//                                     fontSize: 14,
//                                     color: kTertiaryColor,
//                                   ),
//                                   inputDecoration: InputDecoration(
//                                     contentPadding: EdgeInsets.symmetric(
//                                       horizontal: 15,
//                                     ),
//                                     fillColor: kBorderColor,
//                                     filled: true,
//                                     hintText: 'Search',
//                                     hintStyle: TextStyle(
//                                       fontSize: 14,
//                                       color: kTertiaryColor.withValues(
//                                         alpha: 0.4,
//                                       ),
//                                     ),
//                                     border: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: kBorderColor,
//                                         width: 1,
//                                       ),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: kBorderColor,
//                                         width: 1,
//                                       ),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: kSecondaryColor,
//                                         width: 1,
//                                       ),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                   ),
//                                 ),
//                                 onSelect: (Country country) {
//                                   setState(() {
//                                     countryFlag = country.flagEmoji;
//                                     countryCode = country.phoneCode;
//                                   });
//                                 },
//                               );
//                             },
//                             text: '${countryFlag}  +${countryCode}',
//                             size: 14,
//                             weight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               contentPadding: EdgeInsets.symmetric(horizontal: 15),
//               hintText: '000 000 0000',
//               hintStyle: TextStyle(
//                 fontSize: 14,
//                 color: kTertiaryColor.withValues(alpha: 0.4),
//               ),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(color: kBorderColor, width: 1),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: kBorderColor, width: 1),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: kSecondaryColor, width: 1),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: kRedColor, width: 1),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// ignore: must_be_immutable
class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.marginBottom = 16.0,
    this.isReadOnly,
    this.onTap,
  }) : super(key: key);

  String? labelText, hintText;
  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  bool? isReadOnly;
  double? marginBottom;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kFillColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1.0, color: kBorderColor),
      ),
      child: TextFormField(
        onTap: onTap,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: kTertiaryColor,
        readOnly: isReadOnly ?? false,
        controller: controller,
        onChanged: onChanged,
        textInputAction: TextInputAction.next,
        style: TextStyle(
          fontSize: 14,
          color: kTertiaryColor,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          prefixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(Assets.imagesSearch, height: 18)],
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          hintText: hintText ?? 'Search here...',
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: kTertiaryColor.withValues(alpha: 0.4),
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
