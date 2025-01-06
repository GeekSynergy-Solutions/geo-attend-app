// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';

class AttendanceFieldData extends Equatable {
  String field;
  bool checked;

  AttendanceFieldData({
    required this.field,
    required this.checked,
  });

  @override
  List<Object?> get props => [
        field,
        checked,
      ];
}
