/// {@nodoc}
library get_controller_id_bridge;

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
    final result = await channel.invokeMethod(_name);
    return result as String;
  }
}
