import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:geoattend/domain/entity/objectData/attndFieldData/attendance_field_data.dart';
import 'package:geoattend/domain/entity/objectData/geoFenceTypeData/geo_fence_type_data.dart';
import 'package:geoattend/domain/entity/objectData/recurringOptionData/recurring_option_data.dart';
import 'package:geoattend/domain/entity/objectData/timeZone/time_zone_data.dart';

class GeneralConstantValues {
  static TextStyle errorTextStyle = const TextStyle(
    fontSize: 14.0,
    overflow: TextOverflow.clip,
  );

  static TextStyle textStyle = const TextStyle(
    color: AppColors.formTextColor,
  );

  static TextStyle hintTextStyle = const TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.formHintColor,
  );

  static TextStyle formErrorTextStyle = const TextStyle(
    fontSize: 14.0,
    overflow: TextOverflow.clip,
    color: AppColors.redColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle formSuccessTextStyle = const TextStyle(
    fontSize: 14.0,
    overflow: TextOverflow.clip,
    color: AppColors.greenColor,
    fontWeight: FontWeight.w500,
  );

  static OutlineInputBorder textFieldBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppColors.textFieldBorderColor,
    ),
    borderRadius: BorderRadius.circular(4.0),
  );

  static OutlineInputBorder borderTextFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide: const BorderSide(
      color: AppColors.textFieldBorderColor,
    ),
  );

  static InputBorder noTextFieldBorder = InputBorder.none;

  static EdgeInsets dropDownContentPaddingConstant = const EdgeInsets.symmetric(
    horizontal: 0.0,
    vertical: 10.0,
  );

  // static OutlineInputBorder creditCardDetailsTextFieldBorder =
  //     OutlineInputBorder(
  //   borderRadius: BorderRadius.circular(10.0),
  //   borderSide: const BorderSide(
  //     color: AppColors.creditCardDetailsFieldBorderColor,
  //   ),
  // );

  // static OutlineInputBorder otpBorderTextFieldBorder = OutlineInputBorder(
  //   borderRadius: BorderRadius.circular(4.0),
  //   borderSide: const BorderSide(
  //     color: AppColors.otpTextFieldBorderColor,
  //   ),
  // );

  static BorderRadius otpBorderRadius = BorderRadius.circular(8.0);

  static Border btnColorBorder({Color color = AppColors.blackBorderColor}) =>
      Border.all(
        color: color,
        width: 1.5,
      );

  // static OutlineInputBorder searchTextFieldBorder = OutlineInputBorder(
  //   borderRadius: BorderRadius.circular(20.0),
  //   borderSide: const BorderSide(
  //     color: AppColors.searchBorderColor,
  //   ),
  // );

  // static OutlineInputBorder regTextFieldBorder = OutlineInputBorder(
  //   borderRadius: BorderRadius.circular(10.0),
  //   borderSide: const BorderSide(
  //     color: AppColors.regTextFieldBorderColor,
  //   ),
  // );

  // static TextStyle regHintTextStyle = const TextStyle(
  //   color: AppColors.regTextFieldHintColor,
  //   fontSize: 12.0,
  // );

  static TextStyle dropDownTextStyle({
    required bool enabled,
  }) =>
      TextStyle(
        color: enabled ? AppColors.textDarkerColor : AppColors.textLighterColor,
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
      );

  static double arrowBackIconSize = 30.0;

  static EdgeInsets headerMargin = const EdgeInsets.only(
    top: 50.0,
    bottom: 30.0,
  );

  static EdgeInsets authContentPadding = const EdgeInsets.only(
    top: 9.8,
    bottom: 8.6,
    left: 16.2,
  );

  static EdgeInsets otherAuthorizedUserTextFieldContentPadding =
      const EdgeInsets.only(
    top: 9.8,
    bottom: 8.6,
    left: 16.2,
  );

  static EdgeInsets phoneNumberFieldFlagPadding = const EdgeInsets.only(
    left: 7.0,
  );

  static double authIconSize = 21.0;

  static int? errorMaxLines;

  static EdgeInsets listViewBuilderPadding = const EdgeInsets.only(
    top: 5.0,
  );

  static int unauthorizedRequest = 401;
  static int forBiddenRequest = 403;
  static int locationPermissionDeniedForever = 000;

  static int refreshValue = 2;

  static TextStyle parentDetailsTextStyle({
    double fontSize = 18.0,
  }) =>
      TextStyle(
        color: AppColors.whiteTextColor,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle studentDetailsTextStyle({
    double fontSize = 18.0,
  }) =>
      TextStyle(
        color: AppColors.whiteTextColor,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      );

  static TimeZoneData defaultTimeZoneData =
      TimeZoneData(value: 'GMT', offset: 1, abbr: 'GMT');

  static RecurringOptionData defaultRecurringOptionData =
      const RecurringOptionData(option: 'Never');

  static List<RecurringOptionData> recurringOptions = const [
    RecurringOptionData(option: 'Never'),
    RecurringOptionData(option: 'Always'),
  ];

  static List<AttendanceFieldData> attendanceFields = [
    AttendanceFieldData(
      checked: false,
      field: 'Name',
    ),
    AttendanceFieldData(
      checked: false,
      field: 'Email',
    ),
    AttendanceFieldData(
      checked: false,
      field: 'Phone Number',
    ),
    AttendanceFieldData(
      checked: false,
      field: 'Department',
    ),
  ];

  static List<GeoFenceTypeData> geoFenceTypes = [
    GeoFenceTypeData(
      type: 'Radius',
    ),
    GeoFenceTypeData(
      type: 'Polygon',
    ),
  ];

  static String requiredFieldMessage = 'All fields are required.';

  static String acceptTermsAndConditions = 'Terms and conditions is required';
}
