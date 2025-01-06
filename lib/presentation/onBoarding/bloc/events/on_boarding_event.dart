// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();
}

class GetStartedEvent extends OnBoardingEvent {
  const GetStartedEvent() : super();

  @override
  List<Object?> get props => [];
}

class UserAsAGuestEvent extends OnBoardingEvent {
  const UserAsAGuestEvent() : super();

  @override
  List<Object?> get props => [];
}

class OnBoardingSlideEvent extends OnBoardingEvent {
  int currentSlideIndex;
  int slideListLength;
  bool nextSlide;
  OnBoardingSlideEvent({
    required this.currentSlideIndex,
    required this.slideListLength,
    required this.nextSlide,
  }) : super();

  @override
  List<Object?> get props => [
        currentSlideIndex,
        slideListLength,
        nextSlide,
      ];
}

class InitOnBoardingListItemsEvent extends OnBoardingEvent {
  const InitOnBoardingListItemsEvent() : super();

  @override
  List<Object?> get props => [];
}

class SkipBoardingListItemEvent extends OnBoardingEvent {
  const SkipBoardingListItemEvent() : super();

  @override
  List<Object?> get props => [];
}
