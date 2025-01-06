import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';

class AppBackButtonWidget extends StatelessWidget {
  final VoidCallback? popFunctionality;
  final Widget? child;
  const AppBackButtonWidget({
    super.key,
    this.popFunctionality,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Expanded(
          child: Align(
            alignment: AlignmentDirectional.topEnd,
            child: child ?? Container(),
          ),
        ),
      ],
    );
  }
}
