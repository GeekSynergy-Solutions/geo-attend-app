// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurring_mode_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecurringModeDataModel _$RecurringModeDataModelFromJson(
        Map<String, dynamic> json) =>
    RecurringModeDataModel(
      recurringModeId: json['recurringModeId'],
      recurringModeName: json['recurringModeName'] as String,
    );

Map<String, dynamic> _$RecurringModeDataModelToJson(
        RecurringModeDataModel instance) =>
    <String, dynamic>{
      'recurringModeName': instance.recurringModeName,
      'recurringModeId': instance.recurringModeId,
    };
