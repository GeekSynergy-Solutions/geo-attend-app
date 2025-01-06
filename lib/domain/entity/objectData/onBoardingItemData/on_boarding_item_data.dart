import 'package:equatable/equatable.dart';

class OnBoardingItemData extends Equatable {
  final String title;
  final String description;
  final String picturePath;

  const OnBoardingItemData({
    required this.title,
    required this.description,
    required this.picturePath,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        picturePath,
      ];
}
