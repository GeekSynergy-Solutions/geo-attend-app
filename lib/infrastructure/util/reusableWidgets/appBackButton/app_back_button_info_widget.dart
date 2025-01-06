import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBackButton/app_back_button_widget.dart';

class AppBackButtonInfoWidget extends StatelessWidget {
  final VoidCallback infoDetailsFunctionality;
  const AppBackButtonInfoWidget(
      {super.key, required this.infoDetailsFunctionality});

  @override
  Widget build(BuildContext context) {
    return AppBackButtonWidget(
      child: InkWell(
        onTap: infoDetailsFunctionality,
        child: SvgPicture.asset(
          AppImagePath.infoSvg,
        ),
      ),
    );
  }
}
