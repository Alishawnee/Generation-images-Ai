import 'dart:convert';

import 'package:aichat/core/error/exceptions.dart';
import 'package:aichat/core/utils/app_strings.dart';
import 'package:aichat/features/image_generation/data/datasources/local/image_generation_local_data_source.dart';
import 'package:aichat/features/image_generation/data/model/image_generation_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageGenerationLocalDataSourceImpl
    implements ImageGenerationLocalDataSource {
  final SharedPreferences sharedPreferences;

  ImageGenerationLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<ImageGenerationModel> getGenerateImages() async {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedImageGeneration);
    if (jsonString != null) {
      final cacheImageGeneration =
          Future.value(ImageGenerationModel.fromJson(json.decode(jsonString)));
      return cacheImageGeneration;
    } else {
      throw const CacheException('then handel error storage consumer');
    }
  }

  @override
  Future<void> cacheImageGeneration(
      ImageGenerationModel imageGeneration) async {
    try {
      await sharedPreferences.setString(
          AppStrings.cachedImageGeneration, json.encode(imageGeneration));
    } catch (e) {
      throw const CacheException('then handel error storage consumer');
    }
  }
}
