import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/app/config/appRouterHandler/app_router.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appButton/app_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
// import 'package:open_mail_app/open_mail_app.dart';

class MailSentAfterForgotPaswordRequestActionsWidget extends StatelessWidget {
  final String emailAddress;
  const MailSentAfterForgotPaswordRequestActionsWidget({
    super.key,
    required this.emailAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppButtonWidget(
          appButtonFunctionality: () async {
            await openMailAppForUser(context: context);
          },
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: AppColors.buttonColor,
          ),
          height: 50.0,
          child: Center(
            child: Text(
              AppStringConstants.openEmailApp,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const AppSpacerWidget(
          height: 20.0,
        ),
        Center(
          child: Text(
            AppStringConstants.or,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
              color: AppColors.textLighterColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const AppSpacerWidget(
          height: 40.0,
        ),
        Center(
          child: InkWell(
            onTap: () {
              context.router.replace(
                ForgotPasswordAuthCodeRoute(
                  emailAddress: emailAddress,
                ),
              );
            },
            child: Text(
              AppStringConstants.enterCode,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
                color: AppColors.enterCodeColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> openMailAppForUser({required BuildContext context}) async {
    // var result = await OpenMailApp.openMailApp();
    // if (!result.didOpen && result.canOpen) {
    //   if (context.mounted) {
    //     showDialog(
    //       context: context,
    //       builder: (_) {
    //         return MailAppPickerDialog(
    //           mailApps: result.options,
    //         );
    //       },
    //     );
    //   }
    // }
  }
}
