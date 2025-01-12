import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/data/localStorage/flutterSecureStorage/app_flutter_secure_storage.dart';
import 'package:geoattend/data/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:geoattend/data/remote/attendance/model/totalAttendanceCreated/total_attendance_created_model.dart';
import 'package:geoattend/data/remote/attendance/model/totalAttendanceJoined/total_attendance_joined_model.dart';
import 'package:geoattend/domain/entity/response/failure/failure_response.dart';
import 'package:geoattend/domain/repository/attendance/attendance_repo_interface.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/presentation/home/bloc/event/home_event.dart';
import 'package:geoattend/presentation/home/bloc/state/home_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppSharedPreferences appSharedPreferences;
  final AppFlutterSecureStorage secureStorage;
  final AttendanceRepoInterface attendanceRepo;

  HomeBloc(
    this.appSharedPreferences,
    this.secureStorage,
    this.attendanceRepo,
  ) : super(const InitHomeState()) {
    on<SwitchSessionHomeEvent>((event, emit) {
      bool switchToHost = event.switchToHost;
      emit(
        SessionSwitchState(
          toAHost: switchToHost,
        ),
      );
    });
    on<GetTotalAttendanceHomeEvent>((event, emit) async {
      bool actAsBgRequest = event.actAsBgRequest;
      bool asHost = event.asHost;
      emit(
        LoadingHomeState(
          loadingTotalAttnd: actAsBgRequest,
        ),
      );
      if (asHost) {
        Either<FailureResponse, TotalAttendanceCreatedModel>
            hostTotalAttendanceCreated =
            await attendanceRepo.totalAttendanceCreatedRequest();
        if (hostTotalAttendanceCreated.isRight) {
          emit(
            SuccessHomeState.hostTotalAttendance(
              totalAttendanceCreated: hostTotalAttendanceCreated.right,
            ),
          );
        } else {
          FailureResponse hostTotalAttendanceFailedRequest =
              hostTotalAttendanceCreated.left;
          emit(
            FailureHomeState.totalAttendance(
              errorMessage: GeneralFunctions.convertFirstCharToUpperCaseChar(
                  value: hostTotalAttendanceFailedRequest.errorMessage),
              isUnAuthorized: GeneralFunctions.checkIfRequestIsUnauthorized(
                  statusCode: hostTotalAttendanceFailedRequest.statusCode),
            ),
          );
        }
      } else {
        Either<FailureResponse, TotalAttendanceJoinedModel>
            attendeeTotalAttendanceJoined =
            await attendanceRepo.totalAttendanceAttendedRequest();
        if (attendeeTotalAttendanceJoined.isRight) {
          emit(
            SuccessHomeState.attendeeTotalAttendance(
              totalAttendanceJoined: attendeeTotalAttendanceJoined.right,
            ),
          );
        } else {
          FailureResponse attendeeTotalAttendanceFailedRequest =
              attendeeTotalAttendanceJoined.left;
          emit(
            FailureHomeState.totalAttendance(
              errorMessage: GeneralFunctions.convertFirstCharToUpperCaseChar(
                  value: attendeeTotalAttendanceFailedRequest.errorMessage),
              isUnAuthorized: GeneralFunctions.checkIfRequestIsUnauthorized(
                  statusCode: attendeeTotalAttendanceFailedRequest.statusCode),
            ),
          );
        }
      }
    });
  }
}
