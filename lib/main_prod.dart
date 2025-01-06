import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geoattend/app/geo_attend.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void mainProd() async {
  await dotenv.load(
    fileName: ".env/production.env",
  );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const GeoAttend(),
    ),
  );
}
