// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_guest_user_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagGuestUserDeviceModel _$TagGuestUserDeviceModelFromJson(
        Map<String, dynamic> json) =>
    TagGuestUserDeviceModel(
      message: json['message'] as String,
      user: const CustomUserDataConverter()
          .fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TagGuestUserDeviceModelToJson(
        TagGuestUserDeviceModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': const CustomUserDataConverter().toJson(instance.user),
    };
