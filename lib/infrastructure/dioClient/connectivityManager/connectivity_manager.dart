import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import 'model/connection.dart';

@LazySingleton(as: Connection)
class ConnectivityManager implements Connection {
  ConnectivityManager(this._connectivity);
  final Connectivity _connectivity;

  @override
  Future<bool> isConnectedToAWifi() async {
    var connectivityResult = await (_connectivity.checkConnectivity());
    bool wifiStatus = false;
    for (var resultState in connectivityResult) {
      if (resultState == ConnectivityResult.wifi) {
        wifiStatus = true;
        break;
      }
    }
    return wifiStatus;
  }

  @override
  Future<bool> isConnectedToMobileNetwork() async {
    var connectivityResult = await (_connectivity.checkConnectivity());
    bool mobileStatus = false;
    for (var resultState in connectivityResult) {
      if (resultState == ConnectivityResult.mobile) {
        mobileStatus = true;
        break;
      }
    }
    return mobileStatus;
  }

  @override
  Future<bool> isInternetEnabled() async {
    var connectivityResult = await (_connectivity.checkConnectivity());
    bool internetEnabledStatus = false;
    for (var resultState in connectivityResult) {
      if (resultState != ConnectivityResult.none) {
        internetEnabledStatus = true;
        break;
      }
    }
    return internetEnabledStatus;
  }

  @override
  Future<bool> isConnectedToAnEthernet() async {
    var connectivityResult = await (_connectivity.checkConnectivity());
    bool ethernetStatus = false;
    for (var resultState in connectivityResult) {
      if (resultState == ConnectivityResult.ethernet) {
        ethernetStatus = true;
        break;
      }
    }
    return ethernetStatus;
  }
}
