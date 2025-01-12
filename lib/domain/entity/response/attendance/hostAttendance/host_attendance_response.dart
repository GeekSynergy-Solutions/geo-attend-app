import 'package:equatable/equatable.dart';
import 'package:geoattend/data/remote/attendance/model/hostAttendance/hostAttendancesData/host_attendance_data_model.dart';
import 'package:geoattend/data/remote/attendance/model/hostAttendance/hostAttendancesRecordDetails/host_attendance_record_details_model.dart';
import 'package:json_annotation/json_annotation.dart';

class HostAttendanceDataResponse extends Equatable {
  const HostAttendanceDataResponse({
    required this.attendanceTitle,
    required this.attendanceStartDate,
    required this.attendanceEndDate,
    required this.attendanceCreationDate,
    required this.attendanceRecordDetails,
  });

  final String attendanceTitle;
  final String attendanceStartDate;
  final String attendanceEndDate;
  final String attendanceCreationDate;
  final List<List<HostAttendanceRecordDetailsModel>> attendanceRecordDetails;

  @override
  List<Object?> get props => [
        attendanceTitle,
        attendanceStartDate,
        attendanceEndDate,
        attendanceCreationDate,
        attendanceRecordDetails,
      ];
}

class RecentHostAttendanceDataResponse extends Equatable {
  const RecentHostAttendanceDataResponse({
    required this.attendanceTitle,
    required this.attendanceStartDate,
    required this.attendanceEndDate,
    required this.attendanceCreationDate,
    required this.attendanceRecordDetails,
  });

  final String attendanceTitle;
  final String attendanceStartDate;
  final String attendanceEndDate;
  final String attendanceCreationDate;
  final List<List<HostAttendanceRecordDetailsModel>> attendanceRecordDetails;

  @override
  List<Object?> get props => [
        attendanceTitle,
        attendanceStartDate,
        attendanceEndDate,
        attendanceCreationDate,
        attendanceRecordDetails,
      ];
}

class HostAttendanceRecordDetailsResponse extends Equatable {
  const HostAttendanceRecordDetailsResponse({
    required this.recordFieldData,
    required this.recordFieldTitleCamelCase,
    required this.recordFieldReadableTitleCase,
  });

  final String recordFieldData;
  final String recordFieldTitleCamelCase;
  final String recordFieldReadableTitleCase;

  @override
  List<Object?> get props => [
        recordFieldData,
        recordFieldTitleCamelCase,
        recordFieldReadableTitleCase,
      ];
}

class HostAttendanceResponse extends Equatable {
  const HostAttendanceResponse({
    required this.attendance,
  });

  final List<HostAttendanceDataModel> attendance;

  @override
  List<Object?> get props => [
        attendance,
      ];
}


class CustomHostAttendanceDataResponse extends JsonConverter<HostAttendanceDataModel, HostAttendanceDataModel> {
  const CustomHostAttendanceDataResponse();
  @override
  fromJson(json) {
    return json;
  }

  @override
  toJson(object) {
    return object;
  }
}


class CustomHostAttendanceRecordDetailsResponse extends JsonConverter<HostAttendanceRecordDetailsModel, HostAttendanceRecordDetailsModel> {
  const CustomHostAttendanceRecordDetailsResponse();
  @override
  fromJson(json) {
    return json;
  }

  @override
  toJson(object) {
    return object;
  }
}

