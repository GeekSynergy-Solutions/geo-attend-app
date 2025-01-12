import 'package:geoattend/domain/entity/request/attendance/confirmationCode/send/send_confirmation_code_request.dart';
import 'package:geoattend/domain/entity/request/attendance/confirmationCode/verify/verify_confirmation_code_request.dart';
import 'package:geoattend/domain/entity/request/attendance/create/attndCreate/attnd_create_request.dart';
import 'package:geoattend/domain/entity/request/attendance/sendReport/send_report_request.dart';
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
      APIEndPoints.createCircularGeoFenceAttendanceEndPoint,
      isDataRequired: true,
      isRequestAuthorized: true,
      jsonData: request.toJson(),
    );
    return createAttndRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> createCircularGeoFenceAttndRequest(
      {required AttndCreateRequest request}) async {
    Either<FailureResponse, Map<String, dynamic>> createAttndRequestResponse =
        await apiRequestHelper.postRequest(
      APIEndPoints.createCircularGeoFenceAttendanceEndPoint,
      isDataRequired: true,
      isRequestAuthorized: true,
      jsonData: request.toJson(),
    );
    return createAttndRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> createPolygonGeoFenceAttndRequest(
      {required AttndCreateRequest request}) async {
    Either<FailureResponse, Map<String, dynamic>> createAttndRequestResponse =
        await apiRequestHelper.postRequest(
      APIEndPoints.createPolygonGeoFenceAttendanceEndPoint,
      isDataRequired: true,
      isRequestAuthorized: true,
      jsonData: request.toJson(),
    );
    return createAttndRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      attendanceBioFieldsDataRequest({
    required String attendanceId,
  }) async {
    Either<FailureResponse, Map<String, dynamic>> bioDataRequestResponse =
        await apiRequestHelper.getRequest(
      '${APIEndPoints.attendanceBioDataEndPoint}?attendanceId=$attendanceId',
      isRequestAuthorized: true,
    );
    return bioDataRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      attendanceGeoFenceTypesRequest() async {
    Either<FailureResponse, Map<String, dynamic>> attndGeoFenceRequestResponse =
        await apiRequestHelper.getRequest(
      APIEndPoints.attendanceGeoFenceEndPoint,
      isRequestAuthorized: true,
    );
    return attndGeoFenceRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      attendanceRecurringModesRequest() async {
    Either<FailureResponse, Map<String, dynamic>>
        attndRecurringModesRequestResponse = await apiRequestHelper.getRequest(
      APIEndPoints.attendanceRecurringModesEndPoint,
      isRequestAuthorized: true,
    );
    return attndRecurringModesRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      attendeeAttendanceAnalyticsRequest(
          {required int periodValue, required String periodType}) async {
    Either<FailureResponse, Map<String, dynamic>>
        attendeeAttndAnalyticsRequestResponse =
        await apiRequestHelper.getRequest(
      '${APIEndPoints.attendeeAttendanceAnalyticsEndPoint}?periodType=$periodType&periodValue=$periodValue',
      isRequestAuthorized: true,
    );
    return attendeeAttndAnalyticsRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      attendeeAttendancePieChartRequest({required String attendanceId}) async {
    Either<FailureResponse, Map<String, dynamic>>
        attendeeAttndPieChartRequestResponse =
        await apiRequestHelper.getRequest(
      '${APIEndPoints.attendeeAttendancePieChartEndPoint}?attendanceId=$attendanceId',
      isRequestAuthorized: true,
    );
    return attendeeAttndPieChartRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      attendeeAttendancesRequest() async {
    Either<FailureResponse, Map<String, dynamic>>
        attendeeAttndsRequestResponse = await apiRequestHelper.getRequest(
      APIEndPoints.attendeeAttendancesEndPoint,
      isRequestAuthorized: true,
    );
    return attendeeAttndsRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      attendeeRecentAttendanceRequest() async {
    Either<FailureResponse, Map<String, dynamic>>
        attendeeRecentAttndRequestResponse = await apiRequestHelper.getRequest(
      APIEndPoints.recentAttendeeAttendanceEndPoint,
      isRequestAuthorized: true,
    );
    return attendeeRecentAttndRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      hostAttendanceAnalyticsRequest(
          {required int periodValue, required String periodType}) async {
    Either<FailureResponse, Map<String, dynamic>>
        hostAttndAnalyticsRequestResponse = await apiRequestHelper.getRequest(
      '${APIEndPoints.hostAttendanceAnalyticsEndPoint}?periodType=$periodType&periodValue=$periodValue',
      isRequestAuthorized: true,
    );
    return hostAttndAnalyticsRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      hostAttendancePieChartRequest({required String attendanceId}) async {
    Either<FailureResponse, Map<String, dynamic>>
        hostAttndPieChartRequestResponse = await apiRequestHelper.getRequest(
      '${APIEndPoints.hostAttendancePieChartEndPoint}?attendanceId=$attendanceId',
      isRequestAuthorized: true,
    );
    return hostAttndPieChartRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      hostAttendancesRequest() async {
    Either<FailureResponse, Map<String, dynamic>> hostAttndsRequestResponse =
        await apiRequestHelper.getRequest(
      APIEndPoints.hostAttendancesEndPoint,
      isRequestAuthorized: true,
    );
    return hostAttndsRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      hostRecentAttendanceRequest() async {
    Either<FailureResponse, Map<String, dynamic>>
        hostRecentAttndRequestResponse = await apiRequestHelper.getRequest(
      APIEndPoints.recentHostAttendanceEndPoint,
      isRequestAuthorized: true,
    );
    return hostRecentAttndRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      sendAttndConfirmationCodeRequest(
          {required SendConfirmationCodeRequest request}) async {
    Either<FailureResponse, Map<String, dynamic>>
        sendAttndConfirmationCodeRequestResponse =
        await apiRequestHelper.postRequest(
      APIEndPoints.sendAttendanceConfirmationCodeEndPoint,
      isDataRequired: true,
      jsonData: request.toJson(),
      isRequestAuthorized: true,
    );
    return sendAttndConfirmationCodeRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      verifyAttndConfirmationCodeRequest(
          {required VerifyConfirmationCodeRequest request}) async {
    Either<FailureResponse, Map<String, dynamic>>
        verifyConfirmationCodeRequestResponse =
        await apiRequestHelper.postRequest(
      APIEndPoints.verifyAttendanceConfirmationCodeEndPoint,
      isDataRequired: true,
      jsonData: request.toJson(),
      isRequestAuthorized: true,
    );
    return verifyConfirmationCodeRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      sendAttndReportToHostRequest(
          {required SendReportRequest request}) async {
    Either<FailureResponse, Map<String, dynamic>>
        sendAttndReportRequestResponse = await apiRequestHelper.postRequest(
      APIEndPoints.sendAttendanceReportToHostEndPoint,
      isDataRequired: true,
      jsonData: request.toJson(),
      isRequestAuthorized: true,
    );
    return sendAttndReportRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      totalAttandanceHostedRequest() async {
    Either<FailureResponse, Map<String, dynamic>>
        totalAttndsCreatedRequestResponse = await apiRequestHelper.getRequest(
      APIEndPoints.totalAttendanceCreatedEndPoint,
      isRequestAuthorized: true,
    );
    return totalAttndsCreatedRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      totalAttandanceJoinedRequest() async {
    Either<FailureResponse, Map<String, dynamic>>
        totalAttndsJoinedRequestResponse = await apiRequestHelper.getRequest(
      APIEndPoints.totalAttendanceAttendedEndPoint,
      isRequestAuthorized: true,
    );
    return totalAttndsJoinedRequestResponse;
  }
}
