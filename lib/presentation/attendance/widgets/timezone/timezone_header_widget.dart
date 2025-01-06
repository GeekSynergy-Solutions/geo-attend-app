import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';

class TimezoneHeaderWidget extends StatelessWidget {
  const TimezoneHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => context.router.maybePop(),
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
        const FittedBox(
          child: Text(
            'Time Zones',
            style:  TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
              color: AppColors.createAttendanceHeaderColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        InkWell(
          onTap: (){
            
          },
          child: const Icon(Icons.search, color: AppColors.iconSearchColor,),
        ),
      ],
    );
  }
}
