// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/bottomInfo/set_radius_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/bottomInfo/share_attendance_code_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/bottomInfo/successful_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/dialogInfo/dialog_message_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/dialogInfo/error_message_widget.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:geoattend/infrastructure/api/apiEndpoints/api_end_points.dart';
import 'package:geoattend/infrastructure/util/generalConstantValues/general_constant_values.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
// import 'package:url_launcher/url_launcher.dart' as url_launcher;

class GeneralFunctions {
  static Future<bool> showSuccessErrorInfoMessage({
    required String message,
    required BuildContext context,
    bool failureMessage = false,
    bool helpMessage = false,
    bool successMessage = false,
  }) async {
    return true;
  }

  static Future<void> snackBarMessage({
    required BuildContext context,
    required String message,
    bool reducedHeight = true,
    bool successMessage = false,
  }) async {
    Size deviceSize = GeneralFunctions.getDeviceSize(context: context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                message,
                style: const TextStyle(
                  color: AppColors.whiteTextColor,
                  fontSize: 16.0,
                ),
                textAlign:
                    message.length > 25 ? TextAlign.left : TextAlign.center,
              ),
            ),
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
              },
              icon: const Icon(
                Icons.close,
                color: AppColors.whiteTextColor,
              ),
            ),
          ],
        ),
        duration: const Duration(
          seconds: 2,
        ),
        backgroundColor: successMessage
            ? AppColors.snackBarSuccessBackgroundColor
            : AppColors.snackBarFailureBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          // side: const BorderSide(
          //   color: AppColors.primaryColor,
          //   width: 4.0,
          // ),
        ),
        margin: EdgeInsets.only(
          bottom: deviceSize.height -
              (reducedHeight
                  ? Platform.isAndroid
                      ? 170
                      : 300
                  : 120),
          right: 10.0,
          left: 10.0,
        ),
      ),
    );
  }

  static Future<bool> showErrorMessage({
    required BuildContext context,
    required String errorMessage,
    VoidCallback? okayFunctionality,
    String actionBtnLabel = 'Okay',
    Color titleColor = AppColors.primaryColor,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return ErrorMessageWidget(
          message: errorMessage,
          functionality: okayFunctionality ?? (){
            Navigator.pop(context);
          },
          actionLabel: actionBtnLabel,
        );
      },
    ).then(
      (value) => value == null ? true : !value,
    );
  }

  static List monthOfTheYear = [
    'Jan',
    'Feb',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'Sept',
    'October',
    'Nov',
    'Dec'
  ];

  static String formatAmount({required num amount}) {
    final numberFormat = NumberFormat("#,###", "en_US");
    return numberFormat.format(amount);
  }

  static String formatDate({required String dateString}) {
    DateTime parseDesDate = DateTime.parse(dateString);
    // bool isDateThisYear = confirmIfGivenDateIsThisYear(parseDesDate);
    String date =
        '${parseDesDate.day}, ${monthOfTheYear[parseDesDate.month - 1]} ${parseDesDate.year}';
    return date;
  }

  static bool confirmIfGivenDateIsThisYear(DateTime parseDesDate) {
    bool isParseDateThisYear = false;
    if (parseDesDate.year == DateTime.now().year) {
      isParseDateThisYear = true;
    } else {
      isParseDateThisYear = false;
    }
    return isParseDateThisYear;
  }

  static bool checkIfDateToShowEdit(String dateString) {
    DateTime parseDesDate = DateTime.parse(dateString);
    DateTime currentDateTime = DateTime.now();
    bool showEdit = false;
    if (parseDesDate.year == currentDateTime.year &&
        parseDesDate.month == currentDateTime.month) {
      if (parseDesDate.day >= currentDateTime.day) {
        showEdit = true;
      } else {
        if ((currentDateTime.day - parseDesDate.day) == 1) {
          if ((currentDateTime.hour - parseDesDate.hour) < 24) {
            showEdit = true;
          } else {
            showEdit = false;
          }
        } else {
          showEdit = false;
        }
      }
    } else {
      showEdit = false;
    }
    return showEdit;
  }

  static Size getDeviceSize({required BuildContext context}) {
    return MediaQuery.sizeOf(context);
  }

  static EdgeInsets getDeviceViewInsets({required BuildContext context}) {
    return MediaQuery.viewInsetsOf(context);
  }

  static String getCurrentYear({required BuildContext context}) {
    return '${DateTime.now().year}';
  }

  static bool isKeyBoardOpen({required BuildContext context}) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  static bool checkIfRequestIsUnauthorized({required int statusCode}) {
    return statusCode == GeneralConstantValues.unauthorizedRequest;
  }

  static bool checkIfRequestIsForBidden({required int statusCode}) {
    return statusCode == GeneralConstantValues.forBiddenRequest;
  }

  static bool isPlatformIOS = Platform.isIOS;

  static void handleUnauthorizedRouting(
      {required bool isRequestUnAuthorized, required BuildContext context}) {
    if (isRequestUnAuthorized) {}
  }

  static String convertFirstCharToUpperCaseChar({
    required String value,
  }) {
    String upperCaseValue = '';
    if (value.isNotEmpty) {
      String firstValueChar = value[0];

      upperCaseValue =
          value.replaceFirst(firstValueChar, firstValueChar.toUpperCase());
    }
    return upperCaseValue;
  }

  static String convertToUpperCaseChar({
    required String value,
  }) {
    return value.isNotEmpty ? value.toUpperCase() : '';
  }

  static String getMiddleNameInitial({
    required String middleName,
  }) {
    String initial = middleName.isNotEmpty
        ? convertFirstCharToUpperCaseChar(value: '${middleName[0]}.')
        : '';
    return initial;
  }

  static void outputDebugMessage(String message) {
    const bool isProduction = bool.fromEnvironment('dart.vm.product');
    if (!isProduction) {
      debugPrint(message);
    }
  }

  static String shortenLongMessageInHorizontalScrollView(String message) {
    List<String> messageWords = message.split(' ');
    List<String> formattedMessageWords = [];
    for (String word in messageWords) {
      if (messageWords.indexOf(word) % 4 == 0 &&
          messageWords.indexOf(word) != 0) {
        formattedMessageWords.add(word);
        formattedMessageWords.add('\n');
      } else {
        formattedMessageWords.add(word);
      }
    }
    return formattedMessageWords.join(' ');
  }

  static String listFirstElement(List<String> listToCheckOn) {
    return listToCheckOn.isNotEmpty ? listToCheckOn.first : '';
  }

  static String formatDateForTime(
      {required String dateString, bool removeFormat = true}) {
    DateTime parseDesDate = DateTime.parse(dateString).toUtc().toLocal();

    String time = '';
    int hour = parseDesDate.hour;
    int minute = parseDesDate.minute;
    String format = 'AM';
    if (hour > 12) {
      hour -= 12;
      format = 'PM';
    }
    time =
        '${hour.toString().length == 1 ? '0$hour' : hour}:${minute.toString().length == 1 ? '0$minute' : minute} ${removeFormat ? '' : format}'
            .trim();
    return time;
  }

  static void showDailogInformationMessage(
      {required String dialogMessage,
      required String title,
      required BuildContext context,
      required VoidCallback okayFunctionality}) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return DialogMessageWidget(
          dialogMessage: dialogMessage,
          okayFunctionality: okayFunctionality,
          title: title,
        );
      },
    );
  }

  static void showInformationDialog({
    required String message,
    required BuildContext context,
    required VoidCallback okayFunctionality,
  }) {
    showDailogInformationMessage(
      title: 'Alert!',
      context: context,
      dialogMessage: message,
      okayFunctionality: okayFunctionality,
    );
  }

  static Future<bool> showActionBottomSheetMessage(
      {required BuildContext context,
      required VoidCallback yesFunctionality,
      required String title,
      required String description}) async {
    bool result = false;
    return result;
  }

  static void showBottomSheetSuccessfulMessage({
    required BuildContext context,
    required bool requireAnAction,
    ShapeBorder? shapeBorder,
    String? message,
    String? actionBtnLabel,
    VoidCallback? functionality,
  }) async {
    shapeBorder = shapeBorder ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: shapeRadius(
              radius: 10.0,
            ),
            topRight: shapeRadius(
              radius: 10.0,
            ),
          ),
        );
    await showModalBottomSheet(
      context: context,
      shape: shapeBorder,
      isScrollControlled: true,
      builder: (context) {
        return SuccessfulWidget(
          requireAnAction: requireAnAction,
          actionFunctionality: functionality,
          actionLabel: actionBtnLabel,
        );
      },
    );
  }

  static void showBottomSheetWidget({
    required BuildContext context,
    required Widget successfulModalWidget,
    ShapeBorder? shapeBorder,
  }) async {
    shapeBorder = shapeBorder ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: shapeRadius(
              radius: 10.0,
            ),
            topRight: shapeRadius(
              radius: 10.0,
            ),
          ),
        );
    await showModalBottomSheet(
      context: context,
      shape: shapeBorder,
      isScrollControlled: true,
      builder: (context) {
        return successfulModalWidget;
      },
    );
  }

  static Radius shapeRadius({required double radius}) =>
      Radius.circular(radius);

  static Future<dynamic> showGeoFenceTypeSettingBottomSheetDialog({
    required BuildContext context,
    double currentSetValue = 0.0,
    String type = '',
  }) async {
    debugPrint('here is the given value of it $currentSetValue 2');
    dynamic data = await showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bottomSheetBgColor,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(7.0),
          topRight: Radius.circular(7.0),
        ),
      ),
      builder: (context) {
        return SetRadiusWidget(
          type: type,
          currentSetValue: currentSetValue,
        );
      },
    );
    return data;
  }

  static Future<dynamic> showShareAttndCodeBottomSheetDialog({
    required BuildContext context,
    required String attendanceCode,
  }) async {
    dynamic data = await showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bottomSheetBgColor,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(7.0),
          topRight: Radius.circular(7.0),
        ),
      ),
      builder: (context) {
        return ShareAttendanceCodeWidget(
          attendanceCode: attendanceCode,
        );
      },
    );
    return data;
  }

  static double topMargin(Size size) => size.height * 0.05;
  static double verticalSpacing(Size size) => size.height * 0.05;
  static double horizontalSpacing(Size size) => size.width * 0.05;

  static EdgeInsets scaffoldPadding(Size size) => EdgeInsets.symmetric(
        horizontal: horizontalSpacing(size),
        vertical: verticalSpacing(size),
      );

  static bool checkFieldIfStringIsEmpty(String value) {
    if (value.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static bool checkFieldIfListIsEmpty(List value) {
    if (value.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static bool checkFieldIfAnyElementInListIsEmpty(List value) {
    bool status = false;
    for (String element in value) {
      status = element.isEmpty;
      if (status) {
        break;
      }
    }
    return status;
  }

  static DecorationImage getFileImage({
    required File imageFile,
  }) {
    return DecorationImage(
      image: FileImage(
        imageFile,
      ),
      fit: BoxFit.cover,
      onError: (exception, stackTrace) => Container(),
    );
  }

  static DecorationImage getUserImage({
    required String imagePath,
  }) {
    GeneralFunctions.outputDebugMessage(
        'this is the image path ${APIEndPoints.photoBaseUrl}$imagePath');
    return imagePath.isNotEmpty
        ? DecorationImage(
            image: CachedNetworkImageProvider(
              '${APIEndPoints.photoBaseUrl}$imagePath',
              errorListener: (value) => Container(),
            ),
            fit: BoxFit.cover,
            onError: (exception, stackTrace) => Container(),
          )
        : DecorationImage(
            image: const AssetImage(''),
            fit: BoxFit.cover,
            onError: (exception, stackTrace) => Container(),
          );
  }

  static String formatPhoneNumber({required String value}) {
    String phoneNumber = '';
    for (Country country in countries) {
      if (value[0] == '+') {
        String countryCode = '';
        if (country.dialCode.contains('+')) {
          countryCode = country.dialCode;
        } else {
          countryCode = '+${country.dialCode}';
        }
        if (value.substring(0, countryCode.length) == countryCode) {
          phoneNumber = value.substring(
            country.dialCode.length + 1,
          );
          break;
        } else {
          phoneNumber = value;
        }
      } else {
        phoneNumber = value;
        break;
      }
    }
    return phoneNumber;
  }

  static Color convertHexToColor(String hexCode) {
    hexCode = hexCode.toUpperCase().replaceAll('#', '');
    if (hexCode.length == 6) {
      hexCode = 'FF$hexCode';
    }
    return Color(int.parse(hexCode, radix: 16));
  }

  static Color getColor(String color) {
    switch (color.toLowerCase()) {
      case "red":
        return Colors.red;
      case "blue":
        return Colors.blue;
      case "yellow":
        return Colors.yellow;
      case "orange":
        return Colors.orange;
      case "green":
        return Colors.green;
      case "purple":
        return Colors.purple;
      default:
        return Colors.transparent;
    }
  }

  static Future<void> checkPermissions() async {
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  static Future<Uint8List> loadAsset(String path) async {
    final ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List();
  }

  static Future<MultipartFile> getMultipartFile(
      {required String uploadedPath}) async {
    // if (uploadedPath.isEmpty) {
    //   await checkPermissions();
    // }
    final Uint8List fileData =
        await loadAsset('assets/images/profile/user-profile.png');
    Directory tempDir = await getTemporaryDirectory();
    String localFilePath = '${tempDir.path}/user-profile.png';
    File file = File(localFilePath);
    await file.writeAsBytes(fileData);
    return await MultipartFile.fromFile(
      uploadedPath.isNotEmpty ? uploadedPath : file.path,
    );
  }

  static String getRandomString(int length) {
    if (length < 4) {
      throw ArgumentError(
          'Length must be at least 4 to include all character types');
    }
    const String uppercaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz';
    const String numbers = '0123456789';
    const String specials = '!@#\$%^&*()-_=+[]{}|;:,.<>?';
    const String allChars =
        uppercaseLetters + lowercaseLetters + numbers + specials;

    Random random = Random();

    List<String> result = [
      uppercaseLetters[random.nextInt(uppercaseLetters.length)],
      lowercaseLetters[random.nextInt(lowercaseLetters.length)],
      numbers[random.nextInt(numbers.length)],
      specials[random.nextInt(specials.length)]
    ];

    for (int i = result.length; i < length; i++) {
      result.add(allChars[random.nextInt(allChars.length)]);
    }

    result.shuffle(random);

    return result.join('');
  }

  static String getRandomValueForPassword() {
    return getRandomString(8);
  }

  static Future<DateTime> openDateCalendarAndGetDateTime({
    required BuildContext context,
  }) async {
    DateTime selectedDate = DateTime.now();
    DateTime firstDate = DateTime.now().subtract(
      const Duration(
        days: 120,
      ),
    );
    DateTime initialDate = DateTime.now();
    DateTime lastDate = DateTime.now().add(const Duration(days: 120));
    await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    ).then((value) {
      if (value != null) {
        selectedDate = value;
      }
    });
    return selectedDate;
  }

  static Future<TimeOfDay> openTimePickerCalendarAndTime({
    required BuildContext context,
  }) async {
    TimeOfDay selectedTimeOfDay = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          initialEntryMode: TimePickerEntryMode.inputOnly,
        ) ??
        TimeOfDay.now();
    return selectedTimeOfDay;
  }

  static DateTime convertTimeOfDayToDateTime({required TimeOfDay timeOfDay}) {
    final now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }

  static Future<void> openSavedFile({required String filePath}) async {
    // final Uint8List fileData =
    //     await loadAsset('assets/images/profile/user-profile.png');
    // Directory tempDir = await getTemporaryDirectory();
    // String localFilePath = '${tempDir.path}/user-profile.png';
    // File file = File(localFilePath);
    // await file.writeAsBytes(fileData);
    if (filePath.isNotEmpty) {
      final file = File(filePath);
      if (await file.exists()) {
        final result = await OpenFile.open(filePath);
        outputDebugMessage('Status of file: ${result.type}');
        // await file.readAsBytes();
        // final uri = Uri.file(filePath);
        // if (await url_launcher.canLaunchUrl(uri)) {
        //   await url_launcher.launchUrl(uri);
        // }
      }
    }
  }
}
