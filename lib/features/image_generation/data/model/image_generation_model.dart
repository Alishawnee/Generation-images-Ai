import 'package:aichat/features/image_generation/domain/entities/image_generation.dart';

class ImageGenerationModel extends ImageGeneration {
  const ImageGenerationModel({required super.images, required super.created});

  factory ImageGenerationModel.fromJson(Map<String, dynamic> json) =>
      ImageGenerationModel(
        images: List.from((json['data'] as List).map((image) => image)),
        created: json['created'],
      );

  Map<String, dynamic> toJson() =>
      {'created': created, 'data': List.from(images.map((image) => image))};
}
