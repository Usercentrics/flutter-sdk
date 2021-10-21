import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/model.dart';

abstract class ShowCMPBridge {
  const ShowCMPBridge();

  Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    bool? showCloseButton,
    UsercentricsImage? customLogo,
    UsercentricsFont? customFont,
  });
}

class MethodChannelShowCMP extends ShowCMPBridge {
  const MethodChannelShowCMP();

  static const String _name = 'showCMP';

  @override
  Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    bool? showCloseButton,
    UsercentricsImage? customLogo,
    UsercentricsFont? customFont,
  }) async {
    final arguments = UISettingsSerializer.serialize(
      showCloseButton: showCloseButton,
      customLogo: customLogo,
      customFont: customFont,
    );
    final result = await channel.invokeMethod(_name, arguments);
    return result == null
        ? Future.value(null)
        : Future.value(UserResponseSerializer.deserialize(result));
  }
}
