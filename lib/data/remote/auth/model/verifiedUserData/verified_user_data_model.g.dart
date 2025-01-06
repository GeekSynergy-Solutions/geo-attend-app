// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verified_user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifiedUserDataModel _$VerifiedUserDataModelFromJson(
        Map<String, dynamic> json) =>
    VerifiedUserDataModel(
      accessToken: json['accessToken'] as String,
      accountVerified: json['accountVerified'] as bool,
      deviceVerified: json['deviceVerified'] as bool,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      deviceName: json['deviceName'] as String,
      emailAddress: json['emailAddress'] as String,
      firstTimeLogin: json['firstTimeLogin'] as bool,
      hasUserMigrated: json['hasUserMigrated'] as bool,
      profileBgColor: json['profileBgColor'] as String,
      refreshToken: json['refreshToken'] as String,
      userId: json['userId'] as String,
      userInitial: json['userInitial'] as String,
      userProfileBgColor: _$JsonConverterFromJson<Color, Color>(
          json['userProfileBgColor'], const CustomColorConverter().fromJson),
      tokenExpiryDate: json['tokenExpiryDate'] as String? ?? '',
      role: json['role'] as String? ?? '',
    );

Map<String, dynamic> _$VerifiedUserDataModelToJson(
        VerifiedUserDataModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'userId': instance.userId,
      'emailAddress': instance.emailAddress,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'deviceName': instance.deviceName,
      'profileBgColor': instance.profileBgColor,
      'userInitial': instance.userInitial,
      'accountVerified': instance.accountVerified,
      'deviceVerified': instance.deviceVerified,
      'firstTimeLogin': instance.firstTimeLogin,
      'hasUserMigrated': instance.hasUserMigrated,
      'userProfileBgColor': _$JsonConverterToJson<Color, Color>(
          instance.userProfileBgColor, const CustomColorConverter().toJson),
      'tokenExpiryDate': instance.tokenExpiryDate,
      'role': instance.role,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
