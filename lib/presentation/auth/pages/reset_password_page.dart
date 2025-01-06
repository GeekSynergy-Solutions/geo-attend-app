import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/infrastructure/di/injection.dart';
import 'package:geoattend/presentation/auth/bloc/auth_bloc.dart';
import 'package:geoattend/presentation/auth/widgets/resetPassword/reset_password_view_widget.dart';

@RoutePage()
class ResetPasswordPage extends StatelessWidget {
  final String token;
  final String emailAddress;
  const ResetPasswordPage({
    super.key,
    required this.token,
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
        child: ResetPasswordViewWidget(
          token: token,
          emailAddress: emailAddress,
        ),
      ),
    );
  }
}
