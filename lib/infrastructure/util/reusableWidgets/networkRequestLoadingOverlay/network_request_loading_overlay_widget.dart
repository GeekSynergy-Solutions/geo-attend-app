import 'package:flutter/material.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';
import 'package:loader_overlay/loader_overlay.dart';

class NetworkRequestLoadingOverlayWidget extends StatefulWidget {
  final Widget child;
  const NetworkRequestLoadingOverlayWidget({
    super.key,
    required this.child,
  });

  @override
  State<NetworkRequestLoadingOverlayWidget> createState() =>
      _NetworkRequestLoadingOverlayWidgetState();
}

class _NetworkRequestLoadingOverlayWidgetState
    extends State<NetworkRequestLoadingOverlayWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      disableBackButton: true,
      overlayWholeScreen: true,
      overlayColor: AppColors.overlayColor.withOpacity(
        0.8,
      ),
      overlayWidgetBuilder: (progress) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: child,
            );
          },
          child: Center(
            child: Image.asset(
              AppImagePath.appLogoPng,
            ),
          ),
        );
      },
      child: widget.child,
    );
  }
}
