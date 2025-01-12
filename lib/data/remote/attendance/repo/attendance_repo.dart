import 'package:either_dart/either.dart';
import 'package:geoattend/data/remote/attendance/dataProvider/attnd_data.dart';
import 'package:geoattend/data/remote/attendance/model/attendeeAttendanceAnalytics/attendee_attendance_analytics_model.dart';
import 'package:geoattend/data/remote/attendance/model/attendeeAttendancePieChart/attendee_attendance_pie_chart_model.dart';
import 'package:geoattend/data/remote/attendance/model/attendeeAttendances/attendee_attendances_model.dart';
import 'package:geoattend/data/remote/attendance/model/attendeeAttendances/recentAttendeeAttendance/recent_attendee_attendance_model.dart';
import 'package:geoattend/data/remote/attendance/model/bioFields/bio_fields_model.dart';
import 'package:geoattend/data/remote/attendance/model/createAttendance/create_attendance_model.dart';
import 'package:geoattend/data/remote/attendance/model/geoFence/geo_fence_model.dart';
import 'package:geoattend/data/remote/attendance/model/hostAttendance/host_attendances_model.dart';
import 'package:geoattend/data/remote/attendance/model/hostAttendance/recentHostAttendance/recent_host_attendance_model.dart';
import 'package:geoattend/data/remote/attendance/model/hostAttendanceAnalytics/host_attendance_analytics_model.dart';
import 'package:geoattend/data/remote/attendance/model/hostAttendancePieChart/host_attendance_pie_chart_model.dart';
import 'package:geoattend/data/remote/attendance/model/recurringMode/recurring_mode_model.dart';
import 'package:geoattend/data/remote/attendance/model/sendAttendanceReport/send_attendance_report_model.dart';
import 'package:geoattend/data/remote/attendance/model/totalAttendanceCreated/total_attendance_created_model.dart';
import 'package:geoattend/data/remote/attendance/model/totalAttendanceJoined/total_attendance_joined_model.dart';
import 'package:geoattend/domain/entity/request/attendance/confirmationCode/send/send_confirmation_code_request.dart';
import 'package:geoattend/domain/entity/request/attendance/confirmationCode/verify/verify_confirmation_code_request.dart';
import 'package:geoattend/domain/entity/request/attendance/create/attndCreate/attnd_create_request.dart';
import 'package:geoattend/domain/entity/request/attendance/sendReport/send_report_request.dart';
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

  @override
  Future<Either<FailureResponse, GeoFenceModel>>
      attendanceGeoFenceTypesRequest() async {
    var responseData = await attendanceData.attendanceGeoFenceTypesRequest();
    if (responseData.isRight) {
      return Right(GeoFenceModel.fromJson(
          SuccessResponse.fromJson(responseData.right).data));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, RecurringModeModel>>
      attendanceRecurringModesRequest() async {
    var responseData = await attendanceData.attendanceRecurringModesRequest();
    if (responseData.isRight) {
      return Right(RecurringModeModel.fromJson(
          SuccessResponse.fromJson(responseData.right).data));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, AttendeeAttendancesModel>>
      attendeeAttendancesRequest() async {
    var responseData = await attendanceData.attendeeAttendancesRequest();
    if (responseData.isRight) {
      return Right(AttendeeAttendancesModel.fromJson(
          SuccessResponse.fromJson(responseData.right).data));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, AttendeeAttendancePieChartModel>>
      attendeeAttndPieChartRequest({required String attendanceId}) async {
    var responseData = await attendanceData.attendeeAttendancePieChartRequest(
      attendanceId: attendanceId,
    );
    if (responseData.isRight) {
      return Right(AttendeeAttendancePieChartModel.fromJson(
          SuccessResponse.fromJson(responseData.right).data));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, AttendeeAttendanceAnalyticsModel>>
      attendeeAttndsAnalyticsRequest(
          {required int periodValue, required String periodType}) async {
    var responseData = await attendanceData.attendeeAttendanceAnalyticsRequest(
      periodType: periodType,
      periodValue: periodValue,
    );
    if (responseData.isRight) {
      return Right(AttendeeAttendanceAnalyticsModel.fromJson(
          SuccessResponse.fromJson(responseData.right).data));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, BioFieldsModel>> getAttendanceBioDataRequest(
      {required String attendanceId}) async {
    var responseData = await attendanceData.attendanceBioFieldsDataRequest(
      attendanceId: attendanceId,
    );
    if (responseData.isRight) {
      return Right(BioFieldsModel.fromJson(
          SuccessResponse.fromJson(responseData.right).data));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, HostAttendancesModel>>
      hostAttendancesRequest() async {
    var responseData = await attendanceData.hostAttendancesRequest();
    if (responseData.isRight) {
      return Right(HostAttendancesModel.fromJson(
          SuccessResponse.fromJson(responseData.right).data));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, HostAttendancePieChartModel>>
      hostAttndPieChartRequest({required String attendanceId}) async {
    var responseData = await attendanceData.hostAttendancePieChartRequest(
      attendanceId: attendanceId,
    );
    if (responseData.isRight) {
      return Right(
        HostAttendancePieChartModel.fromJson(
          SuccessResponse.fromJson(responseData.right).data,
        ),
      );
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, HostAttendanceAnalyticsModel>>
      hostAttndsAnalyticsRequest(
          {required int periodValue, required String periodType}) async {
    var responseData = await attendanceData.hostAttendanceAnalyticsRequest(
      periodType: periodType,
      periodValue: periodValue,
    );
    if (responseData.isRight) {
      return Right(
        HostAttendanceAnalyticsModel.fromJson(
          SuccessResponse.fromJson(responseData.right).data,
        ),
      );
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, RecentAttendeeAttendanceModel>>
      recentAttendeeAttendanceRequest() async {
    var responseData = await attendanceData.attendeeRecentAttendanceRequest();
    if (responseData.isRight) {
      return Right(
        RecentAttendeeAttendanceModel.fromJson(
          SuccessResponse.fromJson(responseData.right).data,
        ),
      );
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, RecentHostAttendanceModel>>
      recentHostAttendanceRequest() async {
    var responseData = await attendanceData.hostRecentAttendanceRequest();
    if (responseData.isRight) {
      return Right(
        RecentHostAttendanceModel.fromJson(
          SuccessResponse.fromJson(responseData.right).data,
        ),
      );
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, SuccessResponse>>
      sendAttndConfirmationCodeRequest(
          {required SendConfirmationCodeRequest request}) async {
    var responseData = await attendanceData.sendAttndConfirmationCodeRequest(
      request: request,
    );
    if (responseData.isRight) {
      return Right(
        SuccessResponse.fromJson(
          responseData.right,
        ),
      );
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, SendAttendanceReportModel>>
      sendAttndReportRequest({required SendReportRequest request}) async {
    var responseData = await attendanceData.sendAttndReportToHostRequest(
      request: request,
    );
    if (responseData.isRight) {
      return Right(
        SendAttendanceReportModel.fromJson(
          SuccessResponse.fromJson(responseData.right).data,
        ),
      );
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, TotalAttendanceJoinedModel>>
      totalAttendanceAttendedRequest() async {
    var responseData = await attendanceData.totalAttandanceJoinedRequest();
    if (responseData.isRight) {
      return Right(
        TotalAttendanceJoinedModel.fromJson(
          SuccessResponse.fromJson(responseData.right).data,
        ),
      );
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, TotalAttendanceCreatedModel>>
      totalAttendanceCreatedRequest() async{
    var responseData = await attendanceData.totalAttandanceJoinedRequest();
    if (responseData.isRight) {
      return Right(
        TotalAttendanceCreatedModel.fromJson(
          SuccessResponse.fromJson(responseData.right).data,
        ),
      );
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, SuccessResponse>>
      verifyAttndConfirmationCodeRequest({required VerifyConfirmationCodeRequest request}) async{
    var responseData = await attendanceData.verifyAttndConfirmationCodeRequest(
      request: request,
    );
    if (responseData.isRight) {
      return Right(
        SuccessResponse.fromJson(responseData.right),
        
      );
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, BioFieldsModel>>
      verifyAttendanceCodeRequest() {
    // TODO: implement verifyAttendanceCodeRequest
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureResponse, CreateAttendanceModel>>
      createCircularGeoFenceAttendanceCodeRequest() {
    // TODO: implement createCircularGeoFenceAttendanceCodeRequest
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureResponse, CreateAttendanceModel>>
      createPolygonGeoFenceAttendanceCodeRequest() {
    // TODO: implement createPolygonGeoFenceAttendanceCodeRequest
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureResponse, SuccessResponse>> joinAttendanceCodeRequest() {
    // TODO: implement joinAttendanceCodeRequest
    throw UnimplementedError();
  }
}
