import 'package:aichat/features/image_generation/data/datasources/local/image_generation_local_data_source.dart';
import 'package:aichat/features/image_generation/data/datasources/local/image_generation_local_data_source_impl.dart';
import 'package:aichat/features/image_generation/data/datasources/remote/image_generation_remote_data_source.dart';
import 'package:aichat/features/image_generation/data/datasources/remote/image_generation_remote_data_source_impl.dart';
import 'package:aichat/features/image_generation/data/repositories/image_generation_repository_impl.dart';
import 'package:aichat/features/image_generation/domain/repositories/image_generation_repository.dart';
import 'package:aichat/features/image_generation/domain/usecases/image_generation_usecase.dart';
import 'package:aichat/features/image_generation/presentation/cubit/image_generation_cubit.dart';
import 'package:aichat/injection_container.dart';

Future<void> imageGenerationInjectionContainer() async {
  //! Bloc
  sl.registerFactory<ImageGenerationCubit>(
    () => ImageGenerationCubit(
      imageGenerationUseCase: sl.call(),
    ),
  );

  //! UseCase
  sl.registerLazySingleton<ImageGenerationUseCase>(() => ImageGenerationUseCase(
        imageGenerationRepository: sl.call(),
      ));

  //! Repository
  sl.registerLazySingleton<ImageGenerationRepository>(
      () => ImageGenerationRepositoryImpl(
            networkInfo: sl.call(),
            imageGenerationRemoteDataSource: sl.call(),
            imageGenerationLocalDataSource: sl.call(),
          ));
  //! Data Source
  // Remote Data Source
  sl.registerLazySingleton<ImageGenerationRemoteDataSource>(
      () => ImageGenerationRemoteDataSourceImpl(apiConsumer: sl.call()));

  // Local Data Source
  sl.registerLazySingleton<ImageGenerationLocalDataSource>(
      () => ImageGenerationLocalDataSourceImpl(sharedPreferences: sl.call()));
}
