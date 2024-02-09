class EndPoints {
  static const String baseUrl = "https://api.openai.com/v1/";
  static const String key =
      "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";

  static Map<String, String> headerBearerOption = {
    "Content-Type": "application/json",
    'Authorization': 'Bearer $key',
  };

  static const String getImagesGeneration = '${baseUrl}images/generations';
}
