import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/serializer/initialize_options_serializer.dart';
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
    );
    channel.invokeMethod(_name, arguments);
  }
}
