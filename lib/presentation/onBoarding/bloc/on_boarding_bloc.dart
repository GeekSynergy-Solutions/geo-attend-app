import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/data/remote/auth/model/verifiedUserData/verified_user_data_model.dart';
import 'package:geoattend/domain/entity/objectData/onBoardingItemData/on_boarding_item_data.dart';
import 'package:geoattend/domain/entity/request/auth/continueAsAGuest/continue_as_a_guest_request.dart';
import 'package:geoattend/domain/entity/response/failure/failure_response.dart';
import 'package:geoattend/domain/repository/auth/auth_repo_interface.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';
import 'package:geoattend/infrastructure/util/deviceData/device_data.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/presentation/onBoarding/bloc/events/on_boarding_event.dart';
import 'package:geoattend/presentation/onBoarding/bloc/states/on_boarding_state.dart';
import 'package:injectable/injectable.dart';
import 'package:geoattend/data/localStorage/sharedPreferences/app_shared_preferences.dart';

@injectable
class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final AppSharedPreferences appSharedPreferences;
  final AuthRepoInterface authRepo;

  int slideIndex = 0;
  List<OnBoardingItemData> onBoardingListItems = [];

  OnBoardingBloc(
    this.appSharedPreferences,
    this.authRepo,
  ) : super(const OnBoardingState()) {
    on<SkipBoardingListItemEvent>((event, emit) {});
    on<GetStartedEvent>((event, emit) async {
      await appSharedPreferences.cacheDeviceOnBoard();
    });
    on<UserAsAGuestEvent>((event, emit) async {
      emit(
        state.copyWith(
          taggingGuestUser: true,
        ),
      );

      String deviceId = await DeviceData.deviceId();
      String deviceName = await DeviceData.modelName();

      Either<FailureResponse, VerifiedUserDataModel>
          tagGuestUserRequestResponse =
          await authRepo.continueAsAGuestUserAuthRepoRequest(
        request: ContinueAsAGuestRequest(
          deviceId: deviceId,
          deviceName: deviceName,
        ),
      );

      if (tagGuestUserRequestResponse.isRight) {
        await appSharedPreferences.cacheUserIsAGuest();
        emit(
          state.copyWith(
            taggingGuestUser: false,
            taggingGuestUserSuccessful: true,
            verifyUserData: tagGuestUserRequestResponse.right,
            message: 'Successful',
          ),
        );
      } else {
        FailureResponse failedResponse = tagGuestUserRequestResponse.left;
        emit(
          state.copyWith(
            taggingGuestUser: false,
            taggingGuestUserSuccessful: false,
            message: GeneralFunctions.convertFirstCharToUpperCaseChar(
              value: failedResponse.errorMessage,
            ),
          ),
        );
      }
    });
    on<InitOnBoardingListItemsEvent>((event, emit) {
      onBoardingListItems = const [
        OnBoardingItemData(
          description:
              'Effortless attendance anytime, anywhere with smart geofencing, real-time tracking, and seamless reporting.',
          picturePath: AppImagePath.firstOnBoardingPng,
          title: 'Track Attendance within\nyour Geofence',
        ),
        OnBoardingItemData(
          description:
              'Leverage geofencing to ensure attendees are present in the right location at the right time. Boost accuracy in tracking attendance within set boundaries.',
          picturePath: AppImagePath.secondOnBoardingPng,
          title: 'Automatically Check-in\nwith Geofence Technology',
        ),
      ];
      emit(
        state.copyWith(
          onBoardingItems: onBoardingListItems,
        ),
      );
    });
    on<OnBoardingSlideEvent>((event, emit) async {
      int currentSlideIndex = event.currentSlideIndex;
      int slideListLength = event.slideListLength;
      bool nextSlide = event.nextSlide;
      if (currentSlideIndex >= 0) {
        slideIndex = nextSlide
            ? (currentSlideIndex < (slideListLength - 1))
                ? currentSlideIndex + 1
                : currentSlideIndex
            : currentSlideIndex - 1;
        bool getUserStarted =
            currentSlideIndex + 1 == slideListLength && nextSlide;
        if (getUserStarted) {
          await appSharedPreferences.cacheDeviceOnBoard();
        }
        emit(
          state.copyWith(
            proceedToNextSlide: nextSlide,
            slideIndex: slideIndex,
            onBoardingItems: onBoardingListItems,
            proceedToGetStarted: getUserStarted,
          ),
        );
      }
    });
  }
}
