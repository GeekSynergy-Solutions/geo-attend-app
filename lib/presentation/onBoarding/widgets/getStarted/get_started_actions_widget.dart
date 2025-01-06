import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/app/config/appRouterHandler/app_router.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appButton/app_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/presentation/onBoarding/bloc/events/on_boarding_event.dart';
import 'package:geoattend/presentation/onBoarding/bloc/on_boarding_bloc.dart';

class GetStartedActionsWidget extends StatelessWidget {
  const GetStartedActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppButtonWidget(
          appButtonFunctionality: () {
            context.router.push(
              const SignUpRoute(),
            );
          },
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: AppColors.buttonColor,
          ),
          height: 48.0,
          child: Center(
            child: Text(
              AppStringConstants.createAnAccount,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const AppSpacerWidget(
          height: 20.0,
        ),
        AppButtonWidget(
          appButtonFunctionality: () {
            BlocProvider.of<OnBoardingBloc>(context)
                .add(const UserAsAGuestEvent());
          },
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: AppColors.buttonWhiteBgColor,
            border: Border.all(
              color: AppColors.buttonBorderPrimaryColor,
              width: 1.5,
            ),
          ),
          height: 48.0,
          child: Center(
            child: Text(
              AppStringConstants.continueAsGuest,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
                color: AppColors.primaryTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const AppSpacerWidget(
          height: 40.0,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: AppStringConstants.alreadyHaveAnAccount,
                style: const TextStyle(
                  color: AppColors.textLighterColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                ),
              ),
              const TextSpan(text: ' '),
              TextSpan(
                text: AppStringConstants.login,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.router.push(
                      const LoginRoute(),
                    );
                  },
                style: const TextStyle(
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
