import 'package:equatable/equatable.dart';
import 'package:geoattend/data/remote/attendance/model/attendeeAttendances/attendeeAttendancesData/attendee_attendance_data_model.dart';
import 'package:geoattend/data/remote/attendance/model/attendeeAttendances/attendeeAttendancesRecordDetails/attendee_attendance_record_details_model.dart';
import 'package:json_annotation/json_annotation.dart';

class AttendeeAttendanceDataResponse extends Equatable {
  const AttendeeAttendanceDataResponse({
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
  final List<List<AttendeeAttendanceRecordDetailsModel>> attendanceRecordDetails;

  @override
  List<Object?> get props => [
        attendanceTitle,
        attendanceStartDate,
        attendanceEndDate,
        attendanceCreationDate,
        attendanceRecordDetails,
      ];
}

class RecentAttendeeAttendanceDataResponse extends Equatable {
  const RecentAttendeeAttendanceDataResponse({
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
  final List<List<AttendeeAttendanceRecordDetailsModel>> attendanceRecordDetails;

  @override
  List<Object?> get props => [
        attendanceTitle,
        attendanceStartDate,
        attendanceEndDate,
        attendanceCreationDate,
        attendanceRecordDetails,
      ];
}

class AttendeeAttendanceRecordDetailsResponse extends Equatable {
  const AttendeeAttendanceRecordDetailsResponse({
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

class AttendeeAttendanceResponse extends Equatable {
  const AttendeeAttendanceResponse({
    required this.attendance,
  });

  final List<AttendeeAttendanceDataModel> attendance;

  @override
  List<Object?> get props => [
        attendance,
      ];
}


class CustomAttendeeAttendanceDataResponse extends JsonConverter<AttendeeAttendanceDataModel, AttendeeAttendanceDataModel> {
  const CustomAttendeeAttendanceDataResponse();
  @override
  fromJson(json) {
    return json;
  }

  @override
  toJson(object) {
    return object;
  }
}


class CustomAttendeeAttendanceRecordDetailsResponse extends JsonConverter<AttendeeAttendanceRecordDetailsModel, AttendeeAttendanceRecordDetailsModel> {
  const CustomAttendeeAttendanceRecordDetailsResponse();
  @override
  fromJson(json) {
    return json;
  }

  @override
  toJson(object) {
    return object;
  }
}

