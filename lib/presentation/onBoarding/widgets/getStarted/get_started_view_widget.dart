import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/app/config/appRouterHandler/app_router.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBodyPadding/app_body_padding_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/networkRequestLoadingOverlay/network_request_loading_overlay_widget.dart';
import 'package:geoattend/presentation/onBoarding/bloc/events/on_boarding_event.dart';
import 'package:geoattend/presentation/onBoarding/bloc/on_boarding_bloc.dart';
import 'package:geoattend/presentation/onBoarding/bloc/states/on_boarding_state.dart';
import 'package:geoattend/presentation/onBoarding/widgets/getStarted/get_started_actions_widget.dart';
import 'package:geoattend/presentation/onBoarding/widgets/getStarted/get_started_des_widget.dart';
import 'package:loader_overlay/loader_overlay.dart';

class GetStartedViewWidget extends StatefulWidget {
  const GetStartedViewWidget({super.key});

  @override
  State<GetStartedViewWidget> createState() => _GetStartedViewWidgetState();
}

class _GetStartedViewWidgetState extends State<GetStartedViewWidget> {
  @override
  void initState() {
    BlocProvider.of<OnBoardingBloc>(context).add(const GetStartedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnBoardingBloc, OnBoardingState>(
      listener: (context, state) {
        if (state.taggingGuestUser != null) {
          if (state.taggingGuestUser!) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
        }

        if (state.taggingGuestUserSuccessful != null) {
          if (!state.taggingGuestUserSuccessful!) {
            GeneralFunctions.showErrorMessage(
              context: context,
              errorMessage: state.message!,
            ).then((value) {
              if (state.taggingGuestUserSuccessful! && context.mounted) {}
            });
          } else {
            context.router.replaceAll(
              [
                DashboardRoute(
                  successfulUserDataStatus: SuccessfulUserDataStatus(
                    isUserAGuest: true,
                    verifiedUserDataResponse: state.verifyUserData!,
                  ),
                )
              ],
            );
          }
        }
      },
      child: const Scaffold(
        body: NetworkRequestLoadingOverlayWidget(
          child: AppBodyPaddingWidget(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 50.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacerWidget(
                  height: 20.0,
                ),
                GetStartedDesWidget(),
                AppSpacerWidget(
                  height: 40.0,
                ),
                GetStartedActionsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
