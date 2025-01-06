import 'package:flutter/material.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:loader_overlay/loader_overlay.dart';

class NetworkRequestLoadingOverlayWidget extends StatelessWidget {
  final Widget child;
  const NetworkRequestLoadingOverlayWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      disableBackButton: true,
      overlayWholeScreen: true,
      overlayColor: AppColors.overlayColor.withOpacity(
        0.8,
      ),
      overlayWidgetBuilder: (progress) {
        return Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              backgroundColor: AppColors.preLoaderBgColor.withOpacity(0.7),
              color: AppColors.preLoaderValueColor,
            ),
          ),
        );
      },
      child: child,
    );
  }
}
