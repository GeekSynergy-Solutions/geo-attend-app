import 'package:equatable/equatable.dart';
import 'package:geoattend/data/remote/attendance/model/bioFields/readableFields/readable_bio_fields_model.dart';
import 'package:json_annotation/json_annotation.dart';

class ReadableBioFieldsResponse extends Equatable {
  const ReadableBioFieldsResponse({
    required this.fieldName,
    required this.readableName,
  });

  final String fieldName;
  final String readableName;

  @override
  List<Object?> get props => [
        fieldName,
        readableName,
      ];
}

class CustomReadableBioFieldsResponse extends JsonConverter<ReadableBioFieldsModel, ReadableBioFieldsModel> {
  const CustomReadableBioFieldsResponse();
  @override
  fromJson(json) {
    return json;
  }

  @override
  toJson(object) {
    return object;
  }
}

