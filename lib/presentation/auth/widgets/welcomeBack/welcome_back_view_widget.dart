import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/app/config/appRouterHandler/app_router.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBackButton/app_back_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBodyPadding/app_body_padding_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/networkRequestLoadingOverlay/network_request_loading_overlay_widget.dart';
import 'package:geoattend/presentation/auth/bloc/auth_bloc.dart';
import 'package:geoattend/presentation/auth/bloc/state/auth_state.dart';
import 'package:geoattend/presentation/auth/widgets/welcomeBack/welcome_back_des_widget.dart';
import 'package:geoattend/presentation/auth/widgets/welcomeBack/welcome_back_form_widget.dart';
import 'package:loader_overlay/loader_overlay.dart';

class WelcomeBackViewWidget extends StatefulWidget {
  const WelcomeBackViewWidget({super.key});

  @override
  State<WelcomeBackViewWidget> createState() => _WelcomeBackViewWidgetState();
}

class _WelcomeBackViewWidgetState extends State<WelcomeBackViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoadingAuthState) {
            context.loaderOverlay.show();
          }

          if (state is SuccessAuthState || state is FailureAuthState) {
            context.loaderOverlay.hide();
          }

          if (state is SuccessAuthState) {
            // GeneralFunctions.snackBarMessage(
            //   context: context,
            //   message: state.successMessage,
            //   successMessage: state.isRequestSuccessful,
            // );
            context.router
                .replace(LoginPasswordRoute(emailAddress: state.emailAddress!));
          }
        },
        child: const NetworkRequestLoadingOverlayWidget(
          child: AppBodyPaddingWidget(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 50.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBackButtonWidget(),
                AppSpacerWidget(
                  height: 20.0,
                ),
                WelcomeBackDesWidget(),
                AppSpacerWidget(
                  height: 20.0,
                ),
                WelcomeBackFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
