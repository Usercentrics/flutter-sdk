import 'package:flutter/services.dart';

abstract class GetControllerIdBridge {
  const GetControllerIdBridge();

  Future<String> invoke({
    required MethodChannel channel,
  });
}

class MethodChannelGetControllerId extends GetControllerIdBridge {
  const MethodChannelGetControllerId();

  static const String _name = 'getControllerId';

  @override
  Future<String> invoke({
    required MethodChannel channel,
  }) async {
    return (await channel.invokeMethod(_name)) as String;
  }
}
