// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:geoattend/domain/entity/objectData/geoFenceTypeData/geo_fence_values_data.dart';
import 'package:geoattend/domain/entity/objectData/locationPositionData/location_position_data.dart';
import 'package:geoattend/domain/entity/request/attendance/create/formFieldData/form_field_data_request.dart';
import 'package:geoattend/domain/entity/request/attendance/create/parameterType/parameter_type_request.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';

class AttendanceData extends Equatable {
  String attendanceHostName;
  String attendanceName;
  String attendanceDesc;
  String attendanceRecurringMode;
  String attendanceDate;
  String attendanceStartTime;
  String attendanceEndTime;
  String attendanceDbStartTime;
  String attendanceDbEndTime;
  String attendanceMeetingLocation;
  String attendanceAllowableDistance;
  String attendanceGeoFenceType;
  LocationPositionData attendanceLocationPositionData;
  GeoFenceValuesData? geoFenceValuesData;
  List<FormFieldDataRequest>? formFields;
  List<ParameterTypeRequest>? parameterTypes;
  String attendanceCode;

  AttendanceData({
    required this.attendanceHostName,
    required this.attendanceName,
    required this.attendanceDesc,
    required this.attendanceRecurringMode,
    required this.attendanceDate,
    required this.attendanceStartTime,
    required this.attendanceEndTime,
    required this.attendanceDbStartTime,
    required this.attendanceDbEndTime,
    required this.attendanceMeetingLocation,
    required this.attendanceAllowableDistance,
    required this.attendanceLocationPositionData,
    this.attendanceGeoFenceType = '',
    this.formFields,
    this.geoFenceValuesData,
    this.parameterTypes,
    this.attendanceCode = '',
  }) {
    geoFenceValuesData = GeoFenceValuesData();
    attendanceGeoFenceType = AppStringConstants.circularLabel;
    formFields = [];
    // formFields = const [
    //   FormFieldDataRequest(
    //     fieldName: 'Name',
    //     fieldType: 'text',
    //     required: true,
    //     options: [],
    //   ),
    //   FormFieldDataRequest(
    //     fieldName: 'Email',
    //     fieldType: 'text',
    //     required: true,
    //     options: [],
    //   ),
    //   FormFieldDataRequest(
    //     fieldName: 'Phone Number',
    //     fieldType: 'text',
    //     required: true,
    //     options: [],
    //   ),
    //   FormFieldDataRequest(
    //     fieldName: 'Department',
    //     fieldType: 'text',
    //     required: true,
    //     options: [],
    //   ),
    // ];
    parameterTypes = const [
      ParameterTypeRequest(
        name: 'Attendance Type',
        isRequired: true,
      )
    ];
  }

  @override
  List<Object?> get props => [
        attendanceHostName,
        attendanceName,
        attendanceDesc,
        attendanceRecurringMode,
        attendanceDate,
        attendanceStartTime,
        attendanceEndTime,
        attendanceDbStartTime,
        attendanceDbEndTime,
        attendanceMeetingLocation,
        attendanceAllowableDistance,
        attendanceGeoFenceType,
        formFields,
        parameterTypes,
        geoFenceValuesData,
        attendanceCode,
        attendanceLocationPositionData,
      ];
}
