import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/infrastructure/di/injection.dart';
import 'package:geoattend/presentation/auth/bloc/auth_bloc.dart';
import 'package:geoattend/presentation/auth/widgets/forgotPasswordAuthCode/forgot_password_auth_code_view_widget.dart';

@RoutePage()
class ForgotPasswordAuthCodePage extends StatelessWidget {
  final String emailAddress;
  const ForgotPasswordAuthCodePage({
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
        child: ForgotPasswordAuthCodeViewWidget(
          emailAddress: emailAddress,
        ),
      ),
    );
  }
}
