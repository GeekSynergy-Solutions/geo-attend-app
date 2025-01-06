import 'package:geoattend/domain/entity/request/attendance/create/attndCreate/attnd_create_request.dart';
import 'package:geoattend/domain/entity/response/failure/failure_response.dart';
import 'package:geoattend/infrastructure/api/apiEndpoints/api_end_points.dart';
import 'package:geoattend/infrastructure/api/apiRequestHelper/api_request_helper.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class AttndData {
  ApiRequestHelper apiRequestHelper;
  AttndData(
    this.apiRequestHelper,
  );

  Future<Either<FailureResponse, Map<String, dynamic>>> createAttndRequest(
      {required AttndCreateRequest request}) async {
    Either<FailureResponse, Map<String, dynamic>> createAttndRequestResponse =
        await apiRequestHelper.postRequest(
      APIEndPoints.createAttendanceEndPoint,
      isDataRequired: true,
      isRequestAuthorized: true,
      jsonData: request.toJson(),
    );
    return createAttndRequestResponse;
  }
}
