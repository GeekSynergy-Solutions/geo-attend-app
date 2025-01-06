import 'package:flutter/material.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appButton/app_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';

class SuccessfulWidget extends StatelessWidget {
  final String? successMessage;
  final String? actionLabel;
  final bool requireAnAction;
  final VoidCallback? actionFunctionality;
  const SuccessfulWidget({
    super.key,
    required this.requireAnAction,
    this.successMessage,
    this.actionLabel,
    this.actionFunctionality,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
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
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Icon(
                    Icons.close,
                    color: AppColors.iconPrimaryColor,
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.check_circle,
              color: AppColors.iconPrimaryColor,
              size: 30.0,
            ),
            const AppSpacerWidget(
              height: 10.0,
            ),
            Text(
              successMessage ?? 'Successful',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
                color: AppColors.primaryTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            const AppSpacerWidget(
              height: 10.0,
            ),
            if (requireAnAction)
              AppButtonWidget(
                appButtonFunctionality: actionFunctionality ?? () {},
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.primaryButtonColor,
                ),
                height: 50.0,
                child: Center(
                  child: Text(
                    actionLabel ?? 'Okay',
                    style:
                        const TextStyle(color: AppColors.buttonWhiteTextColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            if (requireAnAction)
              const AppSpacerWidget(
                height: 10.0,
              ),
          ],
        ),
      ),
    );
  }
}
