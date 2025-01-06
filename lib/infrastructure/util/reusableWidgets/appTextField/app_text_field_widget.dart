import 'package:flutter/material.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/generalConstantValues/general_constant_values.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appTextField/text_field_header_widget.dart';

class AppTextFieldWidget extends StatelessWidget {
  final bool isThereAnError;
  final TextInputType keyboardType;
  final bool enabled;
  final Color? cursorColor;
  final TextStyle? style;
  final bool? filledBackground;
  final Color? fillColor;
  final String hintText;
  final TextStyle? hintStyle;
  final String? errorText;
  final int? maxLines;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final bool? obscureText;
  final String title;
  final bool maintainDefaultHeight;
  final double increaseBy;
  final bool allowBottomPadding;
  final bool hasMultipleChidrenFields;
  final bool allowTopSpacing;
  final double bottomPaddingWhenTitleIsEmpty;
  final Widget? widgetAlongSideTitle;
  const AppTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isThereAnError,
    required this.keyboardType,
    required this.title,
    required this.enabled,
    required this.errorText,
    this.onChanged,
    this.cursorColor,
    this.fillColor,
    this.filledBackground,
    this.hintStyle,
    this.style,
    this.suffixIcon,
    this.obscureText,
    this.maintainDefaultHeight = true,
    this.increaseBy = 1,
    this.allowBottomPadding = true,
    this.hasMultipleChidrenFields = false,
    this.allowTopSpacing = false,
    this.bottomPaddingWhenTitleIsEmpty = 10.0,
    this.maxLines,
    this.widgetAlongSideTitle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldHeaderWidget(
      isThereAnError: isThereAnError,
      allowBottomPadding: allowBottomPadding,
      allowTopSpacing: allowTopSpacing,
      bottomPaddingWhenTitleIsEmpty: bottomPaddingWhenTitleIsEmpty,
      hasMultipleChidrenFields: hasMultipleChidrenFields,
      increaseBy: increaseBy,
      maintainDefaultHeight: maintainDefaultHeight,
      title: title,
      widgetAlongSideTitle: widgetAlongSideTitle,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        enabled: enabled,
        cursorColor: AppColors.cursorColor,
        obscuringCharacter: '*',
        obscureText: obscureText ?? false,
        style: style ?? GeneralConstantValues.textStyle,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            top: 12.0,
            bottom: 10.0,
            left: 10.0,
          ),
          fillColor: fillColor ?? AppColors.whiteBgColor,
          filled: filledBackground ?? true,
          hintText: hintText,
          hintStyle: GeneralConstantValues.hintTextStyle,
          errorText: errorText,
          errorMaxLines: GeneralConstantValues.errorMaxLines,
          errorStyle: GeneralConstantValues.errorTextStyle,
          border: GeneralConstantValues.borderTextFieldBorder,
          disabledBorder: GeneralConstantValues.borderTextFieldBorder,
          enabledBorder: GeneralConstantValues.borderTextFieldBorder,
          focusedBorder: GeneralConstantValues.borderTextFieldBorder,
          suffixIcon: suffixIcon,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
