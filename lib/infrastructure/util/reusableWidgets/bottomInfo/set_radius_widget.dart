import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/domain/entity/objectData/geoFenceTypeData/distance_radius_data.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appButton/app_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';

class SetRadiusWidget extends StatefulWidget {
  final String type;
  final double currentSetValue;
  const SetRadiusWidget({
    super.key,
    this.type = '',
    this.currentSetValue = 0.0,
  });

  @override
  State<SetRadiusWidget> createState() => _SetRadiusWidgetState();
}

class _SetRadiusWidgetState extends State<SetRadiusWidget> {
  double setDistance = 12.0;

  double radiusDegree = 0.0;

  String type = '';

  @override
  void initState() {
    debugPrint('here is the given value of it ${widget.currentSetValue} 3');
    type = widget.type;
    setDistance =
        widget.currentSetValue > 0.0 ? widget.currentSetValue : setDistance;
    radiusDegree = getRadiusInDegree(distanceInMeters: setDistance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  AppImagePath.infoSvg,
                ),
              ),
            ),
            const AppSpacerWidget(
              height: 5.0,
            ),
            Text(
              AppStringConstants.geoFenceSetRadiusLabel(
                type: type,
              ),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
                color: AppColors.textDarkerColor,
              ),
              textAlign: TextAlign.center,
            ),
            const AppSpacerWidget(
              height: 10.0,
            ),
            Text(
              AppStringConstants.geoFenceSetRadiusDes,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10.0,
                color: AppColors.textLighterColor,
              ),
              textAlign: TextAlign.center,
            ),
            const AppSpacerWidget(
              height: 10.0,
            ),
            Slider(
              value: setDistance,
              label: '${setDistance}m',
              onChanged: (newSetDistance) {
                setState(() {
                  setDistance = newSetDistance.roundToDouble();
                  radiusDegree =
                      getRadiusInDegree(distanceInMeters: setDistance);
                });
              },
              min: 0,
              max: 100,
              inactiveColor: AppColors.inActiveSliderColor,
              activeColor: AppColors.activeSliderColor,
            ),
            const AppSpacerWidget(
              height: 20.0,
            ),
            AppButtonWidget(
              appButtonFunctionality: () {
                Navigator.of(context).pop(
                  DistanceRadiusData(
                    distance: setDistance,
                    radius: radiusDegree,
                  ),
                );
              },
              decoration: BoxDecoration(
                color: AppColors.activeButtonBgColor,
                borderRadius: BorderRadius.circular(25.0),
              ),
              height: 50.0,
              child: Center(
                child: Text(
                  AppStringConstants.setRadiusLabel(
                    type: type,
                  ),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double getRadiusInDegree({required double distanceInMeters}) {
    double degree = distanceInMeters / 111139;
    return degree;
  }
}
