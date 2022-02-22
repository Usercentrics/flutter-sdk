import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/font.dart';
import 'package:usercentrics_sdk/src/model/image.dart';
import 'package:usercentrics_sdk/src/model/user_response.dart';

class FakeShowSecondLayerBridge extends ShowSecondLayerBridge {
  FakeShowSecondLayerBridge({
    this.invokeAnswer,
  });

  final UsercentricsConsentUserResponse? invokeAnswer;
  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;
  bool? invokeShowCloseButtonArgument;
  BannerImage? invokeLogoArgument;
  BannerFont? invokeFontArgument;

  @override
  Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    required bool showCloseButton,
    BannerImage? logo,
    BannerFont? font,
  }) {
    invokeCount++;
    invokeShowCloseButtonArgument = showCloseButton;
    invokeLogoArgument = logo;
    invokeFontArgument = font;
    invokeChannelArgument = channel;
    return Future.value(invokeAnswer!);
  }
}
