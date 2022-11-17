import 'package:flutter/services.dart';

abstract class SetABTestingVariantBridge {
  const SetABTestingVariantBridge();

  Future<void> invoke({
    required MethodChannel channel,
    required String variant,
  });
}

class MethodChannelSetABTestingVariant extends SetABTestingVariantBridge {
  const MethodChannelSetABTestingVariant();

  static const String _name = 'setABTestingVariant';

  @override
  Future<void> invoke(
      {required MethodChannel channel, required String variant}) async {
    await channel.invokeMethod(_name, variant);
  }
}
