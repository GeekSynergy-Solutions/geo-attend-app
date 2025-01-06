import 'package:either_dart/either.dart';
import 'package:geoattend/data/remote/geoLocation/data/here_geo_location_data.dart';
import 'package:geoattend/data/remote/geoLocation/model/hereGeoLocation/hereLocation/here_location_model.dart';
import 'package:geoattend/domain/entity/response/failure/failure_response.dart';
import 'package:geoattend/domain/repository/geoLocation/here_geo_location_repo_interface.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HereGeoLocationRepoInterface)
class HereGeoLocationRepo implements HereGeoLocationRepoInterface {
  final HereGeoLocationData hereGeoLocationData;

  HereGeoLocationRepo(
    this.hereGeoLocationData,
  );

  @override
  Future<Either<FailureResponse, HereLocationModel>>
      hereAutoCompleteRepoRequest({required String location}) async {
    var responseData = await hereGeoLocationData.hereAutoCompleteRequest(
      location: location,
    );
    if (responseData.isRight) {
      return Right(HereLocationModel.fromJson(responseData.right));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, HereLocationModel>> hereGeoCodeRepoRequest(
      {required String location}) async {
    var responseData = await hereGeoLocationData.hereGeoCodeRequest(
      location: location,
    );
    if (responseData.isRight) {
      return Right(HereLocationModel.fromJson(responseData.right));
    } else {
      return Left(responseData.left);
    }
  }
}
