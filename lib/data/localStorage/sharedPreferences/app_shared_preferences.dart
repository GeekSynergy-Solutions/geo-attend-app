import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:injectable/injectable.dart';
import 'package:native_shared_preferences/native_shared_preferences.dart';

@injectable
class AppSharedPreferences {
  Future cacheDeviceOnBoard() async {
    final prefs = await NativeSharedPreferences.getInstance();
    await prefs.setBool('onBoardedForGeoAttend', true);
  }

  Future<bool> readDeviceOnBoard() async {
    final prefs = await NativeSharedPreferences.getInstance();
    bool status = prefs.getBool('onBoardedForGeoAttend') ?? false;
    return status;
  }

  Future cacheUserEmail({required String emailAddress}) async {
    final prefs = await NativeSharedPreferences.getInstance();
    await prefs.setString('userEmailOnGeoAttend', emailAddress);
  }

  Future<String> readUserEmail() async {
    final prefs = await NativeSharedPreferences.getInstance();
    String status = prefs.getString('userEmailOnGeoAttend') ?? '';
    return status;
  }
  
  Future cacheUserIsAGuest({bool isUserAGuest = true}) async {
    final prefs = await NativeSharedPreferences.getInstance();
    await prefs.setBool('guestUserForGeoAttend', isUserAGuest);
  }

  Future<bool> readUserIsAGuest() async {
    final prefs = await NativeSharedPreferences.getInstance();
    bool status = prefs.getBool('guestUserForGeoAttend') ?? false;
    return status;
  }

  Future cacheUserTokenExpiryDate(String tokenExpiryDate) async {
    final prefs = await NativeSharedPreferences.getInstance();
    await prefs.setString('tokenExpiryDateForGeoAttend', tokenExpiryDate);
  }

  Future<String> readAuthTokenExpiryDate() async {
    final prefs = await NativeSharedPreferences.getInstance();
    var tokenExpiryDate = prefs.getString('tokenExpiryDateForGeoAttend') ?? '';
    return tokenExpiryDate;
  }

  Future<void> allowAuthentication(
      {required NativeSharedPreferences prefs, required bool setValue}) async {
    await prefs.setBool(
      'allowAuthForGeoAttend',
      setValue,
    );
  }

  Future<bool> readAllowAutthentication() async {
    final prefs = await NativeSharedPreferences.getInstance();

    String authTokenExpiryDate = await readAuthTokenExpiryDate();

    if (authTokenExpiryDate.isEmpty) {
      await allowAuthentication(
        prefs: prefs,
        setValue: true,
      );
    } else {
      DateTime tokenExpiryDate = DateTime.parse(authTokenExpiryDate);
      GeneralFunctions.outputDebugMessage(
          'token expiry date is $tokenExpiryDate');
      DateTime currentDate = DateTime.now();
      Duration duration = currentDate.difference(tokenExpiryDate);
      if (duration.inDays >= 1) {
        await allowAuthentication(
          prefs: prefs,
          setValue: false,
        );
      } else {
        await allowAuthentication(
          prefs: prefs,
          setValue: true,
        );
      }
    }

    bool allowAuth = prefs.getBool('allowAuthForGeoAttend') ?? false;
    return allowAuth;
  }
}
