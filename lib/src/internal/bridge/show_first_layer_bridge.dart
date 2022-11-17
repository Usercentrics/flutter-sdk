import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/model.dart';

abstract class ShowFirstLayerBridge {
  const ShowFirstLayerBridge();

  Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    required UsercentricsLayout layout,
    BannerSettings? settings,
  });
}

class MethodChannelShowFirstLayer extends ShowFirstLayerBridge {
  const MethodChannelShowFirstLayer();

  static const String _name = 'showFirstLayer';

  @override
  Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    required UsercentricsLayout layout,
    BannerSettings? settings,
  }) async {
    final arguments = {
      'bannerSettings': BannerSettingsSerializer.serialize(settings),
      'layout': LayoutSerializer.serialize(layout),
    };
    final result = await channel.invokeMethod(
      _name,
      arguments,
    );
    return result == null
        ? Future.value(null)
        : Future.value(UserResponseSerializer.deserialize(result));
  }
}
