// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class WelcomeGreetingData extends Equatable{
  String title;
  String description;
  String imagePath;

  WelcomeGreetingData({
    required this.title,
    required this.description,
    required this.imagePath,
  });
  
  @override
  List<Object?> get props => [
    title,
    description,
    imagePath,
  ];
}