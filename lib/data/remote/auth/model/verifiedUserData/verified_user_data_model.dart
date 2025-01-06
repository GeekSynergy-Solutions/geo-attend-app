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
    required super.accessToken,
    required super.accountVerified,
    required super.deviceVerified,
    required super.firstName,
    required super.lastName,
    required super.deviceName,
    required super.emailAddress,
    required super.firstTimeLogin,
    required super.hasUserMigrated,
    required super.profileBgColor,
    required super.refreshToken,
    required super.userId,
    required super.userInitial,
    super.userProfileBgColor,
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
