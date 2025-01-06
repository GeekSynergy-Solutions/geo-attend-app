import 'package:device_info_plus/device_info_plus.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';

class DeviceData {
  static DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  static bool isDeviceIos = GeneralFunctions.isPlatformIOS;

  static Future<AndroidDeviceInfo> androidInfo() async {
    return await deviceInfo.androidInfo;
  }

  static Future<IosDeviceInfo> iosInfo() async {
    return await deviceInfo.iosInfo;
  }

  static Future<String> deviceId() async {
    if (isDeviceIos) {
      IosDeviceInfo iosDeviceInfo = await iosInfo();
      return iosDeviceInfo.identifierForVendor ?? '';
    } else {
      AndroidDeviceInfo androidDeviceInfo = await androidInfo();
      return androidDeviceInfo.id;
    }
  }

  static Future<String> serialNumber() async {
    if (isDeviceIos) {
      IosDeviceInfo iosDeviceInfo = await iosInfo();
      return iosDeviceInfo.identifierForVendor ?? '';
    } else {
      AndroidDeviceInfo androidDeviceInfo = await androidInfo();
      return androidDeviceInfo.id;
    }
  }

  static Future<String> modelNumber() async {
    if (isDeviceIos) {
      IosDeviceInfo iosDeviceInfo = await iosInfo();
      return iosDeviceInfo.model;
    } else {
      AndroidDeviceInfo androidDeviceInfo = await androidInfo();
      return androidDeviceInfo.device;
    }
  }

  static Future<String> modelName() async {
    if (isDeviceIos) {
      IosDeviceInfo iosDeviceInfo = await iosInfo();
      return iosDeviceInfo.utsname.machine;
    } else {
      AndroidDeviceInfo androidDeviceInfo = await androidInfo();
      return androidDeviceInfo.model;
    }
  }
}
