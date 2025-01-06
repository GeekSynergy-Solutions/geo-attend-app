import 'package:geoattend/infrastructure/api/apiEndpoints/api_end_points.dart';
import 'package:geoattend/infrastructure/api/httpClientURIHelper/http_client_uri_helper.dart';
import 'package:http/http.dart' as http;

class HttpClientMultipartRequestHandler {
  late http.MultipartRequest multipartRequest;
  late String requestMethod;
  final String endPointPath;
  final bool isRequestPOST;
  final bool isRequestPATCH;
  final bool isRequestPUT;

  HttpClientMultipartRequestHandler({
    required this.endPointPath,
    this.isRequestPATCH = false,
    this.isRequestPOST = false,
    this.isRequestPUT = false,
  }) {
    requestMethod = isRequestPATCH
        ? 'PATCH'
        : isRequestPOST
            ? 'POST'
            : 'PUT';
    multipartRequest = http.MultipartRequest(
      requestMethod,
      HttpClientUriHelper.getUri(
        path: endPointPath,
      ),
    );
  }

  void addFormDataField(
      {required String formDataFieldKey, required String formDataFieldValue}) {
    multipartRequest.fields[formDataFieldKey] = formDataFieldValue;
  }

  void addFormDataFile(
      {required String formDataFileKey,
      required String formDataFilePathValue}) async {
    http.MultipartFile formDataFile = await http.MultipartFile.fromPath(
        formDataFileKey, formDataFilePathValue);
    multipartRequest.files.add(formDataFile);
  }

  http.MultipartRequest getMultipartRequest({bool isRequestAuthorized = true}) {
    multipartRequest.headers.addAll(isRequestAuthorized
        ? {
            APIEndPointsParameter.authHeader:
                APIEndPointsParameter.authHeader,
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          }
        : {'Accept': 'application/json', 'Content-Type': 'application/json'});
    return multipartRequest;
  }
}
