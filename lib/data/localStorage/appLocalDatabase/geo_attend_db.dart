import 'package:geoattend/app/config/app_config.dart';
import 'package:geoattend/data/localStorage/appLocalDatabase/model/user_data_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class GeoAttendDb {
  static GeoAttendDb instance = GeoAttendDb._init();

  static Database? _database;

  GeoAttendDb._init();

  static Future<Database> get getDataBase async {
    if (_database != null) return _database!;

    _database = await _initDB(
      AppConfig.shared.flavor == Flavor.dev ? 'geo-attend-dev.db' : 'geo-attend-app.db',
    );

    return _database!;
  }

  static Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: AppConfig.shared.flavor == Flavor.dev ? 3 : 1,
      onCreate: _createDB,
      onUpgrade: _upGradeDB,
      onDowngrade: _downGradeDB,
    );
  }

  static Future _createDB(Database db, int version) async {
    await createDbTables(db);
  }

  static Future<void> createDbTables(Database db) async {
    await userDetailsTable(db);
  }

  static Future _upGradeDB(Database db, int oldVersion, int newVersion) async {
    
  }

  static Future _downGradeDB(
      Database db, int oldVersion, int newVersion) async {
  }

  static Future dropReCreateDbTables() async {
  }

  static Future<void> tablesToUpgrade(Database db) async {
  }

  static Future userDetailsTable(Database db) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const stringType = 'TEXT DEFAULT " "';
    const boolType = 'INTEGER DEFAULT 0';

    await db.execute('''
      CREATE TABLE $userTableName(
        ${UserField.id} $idType,
        ${UserField.email} $stringType,
        ${UserField.fullname} $stringType,
        ${UserField.firstName} $stringType,
        ${UserField.lastName} $stringType,
        ${UserField.deviceName} $stringType,
        ${UserField.image} $stringType,
        ${UserField.role} $stringType,
        ${UserField.dbUserId} $stringType,
        ${UserField.profileBgColor} $stringType,
        ${UserField.userInitial} $stringType,
        ${UserField.accountLocked} $boolType,
        ${UserField.accountVerified} $boolType,
        ${UserField.deviceVerified} $boolType,
        ${UserField.firstTimeLogin} $boolType,
        ${UserField.hasUserMigrated} $boolType,
        ${UserField.deletedFromRemoteServer} $boolType
      )
    ''');
  }

  static Future<void> deleteDb() async {
    final dbPath = await getDatabasesPath();

    await deleteDatabase(
      join(
        dbPath,
        AppConfig.shared.flavor == Flavor.dev ? 'geo-attend-dev.db' : 'geo-attend-app',
      ),
    );
  }

  static Future closeDb() async {
    final db = await getDataBase;
    db.close();
  }
}
