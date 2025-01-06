import 'package:geoattend/domain/entity/response/failure/failure_response.dart';
import 'package:geoattend/infrastructure/api/apiEndpoints/api_end_points.dart';
import 'package:either_dart/either.dart';
import 'package:geoattend/infrastructure/api/httpClientApiRequestHelper/http_client_api_request_helper.dart';
import 'package:injectable/injectable.dart';

@injectable
class HereGeoLocationData {
  HttpClientApiRequestHelper httpClientApiRequestHelper;
  HereGeoLocationData(
    this.httpClientApiRequestHelper,
  );

  Future<Either<FailureResponse, Map<String, dynamic>>> hereAutoCompleteRequest(
      {required String location}) async {
    Either<FailureResponse, Map<String, dynamic>> hereAutoCompleteRequestResponse =
        await httpClientApiRequestHelper.getRequest(
      '${APIEndPoints.hereAutoCompleteEndPoint}?limit=5&q=$location&apiKey=${APIEndPoints.hereAuthApiKey}',
      baseUrl: APIEndPoints.hereAutoCompleteBaseUrl,
      isEndPointAuthorized: false,
    );
    return hereAutoCompleteRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> hereGeoCodeRequest(
      {required String location}) async {
    Either<FailureResponse, Map<String, dynamic>> hereGeoCodeRequestResponse =
        await httpClientApiRequestHelper.getRequest(
      '${APIEndPoints.hereGeoCodeEndPoint}?limit=5&q=$location&apiKey=${APIEndPoints.hereAuthApiKey}',
      baseUrl: APIEndPoints.hereGeoCodeBaseUrl,
      isEndPointAuthorized: false,
    );
    return hereGeoCodeRequestResponse;
  }
}
