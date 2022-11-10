import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/first_layer_style_settings.dart';
import 'package:usercentrics_sdk/src/model/general_style_settings.dart';
import 'package:usercentrics_sdk/src/model/layout.dart';
import 'package:usercentrics_sdk/src/model/second_layer_style_settings.dart';
import 'package:usercentrics_sdk/src/model/user_response.dart';

class FakeShowFirstLayerBridge extends ShowFirstLayerBridge {
  FakeShowFirstLayerBridge({
    this.invokeAnswer,
  });

  final UsercentricsConsentUserResponse? invokeAnswer;
  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;
  UsercentricsLayout? invokeLayoutArgument;
  FirstLayerStyleSettings? invokeFirstLayerSettingsArgument;
  SecondLayerStyleSettings? invokeSecondLayerSettingsArgument;
  GeneralStyleSettings? invokeGeneralStyleSettingsArgument;

  @override
  Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    UsercentricsLayout? layout,
    GeneralStyleSettings? generalStyleSettings,
    FirstLayerStyleSettings? firstLayerSettings,
    SecondLayerStyleSettings? secondLayerSettings,
  }) {
    invokeCount++;
    invokeLayoutArgument = layout;
    invokeFirstLayerSettingsArgument = firstLayerSettings;
    invokeSecondLayerSettingsArgument = secondLayerSettings;
    invokeGeneralStyleSettingsArgument = generalStyleSettings;
    invokeChannelArgument = channel;
    return Future.value(invokeAnswer!);
  }
}
