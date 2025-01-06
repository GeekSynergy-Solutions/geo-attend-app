import 'package:flutter/material.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';

class LoginPasswordDesWidget extends StatelessWidget {
  const LoginPasswordDesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStringConstants.enterPasswordLabel,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 28.0,
            color: AppColors.textDarkerColor,
          ),
          textAlign: TextAlign.left,
        ),
        const AppSpacerWidget(
          height: 10.0,
        ),
        Text(
          AppStringConstants.enterPasswordDes,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: AppColors.textLighterColor,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}