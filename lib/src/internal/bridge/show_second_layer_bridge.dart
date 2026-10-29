import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/model.dart';

abstract class ShowSecondLayerBridge {
  const ShowSecondLayerBridge();

  Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    BannerSettings? settings,
    SecondLayerTab? tab,
  });
}

class MethodChannelShowSecondLayer extends ShowSecondLayerBridge {
  const MethodChannelShowSecondLayer();

  static const String _name = 'showSecondLayer';

  @override
  Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    BannerSettings? settings,
    SecondLayerTab? tab,
  }) async {
    final result = await channel.invokeMethod(
      _name,
      {
        'bannerSettings': BannerSettingsSerializer.serialize(settings),
        // Only sent when requested, so a plain call keeps the same payload as before.
        if (tab != null) 'tab': SecondLayerTabSerializer.serialize(tab),
      },
    );
    return result == null
        ? Future.value(null)
        : Future.value(UserResponseSerializer.deserialize(result));
  }
}
