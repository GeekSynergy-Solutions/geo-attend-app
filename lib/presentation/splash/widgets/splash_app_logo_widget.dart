import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';

class SplashAppLogoWidget extends StatelessWidget {
  const SplashAppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppImagePath.appLogoSvg,
    );
  }
}
