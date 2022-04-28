import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/font.dart';
import 'package:usercentrics_sdk/src/model/image.dart';
import 'package:usercentrics_sdk/src/model/legal_links_settings.dart';
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
  BannerImage? invokeLogoArgument;
  BannerFont? invokeFontArgument;
  LegalLinksSettings? invokeLinksArgument;

  @override
  Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    BannerImage? logo,
    BannerFont? font,
    LegalLinksSettings? links,
    SecondLayerStyleSettings? secondLayerSettings,
  }) {
    invokeCount++;
    invokeSecondLayerSettingsArgument = secondLayerSettings;
    invokeLogoArgument = logo;
    invokeFontArgument = font;
    invokeLinksArgument = links;
    invokeChannelArgument = channel;
    return Future.value(invokeAnswer!);
  }
}
