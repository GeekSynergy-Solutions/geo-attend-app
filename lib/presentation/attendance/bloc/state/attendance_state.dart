// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:geoattend/data/remote/geoLocation/model/hereGeoLocation/hereLocation/here_location_model.dart';
import 'package:geoattend/domain/entity/errorFieldData/attendanceFieldValidation/attendance_field_validation.dart';
import 'package:geoattend/domain/entity/objectData/attendanceData/attendance_data.dart';
import 'package:geoattend/domain/entity/objectData/geoFenceTypeData/geo_fence_values_data.dart';
import 'package:geoattend/domain/entity/objectData/locationPositionData/location_position_data.dart';
import 'package:geoattend/domain/entity/objectData/timeZone/time_zone_data.dart';

abstract class AttendanceState extends Equatable {
  const AttendanceState();
}

class InitAttendanceState extends AttendanceState {
  const InitAttendanceState() : super();

  @override
  List<Object?> get props => [];
}

class LoadingAttendanceState extends AttendanceState {
  const LoadingAttendanceState() : super();

  @override
  List<Object?> get props => [];
}

class TimeZonesAttendanceState extends AttendanceState {
  List<TimeZoneData> timeZones;
  TimeZonesAttendanceState({
    required this.timeZones,
  }) : super();

  @override
  List<Object?> get props => [timeZones];
}

class AttendanceDetailsValidationState extends AttendanceState {
  String? message;
  AttendanceData? attendanceData;
  AttendanceFieldValidation? attendanceFieldValidation;
  bool loadingState;
  bool? successfulStatus;
  AttendanceDetailsValidationState.validating({
    this.attendanceData,
    this.loadingState = true,
    this.successfulStatus = false,
  }) : super();
  AttendanceDetailsValidationState.success({
    required this.attendanceData,
    this.loadingState = false,
    this.successfulStatus = true,
  }) : super();
  AttendanceDetailsValidationState.failure({
    required this.message,
    required this.attendanceFieldValidation,
    this.loadingState = false,
    this.successfulStatus = false,
  }) : super();

  @override
  List<Object?> get props => [
        message,
        attendanceFieldValidation,
        attendanceData,
        loadingState,
        successfulStatus,
      ];
}

class GeoLocationAddressAttendanceState extends AttendanceState {
  HereLocationModel? hereLocation;
  bool? success;
  GeoLocationAddressAttendanceState.init() : super();
  GeoLocationAddressAttendanceState.success({
    required this.hereLocation,
    this.success = true,
  }) : super();
  GeoLocationAddressAttendanceState.failure({
    this.hereLocation,
    this.success = false,
  }) : super();

  @override
  List<Object?> get props => [hereLocation, success];
}

class SetGeoFenceDataSettingAttendanceState extends AttendanceState {
  GeoFenceValuesData geoFenceValuesData;
  bool geoFenceDataSet;
  SetGeoFenceDataSettingAttendanceState.reset({
    required this.geoFenceValuesData,
    this.geoFenceDataSet = false,
  }) : super();
  SetGeoFenceDataSettingAttendanceState.success({
    required this.geoFenceValuesData,
    this.geoFenceDataSet = true,
  }) : super();

  @override
  List<Object?> get props => [geoFenceValuesData, geoFenceDataSet];
}

class GeoLocationPositionAttendanceState extends AttendanceState {
  HereLocationModel? herePosition;
  LocationPositionData? locationPositionData;
  bool setLocation;
  bool loadingData;
  bool success;
  GeoLocationPositionAttendanceState.loading({
    this.loadingData = true,
    this.success = false,
    this.setLocation = false,
  }) : super();
  GeoLocationPositionAttendanceState.reset({
    this.loadingData = false,
    this.success = false,
    this.setLocation = false,
  }) : super();
  GeoLocationPositionAttendanceState.success({
    required this.herePosition,
    required this.locationPositionData,
    this.setLocation = true,
    this.loadingData = false,
    this.success = true,
  }) : super();
  GeoLocationPositionAttendanceState.failure({
    required this.herePosition,
    required this.locationPositionData,
    this.setLocation = false,
    this.loadingData = false,
    this.success = false,
  }) : super();

  @override
  List<Object?> get props => [
        herePosition,
        locationPositionData,
        success,
        setLocation,
      ];
}

class UpdateAttendanceDataState extends AttendanceState {
  AttendanceData updatedAttendanceData;
  bool updateAttendanceData;
  UpdateAttendanceDataState.init({
    required this.updatedAttendanceData,
    this.updateAttendanceData = false,
  }) : super();
  UpdateAttendanceDataState.update({
    required this.updatedAttendanceData,
    this.updateAttendanceData = true,
  }) : super();

  @override
  List<Object?> get props => [updatedAttendanceData, updateAttendanceData];
}

class ShowAttendanceCodeState extends AttendanceState {
  const ShowAttendanceCodeState() : super();

  @override
  List<Object?> get props => [];
}

class CreateHostAttendanceState extends AttendanceState {
  bool requestInProgress;
  bool success;
  bool isRequestUnAuthorized;
  String? errorMessage;
  AttendanceData? attendanceData;
  CreateHostAttendanceState.loading({
    this.requestInProgress = true,
    this.success = false,
    this.isRequestUnAuthorized = false,
  }) : super();
  CreateHostAttendanceState.success({
    required this.attendanceData,
    this.requestInProgress = false,
    this.success = true,
    this.isRequestUnAuthorized = true,
  }) : super();
  CreateHostAttendanceState.failure({
    required this.isRequestUnAuthorized,
    required this.errorMessage,
    this.requestInProgress = false,
    this.success = false,
  }) : super();

  @override
  List<Object?> get props => [
        attendanceData,
        success,
        isRequestUnAuthorized,
        errorMessage,
        requestInProgress,
      ];
}
