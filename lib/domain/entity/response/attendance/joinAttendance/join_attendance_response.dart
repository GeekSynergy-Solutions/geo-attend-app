import 'package:equatable/equatable.dart';

class JoinAttendanceResponse extends Equatable {
  const JoinAttendanceResponse({
    required this.joinStatus,
  });

  final bool joinStatus;

  @override
  List<Object?> get props => [
        joinStatus,
      ];
}
