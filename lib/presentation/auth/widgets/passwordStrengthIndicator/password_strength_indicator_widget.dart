import 'package:flutter/material.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';

class PasswordStrengthIndicatorWidget extends StatelessWidget {
  final String password;

  const PasswordStrengthIndicatorWidget({super.key, required this.password});

  bool get hasUpperCase => password.contains(RegExp(r'[A-Z]'));
  bool get hasLowerCase => password.contains(RegExp(r'[a-z]'));
  bool get hasSpecialCharacter =>
      password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool get hasNumericValue => password.contains(RegExp(r'[0-9]'));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          passwordIndicator('Upper Case', hasUpperCase),
          passwordIndicator('Lower Case', hasLowerCase),
          passwordIndicator('Special Character', hasSpecialCharacter),
          passwordIndicator('Numeric Value', hasNumericValue),
        ],
      ),
    );
  }

  Widget passwordIndicator(String label, bool isValid) {
    return Row(
      children: [
        Container(
          width: 15.0,
          height: 15.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.passwordIndicatorBorderColor,
            ),
            color: isValid ? AppColors.passwordIndicatorFillColor : null,
          ),
          child: isValid
              ? const Center(
                  child: Icon(
                    Icons.check,
                    color: AppColors.iconWhiteColor,
                    size: 12.0,
                  ),
                )
              : Container(),
        ),
        const AppSpacerWidget(width: 5),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: AppColors.textLighterColor,
          ),
        ),
      ],
    );
  }
}
