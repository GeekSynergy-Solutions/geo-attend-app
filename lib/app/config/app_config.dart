enum Flavor { prod, dev }

class AppConfig {
  String appName = "";
  Flavor flavor = Flavor.dev;

  static AppConfig shared = AppConfig.create();

  factory AppConfig.create({
    String appName = "",
    Flavor flavor = Flavor.dev,
  }) {
    appName = flavor == Flavor.dev ? 'GeoAttend' : 'GeoAttend';
    return shared = AppConfig(appName, flavor);
  }

  AppConfig(this.appName, this.flavor);
}
