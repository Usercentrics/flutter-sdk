import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/model.dart';

abstract class ShowSecondLayerBridge {
  const ShowSecondLayerBridge();

  Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    required bool showCloseButton,
    BannerImage? logo,
    BannerFont? font,
  });
}

class MethodChannelShowSecondLayer extends ShowSecondLayerBridge {
  const MethodChannelShowSecondLayer();

  static const String _name = 'showSecondLayer';

  @override
  Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    required bool showCloseButton,
    BannerImage? logo,
    BannerFont? font,
  }) async {
    final result = await channel.invokeMethod(
      _name,
      {
        'bannerSettings': BannerSettingsSerializer.serialize(
          logo: logo,
          font: font,
        ),
        'showCloseButton': showCloseButton,
      },
    );
    return result == null
        ? Future.value(null)
        : Future.value(UserResponseSerializer.deserialize(result));
  }
}
