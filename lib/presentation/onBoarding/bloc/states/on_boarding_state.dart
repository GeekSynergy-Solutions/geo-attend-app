import 'package:equatable/equatable.dart';
import 'package:geoattend/domain/entity/objectData/onBoardingItemData/on_boarding_item_data.dart';
import 'package:geoattend/domain/entity/response/auth/verifiedUserData/verified_user_data_response.dart';

class OnBoardingState extends Equatable {
  const OnBoardingState({
    this.proceedToNextSlide,
    this.proceedToGetStarted,
    this.onBoardingItems,
    this.taggingGuestUser,
    this.taggingGuestUserSuccessful,
    this.message,
    this.slideIndex,
    this.verifyUserData,
  });

  final bool? proceedToNextSlide;
  final bool? proceedToGetStarted;
  final bool? taggingGuestUser;
  final bool? taggingGuestUserSuccessful;
  final VerifiedUserDataResponse? verifyUserData;
  final String? message;
  final List<OnBoardingItemData>? onBoardingItems;
  final int? slideIndex;

  @override
  List<Object?> get props => [
        proceedToNextSlide,
        slideIndex,
        onBoardingItems,
        taggingGuestUser,
        taggingGuestUserSuccessful,
        message,
        proceedToGetStarted,
        verifyUserData,
      ];

  OnBoardingState copyWith({
    bool? proceedToNextSlide,
    bool? proceedToGetStarted,
    bool? taggingGuestUser,
    bool? taggingGuestUserSuccessful,
    String? message,
    List<OnBoardingItemData>? onBoardingItems,
    int? slideIndex,
    VerifiedUserDataResponse? verifyUserData,
  }) {
    return OnBoardingState(
      proceedToNextSlide: proceedToNextSlide,
      proceedToGetStarted: proceedToGetStarted,
      onBoardingItems: onBoardingItems,
      message: message,
      taggingGuestUser: taggingGuestUser,
      taggingGuestUserSuccessful: taggingGuestUserSuccessful,
      slideIndex: slideIndex,
      verifyUserData: verifyUserData,
    );
  }
}
