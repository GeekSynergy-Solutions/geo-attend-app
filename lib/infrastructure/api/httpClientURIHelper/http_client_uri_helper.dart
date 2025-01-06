import 'package:geoattend/infrastructure/api/apiEndpoints/api_end_points.dart';

class HttpClientUriHelper {
  static Uri getUri({String? baseURL, required String path}) {
    return Uri.parse('${baseURL ?? APIEndPoints.geoLocationBaseURL}$path');
  }
}
