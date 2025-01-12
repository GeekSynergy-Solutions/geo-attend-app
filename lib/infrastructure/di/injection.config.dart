// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:geoattend/data/localStorage/flutterSecureStorage/app_flutter_secure_storage.dart'
    as _i538;
import 'package:geoattend/data/localStorage/requestLocalDb/request_user_data.dart'
    as _i896;
import 'package:geoattend/data/localStorage/sharedPreferences/app_shared_preferences.dart'
    as _i889;
import 'package:geoattend/data/remote/attendance/dataProvider/attnd_data.dart'
    as _i522;
import 'package:geoattend/data/remote/attendance/repo/attendance_repo.dart'
    as _i296;
import 'package:geoattend/data/remote/auth/dataProvider/auth_data.dart'
    as _i380;
import 'package:geoattend/data/remote/auth/repo/auth_repo.dart' as _i778;
import 'package:geoattend/data/remote/geoLocation/data/here_geo_location_data.dart'
    as _i593;
import 'package:geoattend/data/remote/geoLocation/repo/here_geo_location_repo.dart'
    as _i739;
import 'package:geoattend/domain/entity/response/failure/failure_response.dart'
    as _i481;
import 'package:geoattend/domain/repository/attendance/attendance_repo_interface.dart'
    as _i593;
import 'package:geoattend/domain/repository/auth/auth_repo_interface.dart'
    as _i747;
import 'package:geoattend/domain/repository/geoLocation/here_geo_location_repo_interface.dart'
    as _i351;
import 'package:geoattend/infrastructure/api/apiRequestHelper/api_request_helper.dart'
    as _i443;
import 'package:geoattend/infrastructure/api/httpClientApiRequestHelper/http_client_api_request_helper.dart'
    as _i223;
import 'package:geoattend/infrastructure/dioClient/connectivityManager/connectivity_manager.dart'
    as _i301;
import 'package:geoattend/infrastructure/dioClient/connectivityManager/model/connection.dart'
    as _i472;
import 'package:geoattend/infrastructure/dioClient/dio_client_module.dart'
    as _i397;
import 'package:geoattend/infrastructure/dioClient/interceptors/authentication_interceptor.dart'
    as _i1045;
import 'package:geoattend/infrastructure/dioClient/interceptors/network_interceptor.dart'
    as _i31;
import 'package:geoattend/infrastructure/httpClient/geo_location_http_client.dart'
    as _i522;
import 'package:geoattend/infrastructure/httpClient/interceptors/geo_location_auth_interceptor.dart'
    as _i555;
import 'package:geoattend/presentation/attendance/bloc/attendance_bloc.dart'
    as _i247;
import 'package:geoattend/presentation/auth/bloc/auth_bloc.dart' as _i644;
import 'package:geoattend/presentation/home/bloc/home_bloc.dart' as _i492;
import 'package:geoattend/presentation/onBoarding/bloc/on_boarding_bloc.dart'
    as _i46;
import 'package:geoattend/presentation/splash/bloc/splash_bloc.dart' as _i304;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http_interceptor/http/intercepted_client.dart' as _i1035;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioClientModule = _$DioClientModule();
    final geoLocationHttpClient = _$GeoLocationHttpClient();
    gh.factory<_i538.AppFlutterSecureStorage>(
        () => _i538.AppFlutterSecureStorage());
    gh.factory<_i889.AppSharedPreferences>(() => _i889.AppSharedPreferences());
    gh.factory<_i895.Connectivity>(() => dioClientModule.connectivity);
    gh.lazySingleton<_i361.Dio>(() => dioClientModule.dioClient);
    gh.lazySingleton<_i1035.InterceptedClient>(
        () => geoLocationHttpClient.httpClient);
    gh.lazySingleton<_i555.GeoLocationAuthInterceptor>(
        () => _i555.GeoLocationAuthInterceptor());
    gh.factory<_i223.HttpClientApiRequestHelper>(
        () => _i223.HttpClientApiRequestHelper(gh<_i1035.InterceptedClient>()));
    gh.lazySingleton<_i1045.AuthenticationInterceptor>(
        () => _i1045.AuthenticationInterceptor(
              gh<_i889.AppSharedPreferences>(),
              gh<_i538.AppFlutterSecureStorage>(),
            ));
    gh.factory<_i593.HereGeoLocationData>(() =>
        _i593.HereGeoLocationData(gh<_i223.HttpClientApiRequestHelper>()));
    gh.factory<_i896.RequestUserData>(
        () => _i896.RequestUserData(gh<_i889.AppSharedPreferences>()));
    gh.factory<_i481.RetrieveFailedResponseClass>(() =>
        _i481.RetrieveFailedResponseClass(gh<_i889.AppSharedPreferences>()));
    gh.lazySingleton<_i472.Connection>(
        () => _i301.ConnectivityManager(gh<_i895.Connectivity>()));
    gh.factory<_i351.HereGeoLocationRepoInterface>(
        () => _i739.HereGeoLocationRepo(gh<_i593.HereGeoLocationData>()));
    gh.factory<_i304.SplashBloc>(() => _i304.SplashBloc(
          gh<_i889.AppSharedPreferences>(),
          gh<_i896.RequestUserData>(),
        ));
    gh.lazySingleton<_i31.NetworkInterceptor>(
        () => _i31.NetworkInterceptor(gh<_i472.Connection>()));
    gh.factory<_i443.ApiRequestHelper>(() => _i443.ApiRequestHelper(
          gh<_i895.Connectivity>(),
          gh<_i361.Dio>(),
          gh<_i481.RetrieveFailedResponseClass>(),
        ));
    gh.factory<_i522.AttndData>(
        () => _i522.AttndData(gh<_i443.ApiRequestHelper>()));
    gh.factory<_i380.AuthData>(
        () => _i380.AuthData(gh<_i443.ApiRequestHelper>()));
    gh.factory<_i593.AttendanceRepoInterface>(
        () => _i296.AttendanceRepo(gh<_i522.AttndData>()));
    gh.factory<_i747.AuthRepoInterface>(
        () => _i778.AuthRepo(gh<_i380.AuthData>()));
    gh.factory<_i492.HomeBloc>(() => _i492.HomeBloc(
          gh<_i889.AppSharedPreferences>(),
          gh<_i538.AppFlutterSecureStorage>(),
          gh<_i593.AttendanceRepoInterface>(),
        ));
    gh.factory<_i644.AuthBloc>(() => _i644.AuthBloc(
          gh<_i889.AppSharedPreferences>(),
          gh<_i538.AppFlutterSecureStorage>(),
          gh<_i747.AuthRepoInterface>(),
          gh<_i896.RequestUserData>(),
        ));
    gh.factory<_i247.AttendanceBloc>(() => _i247.AttendanceBloc(
          gh<_i889.AppSharedPreferences>(),
          gh<_i538.AppFlutterSecureStorage>(),
          gh<_i351.HereGeoLocationRepoInterface>(),
          gh<_i593.AttendanceRepoInterface>(),
        ));
    gh.factory<_i46.OnBoardingBloc>(() => _i46.OnBoardingBloc(
          gh<_i889.AppSharedPreferences>(),
          gh<_i538.AppFlutterSecureStorage>(),
          gh<_i747.AuthRepoInterface>(),
          gh<_i896.RequestUserData>(),
        ));
    return this;
  }
}

class _$DioClientModule extends _i397.DioClientModule {}

class _$GeoLocationHttpClient extends _i522.GeoLocationHttpClient {}
