import 'package:device_preview/device_preview.dart';
import 'package:geoattend/app/config/appRouterHandler/app_router.dart';
import 'package:geoattend/app/config/appTheme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:geoattend/app/config/app_config.dart';

final _appRouter = AppRouter();

class GeoAttend extends StatelessWidget {
  const GeoAttend({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConfig.shared.appName,
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: AppTheme.androidDay(context: context),
      themeMode: ThemeMode.system,
      routerConfig: _appRouter.config(),
      // routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
