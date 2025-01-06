import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/domain/entity/errorFieldData/authFieldValidation/auth_field_validation.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appButton/app_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appTextField/app_text_field_widget.dart';
import 'package:geoattend/presentation/auth/bloc/auth_bloc.dart';
import 'package:geoattend/presentation/auth/bloc/event/auth_event.dart';
import 'package:geoattend/presentation/auth/bloc/state/auth_state.dart';
import 'package:geoattend/presentation/auth/widgets/passwordStrengthIndicator/password_strength_indicator_widget.dart';

class ResetPaswordFormWidget extends StatefulWidget {
  final String token;
  final String emailAddress;
  const ResetPaswordFormWidget({
    super.key,
    required this.token,
    required this.emailAddress,
  });

  @override
  State<ResetPaswordFormWidget> createState() => _ResetPaswordFormWidgetState();
}

class _ResetPaswordFormWidgetState extends State<ResetPaswordFormWidget> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isRequestInProgress = false;

  bool confirmPasswordVisibility = false;
  bool passwordVisibility = false;

  final formKey = GlobalKey<FormState>();

  late String token;
  late String emailAddress;

  AuthFieldValidation authFieldValidationStatus = AuthFieldValidation(
    isPasswordMismatched: false,
    isPasswordValid: true,
    isConfirmPasswordValid: true,
  );

  @override
  void initState() {
    token = widget.token;
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
          GeneralFunctions.snackBarMessage(
            context: context,
            message: state.errorMessage,
            successMessage: state.isRequestSuccessful,
          );
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
              hintText: AppStringConstants.retypePasswordHint,
              isThereAnError: !authFieldValidationStatus.isPasswordValid,
              increaseBy: !authFieldValidationStatus.isPasswordValid ? 2 : 1,
              keyboardType: TextInputType.text,
              title: AppStringConstants.newPasswordLabel,
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
                BlocProvider.of<AuthBloc>(context).add(
                  ValidateGivenPasswordEvent(
                    password: value,
                  ),
                );
              },
            ),
            if (!authFieldValidationStatus.isPasswordValid)
              PasswordStrengthIndicatorWidget(
                password: passwordController.text,
              ),
            AppTextFieldWidget(
              controller: confirmPasswordController,
              enabled: !isRequestInProgress,
              errorText: authFieldValidationStatus.isConfirmPasswordValid
                  ? authFieldValidationStatus.isPasswordMismatched
                      ? AppStringConstants.passwordMisMatchError
                      : null
                  : AppStringConstants.confirmPasswordError,
              hintText: AppStringConstants.retypePasswordHint,
              isThereAnError: authFieldValidationStatus.isPasswordMismatched ||
                  !authFieldValidationStatus.isConfirmPasswordValid,
              keyboardType: TextInputType.text,
              title: AppStringConstants.retypePasswordLabel,
              obscureText: confirmPasswordVisibility,
              maxLines: 1,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    confirmPasswordVisibility = !confirmPasswordVisibility;
                  });
                },
                icon: Icon(
                  confirmPasswordVisibility
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
              onChanged: (value) {
                BlocProvider.of<AuthBloc>(context).add(
                  ConfirmPasswordsForAuth(
                    password: passwordController.text,
                    confirmPassword: confirmPasswordController.text,
                  ),
                );
              },
            ),
            const AppSpacerWidget(
              height: 40.0,
            ),
            AppButtonWidget(
              appButtonFunctionality: () {
                if (authFieldValidationStatus.isPasswordValid &&
                    authFieldValidationStatus.isConfirmPasswordValid &&
                    !authFieldValidationStatus.isPasswordMismatched) {
                  BlocProvider.of<AuthBloc>(context).add(
                    ResetPasswordForAuth(
                      password: passwordController.text,
                      confirmPassword: confirmPasswordController.text,
                      emailAddress: emailAddress,
                      token: token,
                    ),
                  );
                }
              },
              decoration: BoxDecoration(
                color: !(authFieldValidationStatus.isPasswordValid &&
                        authFieldValidationStatus.isConfirmPasswordValid &&
                        !authFieldValidationStatus.isPasswordMismatched)
                    ? AppColors.inActiveButtonBgColor
                    : AppColors.activeButtonBgColor,
                borderRadius: BorderRadius.circular(25.0),
              ),
              height: 50.0,
              child: Center(
                child: Text(
                  AppStringConstants.saveLabel,
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
