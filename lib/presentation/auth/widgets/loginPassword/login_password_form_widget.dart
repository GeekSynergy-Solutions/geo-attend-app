import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/app/config/appRouterHandler/app_router.dart';
import 'package:geoattend/domain/entity/errorFieldData/authFieldValidation/auth_field_validation.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appButton/app_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appTextField/app_text_field_widget.dart';
import 'package:geoattend/presentation/auth/bloc/auth_bloc.dart';
import 'package:geoattend/presentation/auth/bloc/event/auth_event.dart';
import 'package:geoattend/presentation/auth/bloc/state/auth_state.dart';

class LoginPasswordFormWidget extends StatefulWidget {
  final String emailAddress;
  const LoginPasswordFormWidget({
    super.key,
    required this.emailAddress,
  });

  @override
  State<LoginPasswordFormWidget> createState() =>
      _LoginPasswordFormWidgetState();
}

class _LoginPasswordFormWidgetState extends State<LoginPasswordFormWidget> {
  final TextEditingController passwordController = TextEditingController();

  late String emailAddress;

  bool isRequestInProgress = false;

  bool passwordVisibility = false;

  bool isPasswordFieldEmpty = false;

  final formKey = GlobalKey<FormState>();

  AuthFieldValidation authFieldValidationStatus = AuthFieldValidation(
    isPasswordValid: true,
  );

  @override
  void initState() {
    emailAddress = widget.emailAddress;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ValidationAuthState) {
          setState(() {
            if (state.authFieldValidation != null) {
              authFieldValidationStatus = state.authFieldValidation!;
            }
          });
        }

        if (state is FailureAuthState) {
          setState(() {
            authFieldValidationStatus = state.authFieldValidation;
          });
          if (!state.isRequestSuccessful) {
            GeneralFunctions.showErrorMessage(
              context: context,
              errorMessage: state.errorMessage,
              okayFunctionality: () {
                Navigator.pop(context);
              },
            );
          }
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextFieldWidget(
              controller: passwordController,
              enabled: !isRequestInProgress,
              errorText: !authFieldValidationStatus.isPasswordValid
                  ? AppStringConstants.passwordFieldError
                  : null,
              hintText: AppStringConstants.passwordHint,
              isThereAnError: !authFieldValidationStatus.isPasswordValid,
              keyboardType: TextInputType.text,
              title: AppStringConstants.passwordLabel,
              obscureText: passwordVisibility,
              maxLines: 1,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    passwordVisibility = !passwordVisibility;
                  });
                },
                icon: Icon(
                  passwordVisibility
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  isPasswordFieldEmpty = value.isEmpty;
                });
              },
            ),
            const AppSpacerWidget(
              height: 10.0,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppStringConstants.forgotYourPassword,
                    style: const TextStyle(
                      color: AppColors.textLighterColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: AppStringConstants.reset,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.router
                            .replace(const RequestForgotPasswordRoute());
                      },
                    style: const TextStyle(
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            const AppSpacerWidget(
              height: 20.0,
            ),
            AppButtonWidget(
              appButtonFunctionality: () {
                if (!isPasswordFieldEmpty) {
                  BlocProvider.of<AuthBloc>(context).add(
                    LoginAuthEvent(
                      emailAddress: emailAddress,
                      password: passwordController.text,
                    ),
                  );
                }
              },
              decoration: BoxDecoration(
                color: isPasswordFieldEmpty
                    ? AppColors.inActiveButtonBgColor
                    : AppColors.activeButtonBgColor,
                borderRadius: BorderRadius.circular(25.0),
              ),
              height: 50.0,
              child: Center(
                child: Text(
                  AppStringConstants.login,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
