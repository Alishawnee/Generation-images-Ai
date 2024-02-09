import 'package:aichat/core/error/app_errors.dart';
import 'package:aichat/core/error/exceptions.dart';
import 'package:aichat/core/error/failures.dart';
import 'package:aichat/core/network/netwok_info.dart';
import 'package:aichat/features/image_generation/data/datasources/local/image_generation_local_data_source.dart';
import 'package:aichat/features/image_generation/data/datasources/remote/image_generation_remote_data_source.dart';
import 'package:aichat/features/image_generation/data/model/image_generation_model.dart';
import 'package:aichat/features/image_generation/domain/repositories/image_generation_repository.dart';
import 'package:aichat/features/image_generation/domain/usecases/image_generation_usecase.dart';
import 'package:dartz/dartz.dart';

class ImageGenerationRepositoryImpl implements ImageGenerationRepository {
  final NetworkInfo networkInfo;
  final ImageGenerationRemoteDataSource imageGenerationRemoteDataSource;
  final ImageGenerationLocalDataSource imageGenerationLocalDataSource;

  ImageGenerationRepositoryImpl({
    required this.networkInfo,
    required this.imageGenerationRemoteDataSource,
    required this.imageGenerationLocalDataSource,
  });

  @override
  Future<Either<Failure, ImageGenerationModel>> getGenerateImages(
      ImageGenerationParameter parameter) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteImageGeneration =
            await imageGenerationRemoteDataSource.getGenerateImages(parameter);
        imageGenerationLocalDataSource
            .cacheImageGeneration(remoteImageGeneration);
        return Right(remoteImageGeneration);
      } on ServerException catch (exception) {
        return Left(ServerFailure(exception.message));
      }
    } else {
      try {
        final cacheImageGeneration =
            await imageGenerationLocalDataSource.getGenerateImages();
        return Right(cacheImageGeneration);
      } on CacheException catch (exception) {
        return Left(CacheFailure(exception.message));
      }
    }
  }
}
