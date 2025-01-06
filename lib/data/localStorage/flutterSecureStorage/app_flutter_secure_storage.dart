import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppFlutterSecureStorage {
  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  Future setLoginToken(String token) async {
    await storage.write(
      key: 'geoAttendLoginToken',
      value: token,
    );
  }

  Future readLoginToken() async {
    final loginToken = await storage.read(
      key: 'geoAttendLoginToken',
    );
    return loginToken;
  }

  Future setRefreshToken(String token) async {
    await storage.write(
      key: 'geoAttendRefreshToken',
      value: token,
    );
  }

  Future readRefreshToken() async {
    final loginToken = await storage.read(
      key: 'geoAttendRefreshToken',
    );
    return loginToken;
  }

  Future setUserAuthEmail(String email) async {
    await storage.write(
      key: 'geoAttendUserAuthEmail',
      value: email,
    );
  }

  Future<String> readUserAuthEmail() async {
    final userAuthEmail = await storage.read(
      key: 'geoAttendUserAuthEmail',
    );
    return userAuthEmail ?? '';
  }
  
  Future setUserAuthEmailWithPerm(String email) async {
    await storage.write(
      key: 'geoAttendUserAuthEmailWithPerm',
      value: email,
    );
  }

  Future<String> readUserAuthEmailWithPerm() async {
    final userAuthEmail = await storage.read(
      key: 'geoAttendUserAuthEmailWithPerm',
    );
    return userAuthEmail ?? '';
  }
  
  Future setUserRequestPasswordEmail(String email) async {
    await storage.write(
      key: 'geoAttendUserRequestPasswordEmail',
      value: email,
    );
  }

  Future<String> readUserRequestPasswordEmail() async {
    final userRequestPasswordEmail = await storage.read(
      key: 'geoAttendUserRequestPasswordEmail',
    );
    return userRequestPasswordEmail ?? '';
  }

  Future setUserAuthPassword(String password) async {
    await storage.write(
      key: 'geoAttendUserAuthPassword',
      value: password,
    );
  }

  Future<String> readUserAuthPassword() async {
    final userAuthPassword = await storage.read(
      key: 'geoAttendUserAuthPassword',
    );
    return userAuthPassword ?? '';
  }
  
  Future setUserAuthPasswordWithPerm(String password) async {
    await storage.write(
      key: 'geoAttendUserAuthPasswordWithPerm',
      value: password,
    );
  }

  Future<String> readUserAuthPasswordWithPerm() async {
    final userAuthPassword = await storage.read(
      key: 'geoAttendUserAuthPasswordWithPerm',
    );
    return userAuthPassword ?? '';
  }
}
