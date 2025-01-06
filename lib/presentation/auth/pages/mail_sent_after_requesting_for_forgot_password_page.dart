import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/infrastructure/di/injection.dart';
import 'package:geoattend/presentation/auth/bloc/auth_bloc.dart';
import 'package:geoattend/presentation/auth/widgets/mailSentAfterForgotPasswordRequest/mail_sent_after_forgot_password_request_view_widget.dart';

@RoutePage()
class MailSentAfterRequestingForForgotPasswordPage extends StatelessWidget {
  final String emailAddress;
  const MailSentAfterRequestingForForgotPasswordPage({
    super.key,
    required this.emailAddress,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: MailSentAfterForgotPasswordRequestViewWidget(
          emailAddress: emailAddress,
        ),
      ),
    );
  }
}
