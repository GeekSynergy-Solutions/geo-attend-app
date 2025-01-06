import 'package:either_dart/either.dart';
import 'package:geoattend/data/remote/attendance/dataProvider/attnd_data.dart';
import 'package:geoattend/domain/entity/request/attendance/create/attndCreate/attnd_create_request.dart';
import 'package:geoattend/domain/entity/response/failure/failure_response.dart';
import 'package:geoattend/domain/entity/response/success/success_response.dart';
import 'package:geoattend/domain/repository/attendance/attendance_repo_interface.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AttendanceRepoInterface)
class AttendanceRepo implements AttendanceRepoInterface {
  final AttndData attendanceData;

  AttendanceRepo(
    this.attendanceData,
  );

  @override
  Future<Either<FailureResponse, SuccessResponse>> createAttendanceRepoRequest(
      {required AttndCreateRequest request}) async {
    var responseData = await attendanceData.createAttndRequest(
      request: request,
    );
    if (responseData.isRight) {
      return Right(SuccessResponse.fromJson(responseData.right));
    } else {
      return Left(responseData.left);
    }
  }
}
