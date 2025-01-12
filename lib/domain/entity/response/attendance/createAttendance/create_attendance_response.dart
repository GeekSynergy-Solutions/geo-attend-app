import 'package:equatable/equatable.dart';

class CreateAttendanceResponse extends Equatable {
  const CreateAttendanceResponse({
    required this.attendanceCode,
  });

  final String attendanceCode;

  @override
  List<Object?> get props => [
        attendanceCode,
      ];
}
