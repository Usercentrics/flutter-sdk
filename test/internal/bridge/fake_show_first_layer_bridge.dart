import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/first_layer_style_settings.dart';
import 'package:usercentrics_sdk/src/model/font.dart';
import 'package:usercentrics_sdk/src/model/image.dart';
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
  FirstLayerStyleSettings? invokeSettingsArgument;
  BannerImage? invokeLogoArgument;
  BannerFont? invokeFontArgument;

  @override
  Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    required UsercentricsLayout layout,
    BannerImage? logo,
    BannerFont? font,
    FirstLayerStyleSettings? settings,
  }) {
    invokeCount++;
    invokeLayoutArgument = layout;
    invokeSettingsArgument = settings;
    invokeLogoArgument = logo;
    invokeFontArgument = font;
    invokeChannelArgument = channel;
    return Future.value(invokeAnswer!);
  }
}
