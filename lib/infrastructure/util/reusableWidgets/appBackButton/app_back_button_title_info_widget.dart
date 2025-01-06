import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';

class AppBackButtonTitleInfoWidget extends StatelessWidget {
  final VoidCallback? popFunctionality;
  final VoidCallback infoDetailsFunctionality;
  final String title;
  const AppBackButtonTitleInfoWidget({
    super.key,
    required this.title,
    required this.infoDetailsFunctionality,
    this.popFunctionality,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: popFunctionality ?? () => context.router.maybePop(),
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: AppColors.backButtonBgColor,
              borderRadius: BorderRadius.circular(
                5.0,
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                AppImagePath.appBackButtonSvg,
              ),
            ),
          ),
        ),
        FittedBox(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
              color: AppColors.createAttendanceHeaderColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        InkWell(
          onTap: infoDetailsFunctionality,
          child: SvgPicture.asset(
            AppImagePath.infoSvg,
          ),
        ),
      ],
    );
  }
}
