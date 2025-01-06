import 'package:geoattend/data/localStorage/appLocalDatabase/geo_attend_db.dart';
import 'package:geoattend/data/localStorage/appLocalDatabase/model/user_data_model.dart';
import 'package:geoattend/data/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@injectable
class RequestUserData {
  final AppSharedPreferences appSharedPreferences;
  RequestUserData(this.appSharedPreferences);
  Future addUserToStorage({
    required String email,
    required String fullname,
    required String firstName,
    required String lastName,
    required String deviceName,
    required String image,
    required String role,
    required String dbUserId,
    required String profileBgColor,
    required String userInitial,
    required int accountLocked,
    required int accountVerified,
    required int deviceVerified,
    required int firstTimeLogin,
    required int hasUserMigrated,
    int? deletedFromRemoteServer = 0,
  }) async {
    final db = await GeoAttendDb.getDataBase;

    String userFirstName =
        GeneralFunctions.convertFirstCharToUpperCaseChar(value: firstName);
    String userLastName =
        GeneralFunctions.convertFirstCharToUpperCaseChar(value: lastName);

    final userDataModel = UserDataModel(
      email: email,
      firstName: firstName,
      fullname: '$userFirstName $userLastName',
      image: image,
      lastName: lastName,
      deviceName: deviceName,
      role: role.replaceFirst(role[0], role[0].toUpperCase()),
      dbUserId: dbUserId,
      accountLocked: accountLocked,
      accountVerified: accountVerified,
      deviceVerified: deviceVerified,
      firstTimeLogin: firstTimeLogin,
      hasUserMigrated: hasUserMigrated,
      deletedFromRemoteServer: deletedFromRemoteServer,
    );

    final id = await db.insert(
      userTableName,
      userDataModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return userDataModel.copy(id: id);
  }

  Future updateUserRecord({
    required String email,
    required String fullname,
    required String firstName,
    required String lastName,
    required String deviceName,
    required String image,
    required String role,
    required String dbUserId,
    required String profileBgColor,
    required String userInitial,
    required int accountLocked,
    required int accountVerified,
    required int deviceVerified,
    required int firstTimeLogin,
    required int hasUserMigrated,
    int? deletedFromRemoteServer = 0,
  }) async {
    final getUserData = await getUserDataInStorage();

    final db = await GeoAttendDb.getDataBase;

    for (var element in getUserData) {
      if (element.email == email) {
        String userFirstName =
            GeneralFunctions.convertFirstCharToUpperCaseChar(value: firstName);
        String userLastName =
            GeneralFunctions.convertFirstCharToUpperCaseChar(value: lastName);
        final userDataModel = UserDataModel(
          id: element.id,
          email: email,
          firstName: firstName,
          fullname: '$userFirstName $userLastName',
          image: image,
          lastName: lastName,
          deviceName: deviceName,
          accountLocked: accountLocked,
          accountVerified: accountVerified,
          deviceVerified: deviceVerified,
          firstTimeLogin: firstTimeLogin,
          hasUserMigrated: hasUserMigrated,
          profileBgColor: profileBgColor,
          userInitial: userInitial,
          role: role.replaceFirst(role[0], role[0].toUpperCase()),
          dbUserId: dbUserId,
          deletedFromRemoteServer: deletedFromRemoteServer,
        );

        return db.update(
          userTableName,
          userDataModel.toJson(),
          where: '${UserField.email} = ?',
          whereArgs: [userDataModel.email],
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    }
  }

  Future deleteUserRecord({
    required String email,
    int? deletedFromRemoteServer = 1,
  }) async {
    final getUserData = await getUserDataInStorage();

    final db = await GeoAttendDb.getDataBase;

    for (var element in getUserData) {
      if (element.email == email) {
        final userDataModel = UserDataModel(
          id: element.id,
          email: email,
          firstName: element.firstName,
          fullname: element.fullname,
          image: element.image,
          lastName: element.lastName,
          accountLocked: element.accountLocked,
          accountVerified: element.accountVerified,
          deviceVerified: element.deviceVerified,
          firstTimeLogin: element.firstTimeLogin,
          hasUserMigrated: element.hasUserMigrated,
          profileBgColor: element.profileBgColor,
          userInitial: element.userInitial,
          role: GeneralFunctions.convertFirstCharToUpperCaseChar(
            value: element.role ?? '',
          ),
          dbUserId: element.dbUserId,
          deletedFromRemoteServer: deletedFromRemoteServer,
        );

        return db.delete(
          userTableName,
          where: '${UserField.email} = ?',
          whereArgs: [userDataModel.email],
        );
      }
    }
  }

  Future<List<UserDataModel>> getUserDataInStorage() async {
    final db = await GeoAttendDb.getDataBase;
    final orderBy = '${UserField.id} ASC';
    final userData = await db.query(
      userTableName,
      orderBy: orderBy,
    );
    for (var user in userData) {
      GeneralFunctions.outputDebugMessage(
          'this is the list from local DB $user');
    }
    return userData.map((json) => UserDataModel.fromJson(json)).toList();
  }

  Future<String> getUserFullnameInStorage() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readUserEmail();
    String fullname = '';
    for (var element in getUserData) {
      if (element.email == email) {
        fullname = element.fullname ?? '';
        break;
      }
    }
    return fullname;
  }

  Future<String> getUserFirstName() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readUserEmail();
    String firstName = '';
    for (var element in getUserData) {
      if (element.email == email) {
        firstName = element.firstName ?? '';
        break;
      }
    }
    return firstName;
  }

  Future<String> getUserDbUserId() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readUserEmail();
    String dbUserId = '';
    for (var element in getUserData) {
      if (element.email == email) {
        dbUserId = element.dbUserId ?? '';
        break;
      }
    }
    return dbUserId;
  }

