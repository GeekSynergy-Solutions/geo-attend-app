import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/app/config/appRouterHandler/app_router.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBackButton/app_back_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBodyPadding/app_body_padding_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/networkRequestLoadingOverlay/network_request_loading_overlay_widget.dart';
import 'package:geoattend/presentation/auth/bloc/auth_bloc.dart';
import 'package:geoattend/presentation/auth/bloc/state/auth_state.dart';
import 'package:geoattend/presentation/auth/widgets/loginPassword/login_password_des_widget.dart';
import 'package:geoattend/presentation/auth/widgets/loginPassword/login_password_form_widget.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginPasswordViewWidget extends StatefulWidget {
  final String emailAddress;
  const LoginPasswordViewWidget({
    super.key,
    required this.emailAddress,
  });

  @override
  State<LoginPasswordViewWidget> createState() =>
      _LoginPasswordViewWidgetState();
}

class _LoginPasswordViewWidgetState extends State<LoginPasswordViewWidget> {
  late String emailAddress;

  @override
  void initState() {
    emailAddress = widget.emailAddress;
    super.initState();
  }

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
            if (state.isRequestSuccessful) {
              GeneralFunctions.showBottomSheetSuccessfulMessage(
                context: context,
                requireAnAction: true,
                actionBtnLabel: 'Proceed to dashboard',
                functionality: () {
                  context.router.replaceAll([
                    DashboardRoute(
                      successfulUserDataStatus: state.successfulUserDataStatus!,
                    )
                  ]);
                },
              );
            }
          }
        },
        child: NetworkRequestLoadingOverlayWidget(
          child: AppBodyPaddingWidget(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 50.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBackButtonWidget(),
                const AppSpacerWidget(
                  height: 20.0,
                ),
                const LoginPasswordDesWidget(),
                const AppSpacerWidget(
                  height: 20.0,
                ),
                LoginPasswordFormWidget(
                  emailAddress: emailAddress,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
