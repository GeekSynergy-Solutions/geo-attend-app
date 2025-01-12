import 'package:equatable/equatable.dart';
import 'package:geoattend/data/remote/attendance/model/recurringMode/recurringModeData/recurring_mode_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

class RecurringModeDataResponse extends Equatable {
  const RecurringModeDataResponse({
    required this.recurringModeName,
    required this.recurringModeId,
  });

  final String recurringModeName;
  final dynamic recurringModeId;

  @override
  List<Object?> get props => [
        recurringModeName,
        recurringModeId,
      ];
}

class RecurringModeResponse extends Equatable {
  const RecurringModeResponse({
    required this.recurringModes,
  });

  final List<RecurringModeDataModel> recurringModes;

  @override
  List<Object?> get props => [
        recurringModes,
      ];
}

class CustomRecurringModeDataResponse extends JsonConverter<RecurringModeDataModel, RecurringModeDataModel> {
  const CustomRecurringModeDataResponse();
  @override
  fromJson(json) {
    return json;
  }

  @override
  toJson(object) {
    return object;
  }
}
