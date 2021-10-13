import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/model/logger_level.dart';

class FakeInitializeBridge extends InitializeBridge {
  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;
  String? invokeSettingsIdArgument;
  String? invokeDefaultLanguageArgument;
  UsercentricsLoggerLevel? invokeLoggerLevelArgument;
  int? invokeTimeoutMillisArgument;
  String? invokeVersionArgument;

  @override
  void invoke({
    required MethodChannel channel,
    required String settingsId,
    String? defaultLanguage,
    UsercentricsLoggerLevel? loggerLevel,
    int? timeoutMillis,
    String? version,
  }) {
    invokeCount++;
    invokeChannelArgument = channel;
    invokeSettingsIdArgument = settingsId;
    invokeDefaultLanguageArgument = defaultLanguage;
    invokeLoggerLevelArgument = loggerLevel;
    invokeTimeoutMillisArgument = timeoutMillis;
    invokeVersionArgument = version;
  }
}
