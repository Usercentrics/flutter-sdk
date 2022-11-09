import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/general_style_settings.dart';
import 'package:usercentrics_sdk/src/model/second_layer_style_settings.dart';
import 'package:usercentrics_sdk/src/model/user_response.dart';

class FakeShowSecondLayerBridge extends ShowSecondLayerBridge {
  FakeShowSecondLayerBridge({
    this.invokeAnswer,
  });

  final UsercentricsConsentUserResponse? invokeAnswer;
  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;
  SecondLayerStyleSettings? invokeSecondLayerSettingsArgument;
  GeneralStyleSettings? invokeGeneralStyleSettingsArgument;

  @override
  Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    GeneralStyleSettings? generalStyleSettings,
    SecondLayerStyleSettings? secondLayerSettings,
    String? variant
  }) {
    invokeCount++;
    invokeSecondLayerSettingsArgument = secondLayerSettings;
    invokeGeneralStyleSettingsArgument = generalStyleSettings;
    invokeChannelArgument = channel;
    return Future.value(invokeAnswer!);
  }
}
