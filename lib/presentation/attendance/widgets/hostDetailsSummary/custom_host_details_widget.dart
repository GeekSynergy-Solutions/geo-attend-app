import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';

class CustomHostDetailsWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  const CustomHostDetailsWidget({
    super.key,
    required this.description,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(icon),
            const AppSpacerWidget(
              width: 3.0,
            ),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.textLighterColor,
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
        const AppSpacerWidget(
          height: 5.0,
        ),
        Text(
          description,
          style: const TextStyle(
            color: AppColors.textDarkerColor,
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
