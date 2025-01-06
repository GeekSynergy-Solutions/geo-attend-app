import 'package:equatable/equatable.dart';

class CreateSessionResponse extends Equatable {
  final String attendanceId;
  final String hostId;
  final String hostEmail;
  final String? hostDeviceId;
  final String attendanceCode;

  const CreateSessionResponse({
    required this.attendanceId,
    required this.hostId,
    required this.hostEmail,
    required this.attendanceCode,
    this.hostDeviceId = '',
  });

  @override
  List<Object?> get props =>
      [attendanceId, hostId, hostEmail, attendanceCode, hostDeviceId];
}
