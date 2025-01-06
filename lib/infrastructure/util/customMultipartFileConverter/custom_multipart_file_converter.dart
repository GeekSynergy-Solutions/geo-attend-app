import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

class CustomMultipartFileConverter extends JsonConverter<MultipartFile, MultipartFile> {
  const CustomMultipartFileConverter();
  @override
  fromJson(json) {
    return json;
  }

  @override
  toJson(object) {
    return object;
  }
}