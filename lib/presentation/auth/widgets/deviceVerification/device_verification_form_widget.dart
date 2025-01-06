import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/domain/entity/errorFieldData/authFieldValidation/auth_field_validation.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appButton/app_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/presentation/auth/bloc/auth_bloc.dart';
import 'package:geoattend/presentation/auth/bloc/event/auth_event.dart';
import 'package:geoattend/presentation/auth/bloc/state/auth_state.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class DeviceVerificationFormWidget extends StatefulWidget {
  final String emailAddress;
  const DeviceVerificationFormWidget({
    super.key,
    required this.emailAddress,
  });

  @override
  State<DeviceVerificationFormWidget> createState() =>
      _DeviceVerificationFormWidgetState();
}

class _DeviceVerificationFormWidgetState
    extends State<DeviceVerificationFormWidget> {
  final TextEditingController otpController = TextEditingController();

  bool isRequestInProgress = false;

  bool isRequestSuccessful = false;

  final formKey = GlobalKey<FormState>();

  String otpValue = '';

  late String emailAddress;

  AuthFieldValidation authFieldValidationStatus = AuthFieldValidation(
    isOtpValueValid: true,
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
            authFieldValidationStatus =
                state.authFieldValidation ?? authFieldValidationStatus;
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
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: PinCodeTextField(
                appContext: context,
                keyboardType: TextInputType.number,
                enabled: !isRequestInProgress,
                cursorColor: AppColors.otpCursorColor,
                length: 4,
                enablePinAutofill: true,
                textStyle: TextStyle(
                  color: !isRequestInProgress
                      ? AppColors.textDarkerColor
                      : !isRequestSuccessful
                          ? AppColors.textDarkerColor
                          : AppColors.redColor,
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  inactiveFillColor: AppColors.otpTextFieldFilledColor,
                  activeColor: AppColors.otpInActiveTextFieldColor,
                  disabledColor: AppColors.otpInActiveTextFieldColor,
                  inactiveColor: AppColors.otpInActiveTextFieldColor,
                  selectedFillColor: AppColors.otpTextFieldFilledColor,
                  activeFillColor: AppColors.otpTextFieldFilledColor,
                  selectedColor: AppColors.otpActiveTextFieldColor,
                  errorBorderColor: AppColors.redColor,
                ),
                controller: otpController,
                enableActiveFill: true,
                onChanged: (value) {
                  setState(() {
                    otpValue = value;
                  });
                },
                onCompleted: (value) {
                  setState(() {
                    otpValue = value;
                  });
                  BlocProvider.of<AuthBloc>(context).add(
                    VerifyAccountAuth(
                      emailAddress: emailAddress,
                      otp: value,
                    ),
                  );
                },
              ),
            ),
            const AppSpacerWidget(
              height: 40.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppButtonWidget(
                  appButtonFunctionality: () {
                    if (otpValue.length == 4) {
                      BlocProvider.of<AuthBloc>(context).add(
                        VerifyDeviceAuth(
                          emailAddress: emailAddress,
                          otp: otpValue,
                        ),
                      );
                    }
                  },
                  decoration: BoxDecoration(
                    color: otpValue.length < 4
                        ? AppColors.inActiveButtonBgColor
                        : AppColors.activeButtonBgColor,
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
                const AppSpacerWidget(
                  height: 40.0,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<AuthBloc>(context).add(
                        RequestDeviceVerificationCodeAuth(
                          emailAddress: emailAddress,
                        ),
                      );
                    },
                    child: Text(
                      AppStringConstants.resendCode,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: AppColors.resendColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color otpTextFieldFilledColor() => otpValue.isEmpty
      ? AppColors.blackBgColor
      : !isRequestInProgress && !isRequestSuccessful
          ? AppColors.redColor
          : AppColors.otpTextFieldFilledColor;
}
