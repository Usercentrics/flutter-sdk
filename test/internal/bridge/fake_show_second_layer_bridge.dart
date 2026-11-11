import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/banner_settings.dart';
import 'package:usercentrics_sdk/src/model/second_layer_tab.dart';
import 'package:usercentrics_sdk/src/model/user_response.dart';

class FakeShowSecondLayerBridge extends ShowSecondLayerBridge {
  FakeShowSecondLayerBridge({
    this.invokeAnswer,
  });

  final UsercentricsConsentUserResponse? invokeAnswer;
  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;
  BannerSettings? invokeSettingsArgument;
  SecondLayerTab? invokeTabArgument;

  @override
  Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    BannerSettings? settings,
    SecondLayerTab? tab,
  }) {
    invokeCount++;
    invokeSettingsArgument = settings;
    invokeTabArgument = tab;
    invokeChannelArgument = channel;
    return Future.value(invokeAnswer!);
  }
}
