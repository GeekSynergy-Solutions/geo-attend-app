import 'dart:async';
// import 'package:uni_links/uni_links.dart';

class AppDeepLink {
  StreamSubscription? _linkSubscription;
  bool _isThereAnyDeepLink = false;
  // PageRouteInfo? _pageRouteInfo;

  AppDeepLink();

  Future<void> init() async {
    try {
      // final initialUri = await getInitialUri();
      // if (initialUri != null && initialUri.host == 'geoattend.com') {
      //   if (initialUri.path == '/reset-password') {
      //     // String token = initialUri.queryParameters['token'] ?? '';
      //     // String email = initialUri.queryParameters['email'] ?? '';
      //     _isThereAnyDeepLink = true;
      //   } else if (initialUri.path == '/login') {
      //     _isThereAnyDeepLink = true;
      //   }
      // }
    } catch (e) {
      _isThereAnyDeepLink = false;
    }
  }

  Future<void> uriChange() async {
    // _linkSubscription = uriLinkStream.listen((Uri? uri) {
    //   if (uri != null && uri.host == 'geoattend.com') {
    //     if (uri.path == '/reset-password') {
    //       // String token = uri.queryParameters['token'] ?? '';
    //       // String email = uri.queryParameters['email'] ?? '';
    //       _isThereAnyDeepLink = true;
    //     } else if (uri.path == '/login') {
    //       _isThereAnyDeepLink = true;
    //     }
    //   }
    // });
  }

  // PageRouteInfo getDeepLinkPageRouteInfo() {
  //   return ;
  // }

  bool isThereAnyActiveDeepLink() {
    return _isThereAnyDeepLink;
  }

  void closeAppDeepLinkSubscription() {
    _linkSubscription?.cancel();
  }
}
