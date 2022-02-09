import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/model.dart';

abstract class ShowFirstLayerBridge {
  const ShowFirstLayerBridge();

  Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    required UsercentricsLayout layout,
    UsercentricsImage? logo,
    UsercentricsFont? font,
  });
}

class MethodChannelShowFirstLayer extends ShowFirstLayerBridge {
  const MethodChannelShowFirstLayer();

  static const String _name = 'showFirstLayer';

  @override
  Future<UsercentricsConsentUserResponse?> invoke({
    required MethodChannel channel,
    required UsercentricsLayout layout,
    UsercentricsImage? logo,
    UsercentricsFont? font,
  }) async {
    final result = await channel.invokeMethod(
      _name,
      {
        'bannerSettings': BannerSettingsSerializer.serialize(
          logo: logo,
          font: font,
        ),
        'layout': LayoutSerializer.serialize(layout),
        //             // TODO
        // //            settings = argsMap["settings"].deserializeFirstLayerStyleSettings(),
      },
    );
    return result == null
        ? Future.value(null)
        : Future.value(UserResponseSerializer.deserialize(result));
  }
}
