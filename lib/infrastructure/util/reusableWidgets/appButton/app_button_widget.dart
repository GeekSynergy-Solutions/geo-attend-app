import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  final VoidCallback appButtonFunctionality;
  final Widget child;
  final double height;
  final double? width;
  final BoxDecoration decoration;
  const AppButtonWidget({
    super.key,
    required this.appButtonFunctionality,
    required this.child,
    required this.decoration,
    required this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: appButtonFunctionality,
      child: Container(
        height: height,
        width: width ?? double.infinity,
        decoration: decoration,
        child: child,
      ),
    );
  }
}
