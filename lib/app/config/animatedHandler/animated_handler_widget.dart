import 'package:flutter/material.dart';

class AnimatedHandlerWidget extends StatelessWidget {
  final Widget child;
  final double opacity;
  final Curve curve;
  const AnimatedHandlerWidget({
    super.key,
    required this.child,
    required this.opacity,
    this.curve = Curves.bounceInOut,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 1),
      curve: curve, // Easing curve for the animation
      opacity: opacity,
      child: child,
    );
  }
}
