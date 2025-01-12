// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:geoattend/domain/entity/response/attendance/attendeeAttendance/attendee_attendance_response.dart';
import 'package:geoattend/domain/entity/response/attendance/hostAttendance/host_attendance_response.dart';
import 'package:geoattend/domain/entity/response/attendance/totalAttendanceCreated/total_attendance_created_response.dart';
import 'package:geoattend/domain/entity/response/attendance/totalAttendanceJoined/total_attendance_joined_response.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class InitHomeState extends HomeState {
  const InitHomeState() : super();

  @override
  List<Object?> get props => [];
}

class SessionSwitchState extends HomeState {
  bool toAHost;
  SessionSwitchState({
    required this.toAHost,
  }) : super();

  @override
  List<Object?> get props => [
        toAHost,
      ];
}

class LoadingHomeState extends HomeState {
  bool loadingUpComingAttnd;
  bool loadingPreviousAttnd;
  bool loadingTotalAttnd;
  LoadingHomeState({
    this.loadingUpComingAttnd = false,
    this.loadingPreviousAttnd = false,
    this.loadingTotalAttnd = false,
  }) : super();

  @override
  List<Object?> get props => [
        loadingUpComingAttnd,
        loadingPreviousAttnd,
        loadingTotalAttnd,
      ];
}

class FailureHomeState extends HomeState {
  bool isUnAuthorized;
  String errorMessage;
  bool? isPreviousAttndRequestSuccessful;
  bool? isUpComingAttndRequestSuccessful;
  bool? isTotalAttndRequestSuccessful;
  bool? loadingUpComingAttnd;
  bool? loadingPreviousAttnd;
  bool? loadingTotalAttnd;
  FailureHomeState({
    required this.isUnAuthorized,
    required this.errorMessage,
    this.isPreviousAttndRequestSuccessful = false,
    this.isUpComingAttndRequestSuccessful = false,
    this.isTotalAttndRequestSuccessful = false,
    this.loadingUpComingAttnd = false,
    this.loadingPreviousAttnd = false,
    this.loadingTotalAttnd = false,
  }) : super();
  FailureHomeState.totalAttendance({
    required this.isUnAuthorized,
    required this.errorMessage,
    this.isTotalAttndRequestSuccessful = false,
    this.loadingTotalAttnd = false,
  }) : super();

  @override
  List<Object?> get props => [
        isUnAuthorized,
        errorMessage,
        isUpComingAttndRequestSuccessful,
        isPreviousAttndRequestSuccessful,
        isTotalAttndRequestSuccessful,
        loadingUpComingAttnd,
        loadingPreviousAttnd,
        loadingTotalAttnd,
      ];
}

class SuccessHomeState extends HomeState {
  bool? isUpComingAttndRequestSuccessful;
  bool? isPreviousAttndRequestSuccessful;
  bool? isTotalAttndRequestSuccessful;
  bool? loadingUpComingAttnd;
  bool? loadingPreviousAttnd;
  bool? loadingTotalAttnd;
  TotalAttendanceCreatedResponse? totalAttendanceCreated;
  TotalAttendanceJoinedResponse? totalAttendanceJoined;
  RecentHostAttendanceDataResponse? recentHostAttendance;
  RecentAttendeeAttendanceDataResponse? recentAttendeeAttendanceData;
  
  SuccessHomeState({
    required this.isPreviousAttndRequestSuccessful,
    required this.isUpComingAttndRequestSuccessful,
    required this.isTotalAttndRequestSuccessful,
    this.loadingUpComingAttnd = false,
    this.loadingPreviousAttnd = false,
    this.loadingTotalAttnd = false,
  }) : super();
  SuccessHomeState.hostTotalAttendance({
    required this.totalAttendanceCreated,
    this.isTotalAttndRequestSuccessful = true,
    this.loadingTotalAttnd = false,
  }) : super();
  SuccessHomeState.attendeeTotalAttendance({
    required this.totalAttendanceJoined,
    this.isTotalAttndRequestSuccessful = true,
    this.loadingTotalAttnd = false,
  }) : super();
  SuccessHomeState.hostPreviousAttendance({
    required this.totalAttendanceCreated,
    this.isPreviousAttndRequestSuccessful = true,
    this.loadingPreviousAttnd = false,
  }) : super();
  SuccessHomeState.attendeePreviousAttendance({
    required this.totalAttendanceJoined,
    this.isPreviousAttndRequestSuccessful = true,
    this.loadingPreviousAttnd = false,
  }) : super();
  SuccessHomeState.hostUpComingAttendance({
    required this.totalAttendanceCreated,
    required this.recentHostAttendance,
    this.isUpComingAttndRequestSuccessful = true,
    this.loadingUpComingAttnd = false,
  }) : super();
  SuccessHomeState.attendeeUpComingAttendance({
    required this.totalAttendanceJoined,
    required this.recentAttendeeAttendanceData,
    this.isUpComingAttndRequestSuccessful = true,
    this.loadingUpComingAttnd = false,
  }) : super();

  @override
  List<Object?> get props => [
        isUpComingAttndRequestSuccessful,
        isPreviousAttndRequestSuccessful,
        isTotalAttndRequestSuccessful,
        totalAttendanceCreated,
        totalAttendanceJoined,
        recentHostAttendance,
        recentAttendeeAttendanceData,
        loadingUpComingAttnd,
        loadingPreviousAttnd,
        loadingTotalAttnd,
      ];
}
