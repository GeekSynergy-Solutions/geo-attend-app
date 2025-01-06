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
import 'package:geoattend/presentation/auth/widgets/resetPassword/reset_password_des_widget.dart';
import 'package:geoattend/presentation/auth/widgets/resetPassword/reset_pasword_form_widget.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ResetPasswordViewWidget extends StatefulWidget {
  final String token;
  final String emailAddress;
  const ResetPasswordViewWidget({
    super.key,
    required this.token,
    required this.emailAddress,
  });

  @override
  State<ResetPasswordViewWidget> createState() =>
      _ResetPasswordViewWidgetState();
}

class _ResetPasswordViewWidgetState extends State<ResetPasswordViewWidget> {
  late String token;
  late String emailAddress;

  @override
  void initState() {
    token = widget.token;
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
                actionBtnLabel: 'Proceed to login',
                message: state.successMessage,
                functionality: () {
                  context.router.replace(
                    const WelcomeBackRoute(),
                  );
                },
              );
            } else {
              GeneralFunctions.showErrorMessage(
                context: context,
                errorMessage: state.successMessage,
                okayFunctionality: () {
                  Navigator.pop(context);
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
                const ResetPasswordDesWidget(),
                const AppSpacerWidget(
                  height: 20.0,
                ),
                ResetPaswordFormWidget(
                  token: token,
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
