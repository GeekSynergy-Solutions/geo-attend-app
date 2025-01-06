import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appButton/app_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';

class AttendanceSessionEndDescWidget extends StatelessWidget {
  const AttendanceSessionEndDescWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppImagePath.attendanceSessionEndedSvg,
        ),
        const AppSpacerWidget(
          height: 10.0,
        ),
        Text(
          AppStringConstants.endedLabel(desc: 'attendance'),
          style: const TextStyle(
            color: AppColors.textDarkerColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const AppSpacerWidget(
          height: 5.0,
        ),
        Text(
          AppStringConstants.sessionEndedDes,
          style: const TextStyle(
            color: AppColors.textLighterColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        const AppSpacerWidget(
          height: 20.0,
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
              AppStringConstants.sendCodeLabel,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
      ],
    );
  }
}
