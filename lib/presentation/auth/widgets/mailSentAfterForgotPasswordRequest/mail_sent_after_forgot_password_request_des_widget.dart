import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';

class MailSentAfterForgotPasswordRequestDesWidget extends StatelessWidget {
  const MailSentAfterForgotPasswordRequestDesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppImagePath.mailSvg,
        ),
        const AppSpacerWidget(
          height: 40.0,
        ),
        Text(
          AppStringConstants.mailSentLabel,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
            color: AppColors.textDarkerColor,
          ),
          textAlign: TextAlign.center,
        ),
        const AppSpacerWidget(
          height: 10.0,
        ),
        Text(
          AppStringConstants.mailSentDes,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: AppColors.textLighterColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