  Future<String> getUserEmailAddress() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readUserEmail();
    String emailAddress = '';
    for (var element in getUserData) {
      if (element.email == email) {
        emailAddress = element.email ?? '';
        break;
      }
    }
    return emailAddress;
  }

  Future<String> getUserLastName() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readUserEmail();
    String lastName = '';
    for (var element in getUserData) {
      if (element.email == email) {
        lastName = element.lastName ?? '';
        break;
      }
    }
    return lastName;
  }

  Future<String> getUserImage() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readUserEmail();
    String imagePath = '';
    for (var element in getUserData) {
      if (element.email == email) {
        imagePath = element.image ?? '';
        break;
      }
    }
    return imagePath;
  }

  Future<String> getUserRole() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readUserEmail();
    String userRole = '';
    for (var element in getUserData) {
      if (element.email == email) {
        userRole = element.role ?? '';
        break;
      }
    }
    return userRole;
  }

  Future<bool> getUserAccountVerificationStatus() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readUserEmail();
    bool userVerificationStatus = false;
    for (var element in getUserData) {
      if (element.email == email) {
        userVerificationStatus = element.accountVerified == 1;
        break;
      }
    }
    return userVerificationStatus;
  }

  Future<bool> getUserDeviceVerificationStatus() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readUserEmail();
    bool userVerificationStatus = false;
    for (var element in getUserData) {
      if (element.email == email) {
        userVerificationStatus = element.deviceVerified == 1;
        break;
      }
    }
    return userVerificationStatus;
  }

  Future<bool> getUserFirstTimeLoginStatus() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readUserEmail();
    bool firstTimeLogin = false;
    for (var element in getUserData) {
      if (element.email == email) {
        firstTimeLogin = element.firstTimeLogin == 1;
        break;
      }
    }
    return firstTimeLogin;
  }

  Future<bool> getAccountMigirationStatus() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readUserEmail();
    bool hasAccBeMigrated = false;
    for (var element in getUserData) {
      if (element.email == email) {
        hasAccBeMigrated = element.hasUserMigrated == 1;
        break;
      }
    }
    return hasAccBeMigrated;
  }

  Future<String> getUserInitialStatus() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readUserEmail();
    String userInitial = '';
    for (var element in getUserData) {
      if (element.email == email) {
        userInitial = element.userInitial ?? '';
        break;
      }
    }
    return userInitial;
  }

  Future<String> getUserProfileBackgroundStatus() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readUserEmail();
    String userProfileBgColor = '';
    for (var element in getUserData) {
      if (element.email == email) {
        userProfileBgColor = element.profileBgColor ?? '';
        break;
      }
    }
    return userProfileBgColor;
  }
  Future<String> getUserDeviceNameStatus() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readUserEmail();
    String userDeviceName = '';
    for (var element in getUserData) {
      if (element.email == email) {
        userDeviceName = element.deviceName ?? '';
        break;
      }
    }
    return userDeviceName;
  }

  Future<bool> getUserAccountLocked() async {
    final getUserData = await getUserDataInStorage();
    final email = await appSharedPreferences.readUserEmail();
    bool userAccountLocked = false;
    for (var element in getUserData) {
      if (element.email == email) {
        userAccountLocked = element.accountLocked == 1;
        break;
      }
    }
    return userAccountLocked;
  }

  Future addNewOrUpdateUserRecord({
    required String email,
    required String fullname,
    required String firstName,
    required String lastName,
    required String deviceName,
    required String image,
    required String role,
    required String dbUserId,
    required String profileBgColor,
    required String userInitial,
    required int accountLocked,
    required int accountVerified,
    required int deviceVerified,
    required int firstTimeLogin,
    required int hasUserMigrated,
    int? deletedFromRemoteServer = 1,
  }) async {
    final getUserData = await getUserDataInStorage();

    if (getUserData.isEmpty) {
      await addUserToStorage(
        email: email,
        firstName: firstName,
        lastName: lastName,
        deviceName: deviceName,
        role: role,
        accountLocked: accountLocked,
        fullname: fullname,
        image: image,
        dbUserId: dbUserId,
        accountVerified: accountVerified,
        deviceVerified: deviceVerified,
        firstTimeLogin: firstTimeLogin,
        hasUserMigrated: hasUserMigrated,
        profileBgColor: profileBgColor,
        userInitial: userInitial,
        deletedFromRemoteServer: deletedFromRemoteServer,
      );
    } else {
      bool isNotInDb = false;
      for (var element in getUserData) {
        if (element.email == email) {
          await updateUserRecord(
            email: email,
            firstName: firstName,
            lastName: lastName,
            deviceName: deviceName,
            role: role,
            accountLocked: accountLocked,
            fullname: fullname,
            image: image,
            dbUserId: dbUserId,
            accountVerified: accountVerified,
            deviceVerified: deviceVerified,
            firstTimeLogin: firstTimeLogin,
            hasUserMigrated: hasUserMigrated,
            profileBgColor: profileBgColor,
            userInitial: userInitial,
            deletedFromRemoteServer: deletedFromRemoteServer,
          );
          isNotInDb = false;
          break;
        } else {
          isNotInDb = true;
        }
      }
      if (isNotInDb) {
        await addUserToStorage(
          email: email,
          firstName: firstName,
          lastName: lastName,
          deviceName: deviceName,
          role: role,
          accountLocked: accountLocked,
          fullname: fullname,
          image: image,
          dbUserId: dbUserId,
          accountVerified: accountVerified,
          deviceVerified: deviceVerified,
          firstTimeLogin: firstTimeLogin,
          hasUserMigrated: hasUserMigrated,
          profileBgColor: profileBgColor,
          userInitial: userInitial,
          deletedFromRemoteServer: deletedFromRemoteServer,
        );
      }
    }
  }
}
