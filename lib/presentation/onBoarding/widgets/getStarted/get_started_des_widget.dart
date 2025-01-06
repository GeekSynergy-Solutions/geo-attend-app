import 'package:flutter/widgets.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';

class GetStartedDesWidget extends StatelessWidget {
  const GetStartedDesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Text(
            AppStringConstants.getStartedTitle,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 28.0,
              color: AppColors.primaryTextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const AppSpacerWidget(
          height: 10.0,
        ),
        Text(
          AppStringConstants.getStartedDetails,
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
