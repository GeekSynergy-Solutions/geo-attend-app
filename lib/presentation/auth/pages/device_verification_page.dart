import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/infrastructure/di/injection.dart';
import 'package:geoattend/presentation/auth/bloc/auth_bloc.dart';
import 'package:geoattend/presentation/auth/widgets/accountVerification/account_verification_view_widget.dart';

@RoutePage()
class DeviceVerificationPage extends StatelessWidget {
  final String emailAddress;
  const DeviceVerificationPage({
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
        child: AccountVerificationViewWidget(
          emailAddress: emailAddress,
        ),
      ),
    );
  }
}
