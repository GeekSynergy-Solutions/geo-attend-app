import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appButton/app_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';

class AttendanceReportSentDescWidget extends StatelessWidget {
  const AttendanceReportSentDescWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppImagePath.mailSvg,
        ),
        const AppSpacerWidget(
          height: 10.0,
        ),
        Text(
          AppStringConstants.reportSentLabel,
          style: const TextStyle(
            color: AppColors.textDarkerColor,
            fontSize: 28.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        const AppSpacerWidget(
          height: 5.0,
        ),
        Text(
          AppStringConstants.reportSentDes,
          style: const TextStyle(
            color: AppColors.textLighterColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        const AppSpacerWidget(
          height: 40.0,
        ),
        AppButtonWidget(
          appButtonFunctionality: () {},
          decoration: BoxDecoration(
            color: AppColors.activeButtonBgColor,
            borderRadius: BorderRadius.circular(25.0),
          ),
          height: 50.0,
          child: Center(
            child: Text(
              AppStringConstants.backToHomeLabel,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
      ],
    );
  }
}
