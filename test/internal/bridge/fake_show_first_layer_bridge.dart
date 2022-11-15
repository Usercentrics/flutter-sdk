import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/banner_settings.dart';
import 'package:usercentrics_sdk/src/model/layout.dart';
import 'package:usercentrics_sdk/src/model/user_response.dart';

class FakeShowFirstLayerBridge extends ShowFirstLayerBridge {
  FakeShowFirstLayerBridge({
    this.invokeAnswer,
  });

  final UsercentricsConsentUserResponse? invokeAnswer;
  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;
  UsercentricsLayout? invokeLayoutArgument;
  BannerSettings? invokeSettingsArgument;

  @override
  Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    required UsercentricsLayout layout,
    BannerSettings? settings,
  }) {
    invokeCount++;
    invokeLayoutArgument = layout;
    invokeSettingsArgument = settings;
    invokeChannelArgument = channel;
    return Future.value(invokeAnswer!);
  }
}
