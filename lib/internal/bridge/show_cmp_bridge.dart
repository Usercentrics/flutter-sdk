import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/all.dart';
import 'package:usercentrics_sdk/internal/serializer/serializer.dart';

class ShowCMPBridge {
  static const String _name = 'showCMP';

  static Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    bool? showCloseButton,
    UsercentricsImage? customLogo,
    UsercentricsFont? customFont,
  }) async {
    final result = await channel.invokeMethod(
      _name,
      UISettingsSerializer.serialize(
        showCloseButton: showCloseButton,
        customLogo: customLogo,
        customFont: customFont,
      ),
    );
    return result == null
        ? Future.value(null)
        : Future.value(UserResponseSerializer.deserialize(result));
  }
}
