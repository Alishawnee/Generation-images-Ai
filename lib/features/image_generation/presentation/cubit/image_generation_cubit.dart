import 'dart:io';

import 'package:aichat/core/error/failures.dart';
import 'package:aichat/features/image_generation/data/model/image_generation_model.dart';
import 'package:aichat/features/image_generation/domain/usecases/image_generation_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'image_generation_state.dart';

class ImageGenerationCubit extends Cubit<ImageGenerationState> {
  final ImageGenerationUseCase imageGenerationUseCase;
  ImageGenerationCubit({required this.imageGenerationUseCase})
      : super(ImageGenerationInitial());

  Future<void> imagesGenerate({required String query}) async {
    emit(ImageGenerationLoading());
    final result = await imageGenerationUseCase
        .call(ImageGenerationParameter(query: query));

    result.fold(
        (failure) => emit(ImageGenerationFailure(errorMsg: failure.message)),
        (value) => emit(ImageGenerationLoaded(imageGenerationModel: value)));
  }
}
