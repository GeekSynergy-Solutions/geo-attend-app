import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_report_request.g.dart';

@JsonSerializable()
class SendReportRequest extends Equatable {
  const SendReportRequest({
    required this.attendanceId,
  });

  final String attendanceId;

  @override
  List<Object?> get props => [
        attendanceId,
      ];

  factory SendReportRequest.fromJson(Map<String, dynamic> json) {
    return _$SendReportRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SendReportRequestToJson(this);
  }
}
