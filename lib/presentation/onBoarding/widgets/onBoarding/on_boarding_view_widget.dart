import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/domain/entity/objectData/onBoardingItemData/on_boarding_item_data.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/presentation/onBoarding/bloc/events/on_boarding_event.dart';
import 'package:geoattend/presentation/onBoarding/bloc/on_boarding_bloc.dart';
import 'package:geoattend/presentation/onBoarding/bloc/states/on_boarding_state.dart';
import 'package:geoattend/presentation/onBoarding/widgets/onBoarding/on_boarding_feature_description_widget.dart';
import 'package:geoattend/presentation/onBoarding/widgets/onBoarding/on_boarding_feature_img_widget.dart';

class OnBoardingViewWidget extends StatefulWidget {
  const OnBoardingViewWidget({super.key});

  @override
  State<OnBoardingViewWidget> createState() => _OnBoardingViewWidgetState();
}

class _OnBoardingViewWidgetState extends State<OnBoardingViewWidget> {
  final PageController pageController = PageController();
  List<OnBoardingItemData> onBoardingList = [];
  int currentSlideIndex = 0;

  @override
  void initState() {
    BlocProvider.of<OnBoardingBloc>(context)
        .add(const InitOnBoardingListItemsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = GeneralFunctions.getDeviceSize(context: context);
    return BlocListener<OnBoardingBloc, OnBoardingState>(
      listener: (context, state) {
        if (state.proceedToNextSlide != null) {
          setState(() {
            currentSlideIndex = state.slideIndex ?? currentSlideIndex;
          });
        }

        if (state.onBoardingItems != null) {
          setState(() {
            onBoardingList = state.onBoardingItems!;
          });
        }
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: PageView.builder(
            controller: pageController,
            itemCount: onBoardingList.length,
            onPageChanged: (currentIndex) {
              debugPrint('$currentIndex - $currentSlideIndex');
              BlocProvider.of<OnBoardingBloc>(context).add(
                OnBoardingSlideEvent(
                  currentSlideIndex: currentSlideIndex,
                  slideListLength: onBoardingList.length,
                  nextSlide: currentIndex >= currentSlideIndex,
                ),
              );
            },
            itemBuilder: (context, index) {
              return BlocBuilder<OnBoardingBloc, OnBoardingState>(
                builder: (context, state) {
                  currentSlideIndex = state.slideIndex ?? currentSlideIndex;
                  OnBoardingItemData onBoardingItemData =
                      onBoardingList[currentSlideIndex];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OnBoardingFeatureImgWidget(
                        featureImgPath: onBoardingItemData.picturePath,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                            bottom: size.height *
                                (((onBoardingList.length - 1) ==
                                        currentSlideIndex)
                                    ? 0.04
                                    : 0.07),
                          ),
                          alignment: AlignmentDirectional.bottomEnd,
                          child: OnBoardingFeatureDescriptionWidget(
                            currentSlide: currentSlideIndex,
                            featureTitle: onBoardingItemData.title,
                            featureDes: onBoardingItemData.description,
                            numberOfFeatures: onBoardingList.length,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
