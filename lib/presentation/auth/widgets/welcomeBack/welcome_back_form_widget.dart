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

class WelcomeBackFormWidget extends StatefulWidget {
  const WelcomeBackFormWidget({super.key});

  @override
  State<WelcomeBackFormWidget> createState() => _WelcomeBackFormWidgetState();
}

class _WelcomeBackFormWidgetState extends State<WelcomeBackFormWidget> {
  final TextEditingController emailController = TextEditingController();

  bool isRequestInProgress = false;

  final formKey = GlobalKey<FormState>();

  bool validated = false;

  AuthFieldValidation authFieldValidationStatus = AuthFieldValidation(
    isEmailAddressValid: true,
    isEmailAddressEmpty: false,
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ValidationAuthState) {
          setState(() {
            if (state.authFieldValidation != null) {
              authFieldValidationStatus = state.authFieldValidation!;
            }
            validated = state.authFieldValidation != null;
          });
        }

        if (state is FailureAuthState) {
          setState(() {
            authFieldValidationStatus = state.authFieldValidation;
            validated = true;
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
              controller: emailController,
              enabled: !isRequestInProgress,
              errorText: authFieldValidationStatus.isEmailAddressEmpty
                  ? AppStringConstants.emailFieldEmptyError
                  : !authFieldValidationStatus.isEmailAddressValid
                      ? AppStringConstants.emailFieldError
                      : null,
              hintText: AppStringConstants.emailHint,
              isThereAnError: !authFieldValidationStatus.isEmailAddressValid ||
                  authFieldValidationStatus.isEmailAddressEmpty,
              keyboardType: TextInputType.emailAddress,
              title: AppStringConstants.emailLabel,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  BlocProvider.of<AuthBloc>(context).add(
                    ValidateEmailAddressForAuth(
                      emailAddress: value,
                    ),
                  );
                }
              },
            ),
            const AppSpacerWidget(
              height: 20.0,
            ),
            AppButtonWidget(
              appButtonFunctionality: () {
                if (authFieldValidationStatus.isEmailAddressValid &&
                    validated) {
                  BlocProvider.of<AuthBloc>(context).add(
                      ValidateAccAuthEvent(emailAddress: emailController.text));
                }
              },
              decoration: BoxDecoration(
                color: validated
                    ? !authFieldValidationStatus.isEmailAddressValid
                        ? AppColors.inActiveButtonBgColor
                        : AppColors.activeButtonBgColor
                    : AppColors.inActiveButtonBgColor,
                borderRadius: BorderRadius.circular(25.0),
              ),
              height: 50.0,
              child: Center(
                child: Text(
                  AppStringConstants.nextLabel,
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
