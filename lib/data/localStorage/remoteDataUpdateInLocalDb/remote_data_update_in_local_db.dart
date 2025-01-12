import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:geoattend/data/localStorage/appLocalDatabase/geo_attend_db.dart';
import 'package:geoattend/data/localStorage/requestLocalDb/request_user_data.dart';
import 'package:geoattend/data/remote/auth/model/verifiedUserData/verified_user_data_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class RemoteDataUpdateInLocalDb {
  static Future<void> deleteCacheDir() async {
    var tempDir = await getTemporaryDirectory();

    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  }

  static Future<void> deleteAppCacheDir() async {
    var appDir = (await getTemporaryDirectory()).path;

    Directory(appDir).delete(recursive: true);
  }

  static Future<void> deleteAppDir() async {
    var appDocDir = await getApplicationDocumentsDirectory();

    if (appDocDir.existsSync()) {
      appDocDir.deleteSync(recursive: true);
    }
  }

  static Future<void> deleteAppStorage() async {
    final appStorage = await getApplicationSupportDirectory();
    if (appStorage.existsSync()) {
      appStorage.deleteSync(recursive: true);
    }
  }

  static Future<void> deleteDatabase() async {
    String path = (await getTemporaryDirectory()).path;
    await databaseFactory.deleteDatabase(path);
  }

  static Future<void> deleteReCreateTables() async {
    if (kDebugMode) {
      await GeoAttendDb.dropReCreateDbTables();
    }
  }

  static Future<void> deleteLocalDB() async {
    if (kDebugMode) {
      // await GeoAttendDb.deleteDb();
      await GeoAttendDb.deleteDb().then(
        (value) => GeoAttendDb.getDataBase,
      );
    }
    // await GeoAttendDb.dropReCreateDbTables();
  }

  static Future<void> addUpdateUser(
      {required VerifiedUserDataModel verifiedUser,
      required RequestUserData requestUserData}) async {
    await requestUserData.addNewOrUpdateUserRecord(
      email: verifiedUser.email,
      firstName: verifiedUser.firstName,
      lastName: verifiedUser.lastName,
      deviceName: verifiedUser.deviceName,
      image: '',
      role: verifiedUser.role!,
      dbUserId: verifiedUser.userId,
      profileBgColor: verifiedUser.userProfileBgColor,
      userInitial: verifiedUser.userInitial,
      accountLocked: 1,
      accountVerified: verifiedUser.accountVerified ? 1 : 0,
      deviceVerified: verifiedUser.deviceVerified ? 1 : 0,
      firstTimeLogin: verifiedUser.firstTimeUser ? 1 : 0,
      hasUserMigrated: verifiedUser.hasUserMigrated ? 1 : 0,
    );
  }
}
