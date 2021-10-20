import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/model/custom_font.dart';
import 'package:usercentrics_sdk/model/custom_image.dart';
import 'package:usercentrics_sdk/model/user_response.dart';

class FakeShowCMPBridge extends ShowCMPBridge {
  FakeShowCMPBridge({
    this.invokeAnswer,
  });

  final UsercentricsConsentUserResponse? invokeAnswer;
  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;
  bool? invokeShowCloseButtonArgument;
  UsercentricsImage? invokeCustomLogoArgument;
  UsercentricsFont? invokeCustomFontArgument;

  @override
  Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    bool? showCloseButton,
    UsercentricsImage? customLogo,
    UsercentricsFont? customFont,
  }) {
    invokeCount++;
    invokeShowCloseButtonArgument = showCloseButton;
    invokeCustomFontArgument = customFont;
    invokeCustomLogoArgument = customLogo;
    invokeChannelArgument = channel;
    return Future.value(invokeAnswer!);
  }
}
