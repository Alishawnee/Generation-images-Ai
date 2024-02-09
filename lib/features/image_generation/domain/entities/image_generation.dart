import 'package:equatable/equatable.dart';

class ImageGeneration extends Equatable {
  final List<String> images;
  final num created;
  const ImageGeneration({
    required this.images,
    required this.created,
  });
  @override
  List<Object?> get props => [images, created];
}
