import 'dart:convert';

import 'package:aichat/core/api/api_consumer.dart';
import 'package:aichat/core/api/end_points.dart';
import 'package:aichat/features/global/provider/provider.dart';
import 'package:aichat/features/image_generation/data/model/image_generation_model.dart';
import 'package:aichat/features/image_generation/domain/entities/image_generation.dart';
import 'package:aichat/features/image_generation/domain/usecases/image_generation_usecase.dart';
import 'package:flutter_chatgpt/core/custom_exceptions.dart';
import 'package:flutter_chatgpt/core/open_ai_data.dart';
import 'package:flutter_chatgpt/features/global/provider/provider.dart';
import 'package:flutter_chatgpt/features/image_generation/data/model/image_generation_model.dart';
import 'package:flutter_chatgpt/features/image_generation/data/remote_data_source/image_generation_remote_data_source.dart';
import 'package:http/http.dart' as http;

class ImageGenerationRemoteDataSourceImpl
    implements ImageGenerationRemoteDataSource {
  final ApiConsumer apiConsumer;

  ImageGenerationRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<ImageGeneration> getGenerateImages(
      ImageGenerationParameter parameter) async {
    // ['256x256', '512x512', '1024x1024']
    Map<String, dynamic> body = {
      "n": 10,
      "size": "256x256",
      "prompt": parameter.query,
    };

    final response = await apiConsumer.post(
      EndPoints.getImagesGeneration,
      queryParameters: EndPoints.headerBearerOption,
      body: body,
    );

    return ImageGenerationModel.fromJson(json.decode(response.body));
  }
}
