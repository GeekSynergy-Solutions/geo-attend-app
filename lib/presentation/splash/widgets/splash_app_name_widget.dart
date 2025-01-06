import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';

class SplashAppNameWidget extends StatelessWidget {
  const SplashAppNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: SvgPicture.asset(
        AppImagePath.appNameSvg,
      ),
    );
  }
}
