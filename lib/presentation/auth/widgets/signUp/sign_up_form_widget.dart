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
import 'package:geoattend/presentation/auth/widgets/passwordStrengthIndicator/password_strength_indicator_widget.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isRequestInProgress = false;

  bool passwordVisibility = false;

  bool confirmPasswordVisibility = false;

  bool acceptTerms = false;

  final formKey = GlobalKey<FormState>();

  AuthFieldValidation authFieldValidationStatus = AuthFieldValidation(
    isEmailAddressValid: true,
    isEmailAddressEmpty: false,
    isConfirmPasswordValid: true,
    isFirstNameValid: true,
    isLastNameValid: true,
    isPasswordMismatched: false,
    isPasswordValid: true,
  );

  @override
  void initState() {
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
          GeneralFunctions.showErrorMessage(
            context: context,
            errorMessage: state.errorMessage,
          );
        }
      },
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextFieldWidget(
                controller: firstNameController,
                enabled: !isRequestInProgress,
                errorText: !authFieldValidationStatus.isFirstNameValid
                    ? AppStringConstants.firstNameFieldError
                    : null,
                hintText: AppStringConstants.firstNameHint,
                isThereAnError: !authFieldValidationStatus.isFirstNameValid,
                keyboardType: TextInputType.text,
                title: AppStringConstants.firstNameLabel,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    authFieldValidationStatus.isFirstNameValid = true;
                  }
                },
              ),
              AppTextFieldWidget(
                controller: lastNameController,
                enabled: !isRequestInProgress,
                errorText: !authFieldValidationStatus.isLastNameValid
                    ? AppStringConstants.lastNameFieldError
                    : null,
                hintText: AppStringConstants.lastNameHint,
                isThereAnError: !authFieldValidationStatus.isLastNameValid,
                keyboardType: TextInputType.text,
                title: AppStringConstants.lastNameLabel,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    authFieldValidationStatus.isLastNameValid = true;
                  }
                },
              ),
              AppTextFieldWidget(
                controller: emailAddressController,
                enabled: !isRequestInProgress,
                errorText: authFieldValidationStatus.isEmailAddressEmpty
                    ? AppStringConstants.emailFieldEmptyError
                    : !authFieldValidationStatus.isEmailAddressValid
                        ? AppStringConstants.emailFieldError
                        : null,
                hintText: AppStringConstants.emailHint,
                isThereAnError:
                    !authFieldValidationStatus.isEmailAddressValid ||
                        authFieldValidationStatus.isEmailAddressEmpty,
                keyboardType: TextInputType.emailAddress,
                title: AppStringConstants.emailLabel,
                onChanged: (value) {
                  BlocProvider.of<AuthBloc>(context).add(
                    ValidateEmailAddressForAuth(
                      emailAddress: value,
                    ),
                  );
                },
              ),
              AppTextFieldWidget(
                controller: passwordController,
                enabled: !isRequestInProgress,
                errorText: !authFieldValidationStatus.isPasswordValid
                    ? null
                    : null,
                hintText: AppStringConstants.passwordHint,
                isThereAnError: !authFieldValidationStatus.isPasswordValid,
                increaseBy: 1,
                allowBottomPadding: authFieldValidationStatus.isPasswordValid,
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
                isThereAnError:
                    authFieldValidationStatus.isPasswordMismatched ||
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
                      confirmPassword: value,
                    ),
                  );
                },
              ),
              const AppSpacerWidget(
                height: 10.0,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        acceptTerms = !acceptTerms;
                      });
                      BlocProvider.of<AuthBloc>(context).add(
                        AcceptTermsAndConditions(
                          accepted: acceptTerms,
                        ),
                      );
                    },
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ),
                        border: Border.all(
                          color: AppColors.termsAgreementBoxBorderColor,
                        ),
                      ),
                      child: acceptTerms
                          ? const Center(
                              child: Icon(
                                Icons.check,
                                color: AppColors.termsAgreementBoxCheckedColor,
                                size: 16.0,
                                weight: 2.0,
                              ),
                            )
                          : Container(),
                    ),
                  ),
                  const AppSpacerWidget(
                    width: 10.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppStringConstants.iAgreeTo,
                          style: const TextStyle(
                            color: AppColors.textLighterColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                          ),
                        ),
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: AppStringConstants.termsAndConditions,
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: const TextStyle(
                            color: AppColors.primaryTextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                          ),
                        ),
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: AppStringConstants.and,
                          style: const TextStyle(
                            color: AppColors.textLighterColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                          ),
                        ),
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: AppStringConstants.privacyPolicy,
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: const TextStyle(
                            color: AppColors.primaryTextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const AppSpacerWidget(
                height: 20.0,
              ),
              AppButtonWidget(
                appButtonFunctionality: () {
                  if (acceptTerms) {
                    BlocProvider.of<AuthBloc>(context).add(
                      CreateAccountAuthEvent(
                        confirmPassword: confirmPasswordController.text,
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailAddressController.text,
                        password: passwordController.text,
                        acceptTerms: acceptTerms,
                      ),
                    );
                  }
                },
                decoration: BoxDecoration(
                  color: !acceptTerms
                      ? AppColors.inActiveButtonBgColor
                      : AppColors.activeButtonBgColor,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                height: 50.0,
                child: Center(
                  child: Text(
                    AppStringConstants.createAnAccount,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              const AppSpacerWidget(
                height: 30.0,
              ),
              Align(
                alignment: AlignmentDirectional.center,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppStringConstants.alreadyHaveAnAccount,
                        style: const TextStyle(
                          color: AppColors.textLighterColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                      const TextSpan(text: ' '),
                      TextSpan(
                        text: AppStringConstants.login,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.router.push(
                              const LoginRoute(),
                            );
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
