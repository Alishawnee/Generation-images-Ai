import 'package:aichat/features/image_generation/domain/entities/image_generation.dart';
import 'package:aichat/features/image_generation/domain/usecases/image_generation_usecase.dart';

abstract class ImageGenerationLocalDataSource {
  Future<ImageGeneration> getGenerateImages(ImageGenerationParameter parameter);
}
