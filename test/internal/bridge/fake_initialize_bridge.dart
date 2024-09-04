import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/logger_level.dart';
import 'package:usercentrics_sdk/src/model/network_mode.dart';

class FakeInitializeBridge extends InitializeBridge {
  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;
  String? invokeSettingsIdArgument;
  String? invokeRuleSetIdArgument;
  String? invokeDefaultLanguageArgument;
  UsercentricsLoggerLevel? invokeLoggerLevelArgument;
  int? invokeTimeoutMillisArgument;
  String? invokeVersionArgument;
  NetworkMode? invokeNetworkModeArgument;
  bool? invokeConsentMediationArgument;
  int? invokeInitTimeoutMillisArgument;

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
    invokeCount++;
    invokeChannelArgument = channel;
    invokeSettingsIdArgument = settingsId;
    invokeRuleSetIdArgument = ruleSetId;
    invokeDefaultLanguageArgument = defaultLanguage;
    invokeLoggerLevelArgument = loggerLevel;
    invokeTimeoutMillisArgument = timeoutMillis;
    invokeVersionArgument = version;
    invokeNetworkModeArgument = networkMode;
    invokeConsentMediationArgument = consentMediation;
    invokeInitTimeoutMillisArgument = initTimeoutMillis;
  }
}
