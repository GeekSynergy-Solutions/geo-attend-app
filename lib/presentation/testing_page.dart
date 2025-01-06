import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TestingPage extends StatelessWidget {
  const TestingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      top: false,
      right: false,
      child: Scaffold(
        body: Container(
          alignment: AlignmentDirectional.center,
          child: const Text('Hello'),
        ),
      ),
    );
  }
}
