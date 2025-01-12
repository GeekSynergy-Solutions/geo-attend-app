import 'package:equatable/equatable.dart';

class AttendeeAttendancePieChartResponse extends Equatable {
  const AttendeeAttendancePieChartResponse({
    required this.status,
    required this.attendeesCount,
    required this.percentage,
    required this.percentageLabel,
  });

  final String status;
  final num attendeesCount;
  final num percentage;
  final String percentageLabel;

  @override
  List<Object?> get props => [
        status,
        attendeesCount,
        percentage,
        percentageLabel,
      ];
}
