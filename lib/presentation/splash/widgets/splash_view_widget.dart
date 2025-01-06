import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/app/config/appRouterHandler/app_router.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/presentation/splash/bloc/event/splash_event.dart';
import 'package:geoattend/presentation/splash/bloc/splash_bloc.dart';
import 'package:geoattend/presentation/splash/bloc/state/splash_state.dart';
import 'package:geoattend/presentation/splash/widgets/splash_app_logo_widget.dart';
import 'package:geoattend/presentation/splash/widgets/splash_app_name_widget.dart';

class SplashViewWidget extends StatefulWidget {
  const SplashViewWidget({super.key});

  @override
  State<SplashViewWidget> createState() => _SplashViewWidgetState();
}

class _SplashViewWidgetState extends State<SplashViewWidget>
    with TickerProviderStateMixin {
  late AnimationController appLogoController;
  late AnimationController appNameController;
  late Animation<double> appLogo;
  late Animation<double> appName;

  @override
  void initState() {
    appLogoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();

    appLogo = Tween<double>(begin: -1.0, end: 0.5).animate(
      CurvedAnimation(parent: appLogoController, curve: Curves.easeInOut),
    );

    appNameController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    appName = Tween<double>(begin: -1.0, end: 0.34).animate(
      CurvedAnimation(parent: appNameController, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(seconds: 3), () {
      appNameController.forward().then((value) {
        BlocProvider.of<SplashBloc>(context).add(
          InitEvent(
            context: context,
          ),
        );
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = GeneralFunctions.getDeviceSize(context: context);

    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is RoutingState) {
            if (state.proceedToDashboard) {
              // context.router.replace(const OnBoardingRoute());
              context.router.replace(DashboardRoute(
                  successfulUserDataStatus: state.successfulUserDataStatus!));
            } else if (state.proceedToGetStarted) {
              context.router.replace(const GetStartedRoute());
              // context.router.replace(const OnBoardingRoute());
            } else if (state.proceedToOnBoarding) {
              context.router.replace(const OnBoardingRoute());
            }
          }
        },
        child: Container(
          height: size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppImagePath.splashPageBgPng,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: appLogoController,
                builder: (context, child) {
                  return Positioned(
                    bottom: MediaQuery.of(context).size.height * appLogo.value,
                    left: 0,
                    right: 0,
                    child: child!,
                  );
                },
                child: const SplashAppLogoWidget(),
              ),
              AnimatedBuilder(
                animation: appNameController,
                builder: (context, child) {
                  return Positioned(
                    left: MediaQuery.of(context).size.width * appName.value,
                    bottom: 0,
                    top: GeneralFunctions.isPlatformIOS ? 15 : 10,
                    child: child!,
                  );
                },
                child: const SplashAppNameWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
