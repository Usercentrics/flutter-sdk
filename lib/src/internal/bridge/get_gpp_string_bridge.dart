import 'package:flutter/services.dart';

abstract class GetGPPStringBridge {
  const GetGPPStringBridge();

  Future<String?> invoke({
    required MethodChannel channel,
  });
}

class MethodChannelGetGPPString extends GetGPPStringBridge {
  const MethodChannelGetGPPString();

  static const String _name = 'getGPPString';

  @override
  Future<String?> invoke({
    required MethodChannel channel,
  }) async {
    final result = await channel.invokeMethod<String?>(_name);
    return result;
  }
}
