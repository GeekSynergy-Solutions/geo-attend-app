import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/infrastructure/di/injection.dart';
import 'package:geoattend/presentation/splash/bloc/splash_bloc.dart';
import 'package:geoattend/presentation/splash/widgets/splash_view_widget.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      top: false,
      right: false,
      child: BlocProvider(
        create: (context) => getIt<SplashBloc>(),
        child: const SplashViewWidget(),
      ),
    );
  }
}
