import 'package:usercentrics_sdk/src/model/logger_level.dart';

import 'logger_level_serializer.dart';

class InitializeOptionsSerializer {
  static dynamic serialize({
    required String settingsId,
    String? defaultLanguage,
    UsercentricsLoggerLevel? loggerLevel,
    int? timeoutMillis,
    String? version,
  }) =>
      {
        'settingsId': settingsId,
        'defaultLanguage': defaultLanguage,
        'loggerLevel': LoggerLevelSerializer.serialize(loggerLevel),
        'timeoutMillis': timeoutMillis,
        'version': version,
      };
}
