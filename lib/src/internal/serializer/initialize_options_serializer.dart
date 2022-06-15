import 'package:usercentrics_sdk/src/model/logger_level.dart';
import 'package:usercentrics_sdk/src/model/network_mode.dart';

import 'logger_level_serializer.dart';
import 'network_mode_serializer.dart';

class InitializeOptionsSerializer {
  static dynamic serialize({
    String settingsId = "",
    String ruleSetId = "",
    String? defaultLanguage,
    UsercentricsLoggerLevel? loggerLevel,
    int? timeoutMillis,
    String? version,
    NetworkMode? networkMode,
  }) =>
      {
        'settingsId': settingsId,
        'ruleSetId': ruleSetId,
        'defaultLanguage': defaultLanguage,
        'loggerLevel': LoggerLevelSerializer.serialize(loggerLevel),
        'timeoutMillis': timeoutMillis,
        'version': version,
        'networkMode': NetworkModeSerializer.serialize(networkMode),
      };
}
