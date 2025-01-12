import 'package:geoattend/data/remote/attendance/model/recurringMode/recurringModeData/recurring_mode_data_model.dart';
import 'package:geoattend/domain/entity/response/attendance/recurringMode/recurring_mode_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recurring_mode_model.g.dart';

const customRecurringModeDataAnnotation =
    JsonSerializable(converters: [CustomRecurringModeDataResponse()]);

@customRecurringModeDataAnnotation
class RecurringModeModel extends RecurringModeResponse {
  const RecurringModeModel({
    required super.recurringModes,
  });

  factory RecurringModeModel.fromJson(Map<String, dynamic> json) {
    return _$RecurringModeModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RecurringModeModelToJson(this);
  }
}


