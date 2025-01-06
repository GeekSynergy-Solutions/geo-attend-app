import 'package:flutter/material.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';

class OnBoardingActionWidget extends StatelessWidget {
  final bool isItTheFirstOnBoardingItem;
  final bool isItTheLastOnBoardingItem;
  final VoidCallback skipOnBoarding;
  final VoidCallback previousSlide;
  final VoidCallback nextSlide;
  const OnBoardingActionWidget({
    super.key,
    required this.isItTheFirstOnBoardingItem,
    required this.isItTheLastOnBoardingItem,
    required this.skipOnBoarding,
    required this.previousSlide,
    required this.nextSlide,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
          onTap: isItTheFirstOnBoardingItem ? skipOnBoarding : previousSlide,
          child: Text(
            isItTheFirstOnBoardingItem ? 'Skip' : 'Back',
            style: const TextStyle(
              color: AppColors.onBoardingSkipOrBackTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        if (!isItTheLastOnBoardingItem)
          Expanded(
            child: InkWell(
              onTap: nextSlide,
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.onBoardingNextBtnBgColor,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: AppColors.onBoardingNextIconColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
