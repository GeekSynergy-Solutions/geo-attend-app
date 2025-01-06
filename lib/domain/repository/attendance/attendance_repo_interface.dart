import 'package:either_dart/either.dart';
import 'package:geoattend/domain/entity/request/attendance/create/attndCreate/attnd_create_request.dart';
import 'package:geoattend/domain/entity/response/failure/failure_response.dart';
import 'package:geoattend/domain/entity/response/success/success_response.dart';

abstract class AttendanceRepoInterface {
  Future<Either<FailureResponse, SuccessResponse>>
      createAttendanceRepoRequest({required AttndCreateRequest request});
}
