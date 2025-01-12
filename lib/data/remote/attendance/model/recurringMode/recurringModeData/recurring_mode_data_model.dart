import 'package:geoattend/domain/entity/response/attendance/recurringMode/recurring_mode_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recurring_mode_data_model.g.dart';

@JsonSerializable()
class RecurringModeDataModel extends RecurringModeDataResponse {
  const RecurringModeDataModel({
    required super.recurringModeId,
    required super.recurringModeName,
  });

  factory RecurringModeDataModel.fromJson(Map<String, dynamic> json) {
    return _$RecurringModeDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RecurringModeDataModelToJson(this);
  }
}


