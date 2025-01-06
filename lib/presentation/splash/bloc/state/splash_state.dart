// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';

abstract class SplashState extends Equatable {
  const SplashState();
}

class InitSplashState extends SplashState {
  const InitSplashState() : super();

  @override
  List<Object?> get props => [];
}

class RoutingState extends SplashState {
  bool proceedToDashboard;
  bool proceedToOnBoarding;
  bool proceedToGetStarted;
  SuccessfulUserDataStatus? successfulUserDataStatus;
  RoutingState({
    this.proceedToDashboard = false,
    this.proceedToOnBoarding = false,
    this.proceedToGetStarted = false,
  }) : super();

  RoutingState.dashboard({
    this.proceedToDashboard = true,
    this.proceedToOnBoarding = false,
    this.proceedToGetStarted = false,
    required this.successfulUserDataStatus,
  }) : super();

  @override
  List<Object?> get props => [
        proceedToDashboard,
        proceedToOnBoarding,
        proceedToGetStarted,
        successfulUserDataStatus,
      ];
}
