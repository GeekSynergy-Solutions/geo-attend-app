import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';

class LoginDesWidget extends StatelessWidget {
  const LoginDesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Container(
            width: 263,
            height: 263,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.loginCircularBgColor,
            ),
            child: Center(
              child: SvgPicture.asset(
                AppImagePath.loginSvg,
              ),
            ),
          ),
        ),
        const AppSpacerWidget(
          height: 20.0,
        ),
        Text(
          AppStringConstants.welcomeBackLabel,
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
          AppStringConstants.welcomeBackLabel,
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
