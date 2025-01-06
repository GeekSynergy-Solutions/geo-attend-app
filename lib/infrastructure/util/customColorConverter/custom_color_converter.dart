import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class CustomColorConverter extends JsonConverter<Color, Color> {
  const CustomColorConverter();
  @override
  fromJson(json) {
    return json;
  }

  @override
  toJson(object) {
    return object;
  }
}