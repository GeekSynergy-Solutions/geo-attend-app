// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verified_user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifiedUserDataModel _$VerifiedUserDataModelFromJson(
        Map<String, dynamic> json) =>
    VerifiedUserDataModel(
      token: json['token'] as String,
      accountVerified: json['accountVerified'] as bool,
      deviceVerified: json['deviceVerified'] as bool,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      deviceName: json['deviceName'] as String,
      userProfileBgColor: json['userProfileBgColor'] as String,
      email: json['email'] as String,
      firstTimeUser: json['firstTimeUser'] as bool,
      hasUserMigrated: json['hasUserMigrated'] as bool,
      refreshToken: json['refreshToken'] as String,
      userId: json['userId'] as String,
      userInitial: json['userInitial'] as String,
      profileBgColor: _$JsonConverterFromJson<Color, Color>(
          json['profileBgColor'], const CustomColorConverter().fromJson),
      tokenExpiryDate: json['tokenExpiryDate'] as String? ?? '',
      role: json['role'] as String? ?? '',
    );

Map<String, dynamic> _$VerifiedUserDataModelToJson(
        VerifiedUserDataModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'userId': instance.userId,
      'email': instance.email,
      'firstName': instance.firstName,
      'userProfileBgColor': instance.userProfileBgColor,
      'lastName': instance.lastName,
      'deviceName': instance.deviceName,
      'userInitial': instance.userInitial,
      'accountVerified': instance.accountVerified,
      'deviceVerified': instance.deviceVerified,
      'firstTimeUser': instance.firstTimeUser,
      'hasUserMigrated': instance.hasUserMigrated,
      'tokenExpiryDate': instance.tokenExpiryDate,
      'profileBgColor': _$JsonConverterToJson<Color, Color>(
          instance.profileBgColor, const CustomColorConverter().toJson),
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
