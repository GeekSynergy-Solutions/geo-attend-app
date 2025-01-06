import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:geoattend/data/localStorage/appLocalDatabase/geo_attend_db.dart';
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
}
