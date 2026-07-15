import 'package:usercentrics_sdk/src/model/banner_init_customization.dart';
import 'package:usercentrics_sdk/src/model/logger_level.dart';
import 'package:usercentrics_sdk/src/model/network_mode.dart';

import 'banner_init_customization_serializer.dart';
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
    bool? consentMediation,
    int? initTimeoutMillis,
    // ignore: deprecated_member_use_from_same_package
    BannerInitCustomization? bannerCustomization,
  }) =>
      {
        'settingsId': settingsId,
        'ruleSetId': ruleSetId,
        'defaultLanguage': defaultLanguage,
        'loggerLevel': LoggerLevelSerializer.serialize(loggerLevel),
        'timeoutMillis': timeoutMillis,
        'version': version,
        'networkMode': NetworkModeSerializer.serialize(networkMode),
        'consentMediation': consentMediation,
        'initTimeoutMillis': initTimeoutMillis,
        'bannerCustomization': BannerInitCustomizationSerializer.serialize(
          bannerCustomization,
        ),
      };
}
