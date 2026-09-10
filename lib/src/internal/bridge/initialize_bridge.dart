import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/serializer/initialize_options_serializer.dart';
import 'package:usercentrics_sdk/src/model/banner_init_customization.dart';
import 'package:usercentrics_sdk/src/model/logger_level.dart';
import 'package:usercentrics_sdk/src/model/network_mode.dart';

abstract class InitializeBridge {
  const InitializeBridge();

  void invoke({
    required MethodChannel channel,
    String settingsId,
    String ruleSetId,
    String? defaultLanguage,
    UsercentricsLoggerLevel? loggerLevel,
    int? timeoutMillis,
    String? version,
    NetworkMode? networkMode,
    bool? consentMediation,
    int? initTimeoutMillis,
    String? controllerId,
    // ignore: deprecated_member_use_from_same_package
    BannerInitCustomization? bannerCustomization,
  });
}

class MethodChannelInitialize extends InitializeBridge {
  const MethodChannelInitialize();

  static const String _name = 'initialize';

  @override
  void invoke({
    required MethodChannel channel,
    String settingsId = "",
    String ruleSetId = "",
    String? defaultLanguage,
    UsercentricsLoggerLevel? loggerLevel,
    int? timeoutMillis,
    String? version,
    NetworkMode? networkMode,
    bool? consentMediation,
    int? initTimeoutMillis,
    String? controllerId,
    // ignore: deprecated_member_use_from_same_package
    BannerInitCustomization? bannerCustomization,
  }) {
    final arguments = InitializeOptionsSerializer.serialize(
      settingsId: settingsId,
      ruleSetId: ruleSetId,
      defaultLanguage: defaultLanguage,
      loggerLevel: loggerLevel,
      timeoutMillis: timeoutMillis,
      version: version,
      networkMode: networkMode,
      consentMediation: consentMediation,
      initTimeoutMillis: initTimeoutMillis,
      controllerId: controllerId,
      bannerCustomization: bannerCustomization,
    );
    channel.invokeMethod(_name, arguments);
  }
}
