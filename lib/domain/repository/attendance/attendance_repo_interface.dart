import 'package:either_dart/either.dart';
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

abstract class AttendanceRepoInterface {
  Future<Either<FailureResponse, SuccessResponse>> createAttendanceRepoRequest(
      {required AttndCreateRequest request});

  Future<Either<FailureResponse, BioFieldsModel>> verifyAttendanceCodeRequest();

  Future<Either<FailureResponse, SuccessResponse>> joinAttendanceCodeRequest();

  Future<Either<FailureResponse, CreateAttendanceModel>>
      createCircularGeoFenceAttendanceCodeRequest();

  Future<Either<FailureResponse, CreateAttendanceModel>>
      createPolygonGeoFenceAttendanceCodeRequest();

  Future<Either<FailureResponse, BioFieldsModel>> getAttendanceBioDataRequest({
    required String attendanceId,
  });

  Future<Either<FailureResponse, GeoFenceModel>>
      attendanceGeoFenceTypesRequest();

  Future<Either<FailureResponse, RecurringModeModel>>
      attendanceRecurringModesRequest();

  Future<Either<FailureResponse, AttendeeAttendanceAnalyticsModel>>
      attendeeAttndsAnalyticsRequest(
          {required int periodValue, required String periodType});

  Future<Either<FailureResponse, AttendeeAttendancePieChartModel>>
      attendeeAttndPieChartRequest({required String attendanceId});

  Future<Either<FailureResponse, AttendeeAttendancesModel>>
      attendeeAttendancesRequest();

  Future<Either<FailureResponse, RecentAttendeeAttendanceModel>>
      recentAttendeeAttendanceRequest();

  Future<Either<FailureResponse, HostAttendanceAnalyticsModel>>
      hostAttndsAnalyticsRequest(
          {required int periodValue, required String periodType});

  Future<Either<FailureResponse, HostAttendancePieChartModel>>
      hostAttndPieChartRequest({required String attendanceId});

  Future<Either<FailureResponse, HostAttendancesModel>>
      hostAttendancesRequest();

  Future<Either<FailureResponse, RecentHostAttendanceModel>>
      recentHostAttendanceRequest();

  Future<Either<FailureResponse, SuccessResponse>>
      sendAttndConfirmationCodeRequest(
          {required SendConfirmationCodeRequest request});

  Future<Either<FailureResponse, SuccessResponse>>
      verifyAttndConfirmationCodeRequest({required VerifyConfirmationCodeRequest request});

  Future<Either<FailureResponse, SendAttendanceReportModel>>
      sendAttndReportRequest({required SendReportRequest request});

  Future<Either<FailureResponse, TotalAttendanceJoinedModel>>
      totalAttendanceAttendedRequest();

  Future<Either<FailureResponse, TotalAttendanceCreatedModel>>
      totalAttendanceCreatedRequest();
}
