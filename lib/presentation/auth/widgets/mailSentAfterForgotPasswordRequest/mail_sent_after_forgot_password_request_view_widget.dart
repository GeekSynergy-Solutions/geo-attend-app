import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/app/config/appRouterHandler/app_router.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBackButton/app_back_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBodyPadding/app_body_padding_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/networkRequestLoadingOverlay/network_request_loading_overlay_widget.dart';
import 'package:geoattend/presentation/auth/bloc/auth_bloc.dart';
import 'package:geoattend/presentation/auth/bloc/event/auth_event.dart';
import 'package:geoattend/presentation/auth/bloc/state/auth_state.dart';
import 'package:geoattend/presentation/auth/widgets/mailSentAfterForgotPasswordRequest/mail_sent_after_forgot_password_request_des_widget.dart';
import 'package:geoattend/presentation/auth/widgets/mailSentAfterForgotPasswordRequest/mail_sent_after_forgot_pasword_request_actions_widget.dart';
import 'package:loader_overlay/loader_overlay.dart';

class MailSentAfterForgotPasswordRequestViewWidget extends StatefulWidget {
  final String emailAddress;
  const MailSentAfterForgotPasswordRequestViewWidget({
    super.key,
    required this.emailAddress,
  });

  @override
  State<MailSentAfterForgotPasswordRequestViewWidget> createState() =>
      _MailSentAfterForgotPasswordRequestViewWidgetState();
}

class _MailSentAfterForgotPasswordRequestViewWidgetState
    extends State<MailSentAfterForgotPasswordRequestViewWidget> {
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
                actionBtnLabel: 'Verify OTP',
                message: state.successMessage,
                functionality: () {
                  context.router.replaceAll(
                    [
                      ForgotPasswordAuthCodeRoute(
                        emailAddress: emailAddress,
                      ),
                    ],
                  );
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
                AppBackButtonWidget(
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<AuthBloc>(context).add(
                        RequestForForgotPasswordForAuth(
                          emailAddress: emailAddress,
                        ),
                      );
                    },
                    child: Text(
                      AppStringConstants.resend,
                      style: const TextStyle(
                        color: AppColors.resendColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const AppSpacerWidget(
                  height: 40.0,
                ),
                const Align(
                  alignment: AlignmentDirectional.center,
                  child: MailSentAfterForgotPasswordRequestDesWidget(),
                ),
                const AppSpacerWidget(
                  height: 40.0,
                ),
                MailSentAfterForgotPaswordRequestActionsWidget(
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
