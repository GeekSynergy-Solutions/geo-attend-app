// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class SwitchSessionHomeEvent extends HomeEvent {
  bool switchToHost;
  SwitchSessionHomeEvent({
    required this.switchToHost,
  }) : super();

  @override
  List<Object?> get props => [
        switchToHost,
      ];
}

class GetPreviousAttendanceHomeEvent extends HomeEvent {
  bool asHost;
  bool actAsBgRequest;
  GetPreviousAttendanceHomeEvent({
    required this.asHost,
    required this.actAsBgRequest,
  }) : super();

  @override
  List<Object?> get props => [
        asHost,
        actAsBgRequest,
      ];
}

class GetTotalAttendanceHomeEvent extends HomeEvent {
  bool asHost;
  bool actAsBgRequest;
  GetTotalAttendanceHomeEvent({
    required this.asHost,
    required this.actAsBgRequest,
  }) : super();

  @override
  List<Object?> get props => [
        asHost,
        actAsBgRequest,
      ];
}

class GetUpComingAttendanceHomeEvent extends HomeEvent {
  bool asHost;
  bool actAsBgRequest;
  GetUpComingAttendanceHomeEvent({
    required this.asHost,
    required this.actAsBgRequest,
  }) : super();

  @override
  List<Object?> get props => [
        asHost,
        actAsBgRequest,
      ];
}
