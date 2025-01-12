import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/app/config/appRouterHandler/app_router.dart';
import 'package:geoattend/domain/entity/response/auth/verifiedUserData/verified_user_data_response.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBackButton/app_back_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBodyPadding/app_body_padding_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/networkRequestLoadingOverlay/network_request_loading_overlay_widget.dart';
import 'package:geoattend/presentation/auth/bloc/auth_bloc.dart';
import 'package:geoattend/presentation/auth/bloc/state/auth_state.dart';
import 'package:geoattend/presentation/auth/widgets/login/login_des_widget.dart';
import 'package:geoattend/presentation/auth/widgets/login/login_form_widget.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginViewWidget extends StatefulWidget {
  const LoginViewWidget({
    super.key,
  });

  @override
  State<LoginViewWidget> createState() => _LoginViewWidgetState();
}

class _LoginViewWidgetState extends State<LoginViewWidget> {
  @override
  void initState() {
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
            VerifiedUserDataResponse verifiedUserData =
                state.successfulUserDataStatus!.verifiedUserDataResponse;
            bool accountVerified = verifiedUserData.accountVerified;
            bool deviceVerified = verifiedUserData.deviceVerified;
            if (state.isRequestSuccessful && verifiedUserData.hasUserMigrated
                ? (accountVerified && deviceVerified)
                : true) {
              GeneralFunctions.showBottomSheetSuccessfulMessage(
                context: context,
                requireAnAction: true,
                message: state.successMessage,
                actionBtnLabel: 'Proceed to dashboard',
                functionality: () {
                  context.router.replaceAll([
                    DashboardRoute(
                      successfulUserDataStatus: state.successfulUserDataStatus!,
                    )
                  ]);
                },
              );
            } else {
              if (!accountVerified || !deviceVerified) {
                GeneralFunctions.showBottomSheetSuccessfulMessage(
                  context: context,
                  requireAnAction: !accountVerified || !deviceVerified,
                  actionBtnLabel: 'Proceed to verify',
                  message: !accountVerified
                      ? 'Verify your account'
                      : 'Verify your device',
                  functionality: () {
                    if (!accountVerified) {
                      context.router.replace(
                        AccountVerificationRoute(
                          emailAddress: verifiedUserData.email,
                        ),
                      );
                    }
                  },
                );
              } else {}
            }
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
                LoginDesWidget(),
                AppSpacerWidget(
                  height: 20.0,
                ),
                LoginFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
