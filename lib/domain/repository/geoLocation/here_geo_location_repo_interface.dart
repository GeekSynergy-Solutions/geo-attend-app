import 'package:either_dart/either.dart';
import 'package:geoattend/data/remote/geoLocation/model/hereGeoLocation/hereLocation/here_location_model.dart';
import 'package:geoattend/domain/entity/response/failure/failure_response.dart';

abstract class HereGeoLocationRepoInterface {
  Future<Either<FailureResponse, HereLocationModel>>
      hereAutoCompleteRepoRequest({required String location});
  Future<Either<FailureResponse, HereLocationModel>> hereGeoCodeRepoRequest(
      {required String location});
}
