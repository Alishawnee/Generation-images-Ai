import 'package:aichat/core/error/failures.dart';
import 'package:aichat/core/usecases/usecase.dart';
import 'package:aichat/features/image_generation/domain/entities/image_generation.dart';
import 'package:aichat/features/image_generation/domain/repositories/image_generation_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ImageGenerationUseCase
    extends UseCase<ImageGeneration, ImageGenerationParameter> {
  final ImageGenerationRepository imageGenerationRepository;

  ImageGenerationUseCase({required this.imageGenerationRepository});

  @override
  Future<Either<Failure, ImageGeneration>> call(
          ImageGenerationParameter parameter) async =>
      await imageGenerationRepository.getGenerateImages(parameter);
}

class ImageGenerationParameter extends Equatable {
  final String query;
  const ImageGenerationParameter({required this.query});

  @override
  List<Object?> get props => [query];
}
