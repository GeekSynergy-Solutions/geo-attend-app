// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:geoattend/domain/entity/response/auth/verifiedUserData/verified_user_data_response.dart';
import 'package:geoattend/infrastructure/util/customColorConverter/custom_color_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verified_user_data_model.g.dart';

const customVerifiedUserDataAnnotation =
    JsonSerializable(converters: [CustomColorConverter()]);

@customVerifiedUserDataAnnotation
class VerifiedUserDataModel extends VerifiedUserDataResponse {
  VerifiedUserDataModel({
    required super.token,
    required super.accountVerified,
    required super.deviceVerified,
    required super.firstName,
    required super.lastName,
    required super.deviceName,
    required super.userProfileBgColor,
    required super.email,
    required super.firstTimeUser,
    required super.hasUserMigrated,
    required super.refreshToken,
    required super.userId,
    required super.userInitial,
    super.profileBgColor,
    super.tokenExpiryDate,
    super.role,
  });

  factory VerifiedUserDataModel.fromJson(Map<String, dynamic> json) {
    return _$VerifiedUserDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifiedUserDataModelToJson(this);
  }
}
