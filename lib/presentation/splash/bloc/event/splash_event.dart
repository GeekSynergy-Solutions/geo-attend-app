import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

// ignore: must_be_immutable
class InitEvent extends SplashEvent {
  BuildContext context;
  InitEvent({required this.context,}) : super();

  @override
  List<Object?> get props => [context,];
}
