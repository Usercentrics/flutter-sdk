import 'package:flutter/services.dart';

class GetTCStringBridge {
  static const String _name = 'getTCString';

  static Future<String> invoke({
    required MethodChannel channel,
  }) async {
    return (await channel.invokeMethod(_name)) as String;
  }
}
