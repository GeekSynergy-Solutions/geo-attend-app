import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/data/localStorage/requestLocalDb/request_user_data.dart';
import 'package:geoattend/data/remote/auth/model/verifiedUserData/verified_user_data_model.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';
import 'package:geoattend/presentation/splash/bloc/event/splash_event.dart';
import 'package:geoattend/presentation/splash/bloc/state/splash_state.dart';
import 'package:injectable/injectable.dart';
import 'package:geoattend/data/localStorage/sharedPreferences/app_shared_preferences.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final RequestUserData requestUserData;
  final AppSharedPreferences appSharedPreferences;

  SplashBloc(
    this.appSharedPreferences,
    this.requestUserData,
  ) : super(const InitSplashState()) {
    on<InitEvent>((event, emit) async {
      bool isUserOnBoarded = await appSharedPreferences.readDeviceOnBoard();
      bool isUserAuthorizationActive = isUserOnBoarded
          ? await appSharedPreferences.readAllowAutthentication()
          : false;
      bool isUserAGuest = await appSharedPreferences.readUserIsAGuest();

      VerifiedUserDataModel userData = VerifiedUserDataModel(
        emailAddress: await requestUserData.getUserEmailAddress(),
        firstName: await requestUserData.getUserFirstName(),
        userId: await requestUserData.getUserDbUserId(),
        lastName: await requestUserData.getUserLastName(),
        role: await requestUserData.getUserRole(),
        accessToken: '',
        refreshToken: '',
        accountVerified:
            await requestUserData.getUserAccountVerificationStatus(),
        deviceVerified: await requestUserData.getUserDeviceVerificationStatus(),
        firstTimeLogin: await requestUserData.getUserFirstTimeLoginStatus(),
        hasUserMigrated: await requestUserData.getAccountMigirationStatus(),
        profileBgColor: await requestUserData.getUserProfileBackgroundStatus(),
        userInitial: await requestUserData.getUserInitialStatus(),
        deviceName: await requestUserData.getUserDeviceNameStatus(),
      );

      emit(
        isUserAuthorizationActive || isUserAGuest
            ? RoutingState.dashboard(
                successfulUserDataStatus: SuccessfulUserDataStatus.verifiedUser(
                  isUserAGuest: isUserAGuest,
                  verifiedUserDataResponse: userData,
                ),
              )
            : RoutingState(
                proceedToDashboard: false,
                proceedToGetStarted:
                    isUserAuthorizationActive ? false : isUserOnBoarded,
                proceedToOnBoarding: !isUserOnBoarded,
              ),
      );
    });
  }
}
