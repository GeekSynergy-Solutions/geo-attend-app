import 'package:geoattend/domain/entity/response/attendance/bioFields/readableFields/readable_bio_fields_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'readable_bio_fields_model.g.dart';

@JsonSerializable()
class ReadableBioFieldsModel extends ReadableBioFieldsResponse {
  const ReadableBioFieldsModel({
    required super.fieldName,
    required super.readableName,
  });

  factory ReadableBioFieldsModel.fromJson(Map<String, dynamic> json) {
    return _$ReadableBioFieldsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ReadableBioFieldsModelToJson(this);
  }
}


