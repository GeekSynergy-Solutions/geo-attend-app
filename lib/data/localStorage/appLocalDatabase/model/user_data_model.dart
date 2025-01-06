const String userTableName = 'geo_attend_user_data';

class UserField {
  static List<String> values = [
    id,
    email,
    fullname,
    firstName,
    lastName,
    deviceName,
    image,
    role,
    profileBgColor,
    userInitial,
    accountLocked,
    accountVerified,
    deviceVerified,
    firstTimeLogin,
    hasUserMigrated,
    dbUserId,
    deletedFromRemoteServer,
  ];

  static String id = '_id';
  static String email = '_email';
  static String fullname = '_fullname';
  static String firstName = '_firstName';
  static String lastName = '_lastName';
  static String deviceName = '_deviceName';
  static String image = '_image';
  static String role = '_role';
  static String accountLocked = '_accountLocked';
  static String accountVerified = '_accountVerified';
  static String deviceVerified = '_deviceVerified';
  static String firstTimeLogin = '_firstTimeLogin';
  static String hasUserMigrated = '_hasUserMigrated';
  static String profileBgColor = '_profileBgColor';
  static String userInitial = '_userInitial';
  static String dbUserId = '_dbUserId';
  static String deletedFromRemoteServer = '_deletedFromRemoteServer';
}

class UserDataModel {
  final int? id;
  final String? email;
  final String? fullname;
  final String? firstName;
  final String? lastName;
  final String? deviceName;
  final String? image;
  final String? role;
  final String? dbUserId;
  final String? profileBgColor;
  final String? userInitial;
  final int? accountLocked;
  final int? accountVerified;
  final int? deviceVerified;
  final int? firstTimeLogin;
  final int? hasUserMigrated;
  final int? deletedFromRemoteServer;

  const UserDataModel({
    this.id,
    this.email,
    this.fullname,
    this.image,
    this.firstName,
    this.lastName,
    this.deviceName,
    this.role,
    this.dbUserId,
    this.accountLocked,
    this.accountVerified,
    this.deviceVerified,
    this.firstTimeLogin,
    this.hasUserMigrated,
    this.profileBgColor,
    this.userInitial,
    this.deletedFromRemoteServer = 1,
  });

  UserDataModel copy({
    int? id,
    String? email,
    String? fullname,
    String? firstName,
    String? lastName,
    String? deviceName,
    String? image,
    String? role,
    String? dbUserId,
    String? profileBgColor,
    String? userInitial,
    int? accountLocked,
    int? accountVerified,
    int? deviceVerified,
    int? firstTimeLogin,
    int? hasUserMigrated,
    int? deletedFromRemoteServer,
  }) {
    return UserDataModel(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      fullname: fullname ?? this.fullname,
      image: image ?? this.image,
      lastName: lastName ?? this.lastName,
      deviceName: deviceName ?? this.deviceName,
      accountLocked: accountLocked ?? this.accountLocked,
      accountVerified: accountVerified ?? this.accountVerified,
      deviceVerified: deviceVerified ?? this.deviceVerified,
      firstTimeLogin: firstTimeLogin ?? this.firstTimeLogin,
      hasUserMigrated: hasUserMigrated ?? this.hasUserMigrated,
      profileBgColor: profileBgColor ?? this.profileBgColor,
      userInitial: userInitial ?? this.userInitial,
      role: role ?? this.role,
      dbUserId: role ?? this.dbUserId,
      deletedFromRemoteServer:
          deletedFromRemoteServer ?? this.deletedFromRemoteServer,
    );
  }

  Map<String, Object?> toJson() => {
        UserField.id: id,
        UserField.email: email,
        UserField.fullname: fullname,
        UserField.firstName: firstName,
        UserField.lastName: lastName,
        UserField.deviceName: deviceName,
        UserField.image: image,
        UserField.accountLocked: accountLocked,
        UserField.accountVerified: accountVerified,
        UserField.deviceVerified: deviceVerified,
        UserField.firstTimeLogin: firstTimeLogin,
        UserField.hasUserMigrated: hasUserMigrated,
        UserField.profileBgColor: profileBgColor,
        UserField.userInitial: userInitial,
        UserField.role: role,
        UserField.dbUserId: dbUserId,
        UserField.deletedFromRemoteServer: deletedFromRemoteServer,
      };

  static UserDataModel fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json[UserField.id] as int,
      email: json[UserField.email] ?? '',
      fullname: json[UserField.fullname] ?? '',
      image: json[UserField.image] ?? '',
      firstName: json[UserField.firstName] ?? '',
      lastName: json[UserField.lastName] ?? '',
      deviceName: json[UserField.deviceName] ?? '',
      accountVerified: json[UserField.accountVerified] as int,
      deviceVerified: json[UserField.deviceVerified] as int,
      firstTimeLogin: json[UserField.firstTimeLogin] as int,
      hasUserMigrated: json[UserField.hasUserMigrated] as int,
      accountLocked: json[UserField.accountLocked] as int,
      profileBgColor: json[UserField.profileBgColor] ?? '',
      userInitial: json[UserField.userInitial] ?? '',
      role: json[UserField.role] ?? '',
      dbUserId: json[UserField.dbUserId] ?? '',
      deletedFromRemoteServer: json[UserField.deletedFromRemoteServer] as int,
    );
  }
}
