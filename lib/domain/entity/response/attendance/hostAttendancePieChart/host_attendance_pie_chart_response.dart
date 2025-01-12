import 'package:equatable/equatable.dart';

class HostAttendancePieChartResponse extends Equatable {
  const HostAttendancePieChartResponse({
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
