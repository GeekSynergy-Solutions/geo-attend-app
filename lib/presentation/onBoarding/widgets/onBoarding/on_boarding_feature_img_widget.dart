import 'package:flutter/material.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';

class OnBoardingFeatureImgWidget extends StatefulWidget {
  final String featureImgPath;
  const OnBoardingFeatureImgWidget({
    super.key,
    required this.featureImgPath,
  });

  @override
  State<OnBoardingFeatureImgWidget> createState() =>
      _OnBoardingFeatureImgWidgetState();
}

class _OnBoardingFeatureImgWidgetState extends State<OnBoardingFeatureImgWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: false);

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GeneralFunctions.getDeviceSize(context: context).height * 0.5,
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 40.0,
      ),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value, // Apply scaling effect (zoom in/out)
            child: child,
          );
        },
        child: Center(
          child: Image.asset(
            widget.featureImgPath,
          ),
        ),
      ),
    );
  }
}
