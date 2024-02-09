import 'package:aichat/core/error/failures.dart';
import 'package:aichat/features/image_generation/domain/entities/image_generation.dart';
import 'package:aichat/features/image_generation/domain/usecases/image_generation_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class ImageGenerationRepository {
  Future<Either<Failure, ImageGeneration>> getGenerateImages(
      ImageGenerationParameter parameter);
}
