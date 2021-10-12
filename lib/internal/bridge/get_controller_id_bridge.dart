import 'package:flutter/services.dart';

class GetControllerIdBridge {
  static const String _name = 'getControllerId';

  static Future<String> invoke({
    required MethodChannel channel,
  }) async {
    return (await channel.invokeMethod(_name)) as String;
  }
}
