import 'package:flutter/material.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';

class HostDetailsSummaryDesWidget extends StatelessWidget {
  final String attendanceName;
  final String attendanceDesc;
  const HostDetailsSummaryDesWidget({
    super.key,
    required this.attendanceName,
    required this.attendanceDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          attendanceName,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
            color: AppColors.textDarkerColor,
          ),
          textAlign: TextAlign.left,
        ),
        const AppSpacerWidget(
          height: 10.0,
        ),
        Text(
          attendanceDesc,
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
