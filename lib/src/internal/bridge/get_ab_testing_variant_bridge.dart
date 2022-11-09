import 'package:flutter/services.dart';

abstract class GetABTestingVariantBridge {
  const GetABTestingVariantBridge();

  Future<String> invoke({
    required MethodChannel channel,
  });
}

class MethodChannelGetABTestingVariant extends GetABTestingVariantBridge {
  const MethodChannelGetABTestingVariant();

  static const String _name = 'getABTestingVariant';

  @override
  Future<String> invoke({
    required MethodChannel channel
  }) async {
    final result = await channel.invokeMethod(_name);
    return result as String;
  }
}
