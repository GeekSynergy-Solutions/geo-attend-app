import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/app/config/appRouterHandler/app_router.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appButton/app_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/presentation/onBoarding/bloc/events/on_boarding_event.dart';
import 'package:geoattend/presentation/onBoarding/bloc/on_boarding_bloc.dart';
import 'package:geoattend/presentation/onBoarding/widgets/onBoarding/on_boarding_action_widget.dart';

class OnBoardingFeatureDescriptionWidget extends StatelessWidget {
  final String featureTitle;
  final String featureDes;
  final int numberOfFeatures;
  final int currentSlide;

  const OnBoardingFeatureDescriptionWidget({
    super.key,
    required this.featureTitle,
    required this.featureDes,
    required this.numberOfFeatures,
    required this.currentSlide,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = GeneralFunctions.getDeviceSize(context: context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          featureTitle,
          style: const TextStyle(
            color: AppColors.onBoardingFeatureTitleTextColor,
            fontWeight: FontWeight.w700,
            fontSize: 28.0,
          ),
          textAlign: TextAlign.left,
        ),
        AppSpacerWidget(
          height: size.height * 0.01,
        ),
        Text(
          featureDes,
          style: const TextStyle(
            color: AppColors.onBoardingFeatureDescTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
          textAlign: TextAlign.left,
        ),
        AppSpacerWidget(
          height: size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              numberOfFeatures,
              (index) {
                bool isItCurrentSlideIndex = currentSlide == index;
                return Container(
                  height: 12.0,
                  width: 25.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    border: Border.all(
                      width: 1.5,
                      color: isItCurrentSlideIndex
                          ? AppColors.onBoardingActiveIndicatorColor
                          : AppColors.onBoardingInActiveIndicatorColor,
                    ),
                    color: isItCurrentSlideIndex
                        ? AppColors.onBoardingActiveIndicatorColor
                        : AppColors.onBoardingInActiveIndicatorColor,
                  ),
                );
              },
            ),
          ],
        ),
        if ((numberOfFeatures - 1) == currentSlide)
          AppSpacerWidget(
            height: size.height * 0.02,
          ),
        if ((numberOfFeatures - 1) == currentSlide)
          AppButtonWidget(
            appButtonFunctionality: () {
              context.router.replace(const GetStartedRoute());
            },
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                30.0,
              ),
              color: AppColors.buttonColor,
            ),
            height: 48,
            child: Center(
              child: Text(
                AppStringConstants.getStartedLabel,
                style: const TextStyle(
                  color: AppColors.onBoardingGetStartedTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        AppSpacerWidget(
          height: size.height * 0.04,
        ),
        OnBoardingActionWidget(
          isItTheFirstOnBoardingItem: currentSlide == 0,
          isItTheLastOnBoardingItem: (numberOfFeatures - 1) == currentSlide,
          nextSlide: () {
            BlocProvider.of<OnBoardingBloc>(context).add(
              OnBoardingSlideEvent(
                currentSlideIndex: currentSlide,
                slideListLength: numberOfFeatures,
                nextSlide: true,
              ),
            );
          },
          previousSlide: () {
            BlocProvider.of<OnBoardingBloc>(context).add(
              OnBoardingSlideEvent(
                currentSlideIndex: currentSlide,
                slideListLength: numberOfFeatures,
                nextSlide: false,
              ),
            );
          },
          skipOnBoarding: () {
            context.router.replace(const GetStartedRoute());
          },
        ),
      ],
    );
  }
}
