import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';

// ignore: must_be_immutable
class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    required this.hint,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.bgColor,
    this.marginBottom,
    this.width,
    this.labelText,
    this.hintColor,
    this.radius,
    this.border,
    this.height,
  });

  final List<dynamic>? items;
  String selectedValue;
  final ValueChanged<dynamic>? onChanged;
  String hint;
  String? labelText;
  double? radius;
  double? border;
  Color? bgColor;
  Color? hintColor;
  double? marginBottom, width, height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: marginBottom ?? 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (labelText != null)
            MyText(
              text: labelText ?? '',
              size: 12,
              color: kBlackColor,
              paddingBottom: 6,
              weight: FontWeight.bold,
            ),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              items: items!
                  .map(
                    (item) => DropdownMenuItem<dynamic>(
                      value: item,
                      child: MyText(text: item, size: 14),
                    ),
                  )
                  .toList(),
              value: selectedValue,
              onChanged: onChanged,
              iconStyleData: IconStyleData(icon: SizedBox()),
              isDense: true,
              isExpanded: false,
              customButton: Container(
                height: height ?? 48,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: bgColor ?? kBorderColor,
                  border: Border.all(width: border ?? 1, color: kBorderColor),
                  borderRadius: BorderRadius.circular(radius ?? 10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyText(
                        text: selectedValue == hint ? hint : selectedValue,
                        size: 14,
                        weight: FontWeight.w500,
                        color: selectedValue == hint
                            ? kBlackColor.withValues(alpha: 0.6)
                            : kBlackColor,
                      ),
                    ),
                    // Image.asset(
                    //   Assets.imagesArrowDown,
                    //   height: 16,
                    //   color: kBlackColor,
                    // ),
                  ],
                ),
              ),
              menuItemStyleData: MenuItemStyleData(height: 35),
              dropdownStyleData: DropdownStyleData(
                elevation: 3,
                maxHeight: 300,
                offset: Offset(0, -5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MyDropDown extends StatelessWidget {
  MyDropDown({
    required this.hint,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.prefixIcon,
    this.havePrefix = true,
    this.height,
    this.textSize,
    this.iconSize,
    this.horizontalPadding,
  });

  final List<dynamic>? items;
  final String selectedValue;
  final ValueChanged<dynamic>? onChanged;
  final String hint;
  final String prefixIcon;
  final bool? havePrefix;
  final double? height;
  final double? textSize;
  final double? iconSize;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        items: items!
            .map(
              (item) => DropdownMenuItem<dynamic>(
                value: item,
                child: MyText(text: item, size: 14),
              ),
            )
            .toList(),
        value: selectedValue,
        onChanged: onChanged,
        iconStyleData: IconStyleData(icon: SizedBox()),
        isDense: true,
        isExpanded: false,
        customButton: Container(
          height: height ?? 36,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 6),
          decoration: BoxDecoration(
            color: Color(0xff272924).withValues(alpha: 0.6),
            border: Border.all(
              width: 1,
              color: kTertiaryColor.withValues(alpha: 0.08),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              if (havePrefix!) ...[
                Image.asset(prefixIcon, height: 15),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  width: 1,
                  color: kTertiaryColor.withValues(alpha: 0.08),
                ),
              ],
              Expanded(
                child: MyText(
                  paddingLeft: havePrefix! ? 4 : 0,
                  text: selectedValue == hint ? hint : selectedValue,
                  size: textSize ?? 12,
                  paddingRight: 4,
                  weight: FontWeight.w500,
                  color: kTertiaryColor,
                ),
              ),
              Image.asset(
                Assets.imagesDropDown,
                height: iconSize ?? 16,
                color: kTertiaryColor,
              ),
            ],
          ),
        ),
        menuItemStyleData: MenuItemStyleData(height: 25),
        dropdownStyleData: DropdownStyleData(
          elevation: 3,
          maxHeight: 300,
          offset: Offset(0, -5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
