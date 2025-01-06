// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geoattend/domain/entity/objectData/attendanceData/attendance_data.dart';
import 'package:geoattend/domain/entity/objectData/geoFenceTypeData/geo_fence_values_data.dart';
import 'package:geoattend/domain/entity/objectData/locationPositionData/location_position_data.dart';

abstract class AttendanceEvent extends Equatable {
  const AttendanceEvent();
}

class LoadTimeZonesAttendanceEvent extends AttendanceEvent {
  const LoadTimeZonesAttendanceEvent() : super();

  @override
  List<Object?> get props => [];
}

class AttendanceDetailsValidationEvent extends AttendanceEvent {
  String name;
  String hostName;
  String date;
  String dbStartTime;
  String dbEndTime;
  String startTime;
  String endTime;
  String description;
  String timeZone;
  String timeZoneOffset;
  String recurringMode;
  BuildContext context;

  AttendanceDetailsValidationEvent({
    required this.name,
    required this.hostName,
    required this.date,
    required this.dbStartTime,
    required this.dbEndTime,
    required this.startTime,
    required this.endTime,
    required this.description,
    required this.timeZone,
    required this.timeZoneOffset,
    required this.recurringMode,
    required this.context,
  }) : super();

  @override
  List<Object?> get props => [
        name,
        hostName,
        date,
        dbStartTime,
        dbEndTime,
        startTime,
        endTime,
        description,
        timeZone,
        timeZoneOffset,
        recurringMode,
        context,
      ];
}

class GetLocationAddressAttendanceEvent extends AttendanceEvent {
  String address;
  GetLocationAddressAttendanceEvent({required this.address}) : super();

  @override
  List<Object?> get props => [address];
}

class GetLocationPositionAttendanceEvent extends AttendanceEvent {
  String address;
  bool useCurrentLocation;
  LocationPositionData? locationPositionData;
  GetLocationPositionAttendanceEvent.currentLocation({
    required this.address,
    required this.locationPositionData,
    this.useCurrentLocation = true,
  }) : super();
  GetLocationPositionAttendanceEvent.remoteLocation({
    required this.address,
    this.useCurrentLocation = false,
  }) : super();

  @override
  List<Object?> get props =>
      [address, useCurrentLocation, locationPositionData];
}

class ResetLocAddressAttendanceEvent extends AttendanceEvent {
  const ResetLocAddressAttendanceEvent() : super();

  @override
  List<Object?> get props => [];
}

class SetGeoFenceDataSettingAttendanceEvent extends AttendanceEvent {
  GeoFenceValuesData geoFenceValuesData;
  SetGeoFenceDataSettingAttendanceEvent({
    required this.geoFenceValuesData,
  }) : super();

  @override
  List<Object?> get props => [geoFenceValuesData];
}

class UpdateAttendanceDataEvent extends AttendanceEvent {
  AttendanceData attendanceData;
  UpdateAttendanceDataEvent({
    required this.attendanceData,
  }) : super();

  @override
  List<Object?> get props => [attendanceData];
}

class ShowAttendanceCodeEvent extends AttendanceEvent {
  const ShowAttendanceCodeEvent() : super();

  @override
  List<Object?> get props => [];
}

class CreateHostAttendanceEvent extends AttendanceEvent {
  AttendanceData attendanceData;
  CreateHostAttendanceEvent({
    required this.attendanceData,
  }) : super();

  @override
  List<Object?> get props => [attendanceData];
}
