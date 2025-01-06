import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geoattend/app/config/app_config.dart';
import 'package:geoattend/infrastructure/di/injection.dart';
import 'package:geoattend/main_dev.dart';
import 'package:geoattend/main_prod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  configureDependencies();
  HttpOverrides.global = AppHttpOverrides();
  AppConfig.create(
    flavor: Flavor.dev,
  );
  AppConfig.shared.flavor == Flavor.dev ? mainDev() : mainProd();
}

class AppHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
