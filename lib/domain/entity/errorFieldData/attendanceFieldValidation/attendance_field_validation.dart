// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AttendanceFieldValidation extends Equatable {
  bool isAttendanceNameValid;
  bool isAttendanceHostNameValid;
  bool isAttendanceDateValid;
  bool isAttendanceStartTimeValid;
  bool isAttendanceEndTimeValid;
  bool isAttendanceDbStartTimeValid;
  bool isAttendanceDbEndTimeValid;
  bool isAttendanceDescValid;
  bool isAttendanceTimeZoneValid;
  bool isAttendanceTimeZoneOffsetValid;
  bool isAttendanceRecurringValid;
  bool fieldValidationStatus;

  AttendanceFieldValidation({
    this.isAttendanceNameValid = false,
    this.isAttendanceHostNameValid = false,
    this.isAttendanceDateValid = false,
    this.isAttendanceStartTimeValid = false,
    this.isAttendanceEndTimeValid = false,
    this.isAttendanceDbStartTimeValid = false,
    this.isAttendanceDbEndTimeValid = false,
    this.isAttendanceDescValid = false,
    this.isAttendanceTimeZoneValid = false,
    this.isAttendanceTimeZoneOffsetValid = false,
    this.isAttendanceRecurringValid = false,
    this.fieldValidationStatus = false,
  });

  @override
  List<Object?> get props => [
        isAttendanceNameValid,
        isAttendanceHostNameValid,
        isAttendanceDateValid,
        isAttendanceStartTimeValid,
        isAttendanceEndTimeValid,
        isAttendanceDbStartTimeValid,
        isAttendanceDbEndTimeValid,
        isAttendanceDescValid,
        isAttendanceTimeZoneValid,
        isAttendanceTimeZoneOffsetValid,
        isAttendanceRecurringValid,
        fieldValidationStatus,
      ];
}
