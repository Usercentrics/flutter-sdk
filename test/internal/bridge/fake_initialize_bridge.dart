import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/banner_init_customization.dart';
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
  String? invokeControllerIdArgument;
  // ignore: deprecated_member_use_from_same_package
  BannerInitCustomization? invokeBannerCustomizationArgument;

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
    invokeControllerIdArgument = controllerId;
    invokeBannerCustomizationArgument = bannerCustomization;
  }
}
