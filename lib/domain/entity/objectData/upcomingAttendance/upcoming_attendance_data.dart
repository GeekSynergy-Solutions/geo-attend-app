// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class UpcomingAttendanceData extends Equatable{
  String attendanceTitle;
  String attendanceLocation;
  String attendanceVenue;
  String attendanceTime;
  String attendanceDate;
  double attendanceRadius;
  List attendedUsers;

  UpcomingAttendanceData({
    required this.attendanceTitle,
    required this.attendanceDate,
    required this.attendanceLocation,
    required this.attendanceVenue,
    required this.attendanceTime,
    required this.attendanceRadius,
    required this.attendedUsers,
  });
  
  @override
  List<Object?> get props => [
    attendanceTitle,
    attendanceDate,
    attendanceLocation,
    attendanceVenue,
    attendanceTime,
    attendanceRadius,
    attendedUsers,
  ];
}
