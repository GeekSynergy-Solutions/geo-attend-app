import 'package:equatable/equatable.dart';

class SendAttendanceReportResponse extends Equatable {
  const SendAttendanceReportResponse({
    required this.sendReportStatus,
  });

  final bool sendReportStatus;

  @override
  List<Object?> get props => [
        sendReportStatus,
      ];
}
