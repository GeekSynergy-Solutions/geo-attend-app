import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';

class AttendanceCreatedSuccessfullyDesWidget extends StatelessWidget {
  const AttendanceCreatedSuccessfullyDesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppImagePath.attendanceCreatedSuccessfulSvg,
        ),
        const AppSpacerWidget(
          height: 20.0,
        ),
        Text(
          AppStringConstants.successLabel,
          style: const TextStyle(
            color: AppColors.textDarkerColor,
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        const AppSpacerWidget(
          height: 10.0,
        ),
        Text(
          AppStringConstants.successfullyDes(desc: 'attendance'),
          style: const TextStyle(
            color: AppColors.textLighterColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
