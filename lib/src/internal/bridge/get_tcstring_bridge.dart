import 'package:flutter/services.dart';

abstract class GetTCStringBridge {
  const GetTCStringBridge();

  Future<String> invoke({
    required MethodChannel channel,
  });
}

class MethodChannelGetTCString extends GetTCStringBridge {
  const MethodChannelGetTCString();

  static const String _name = 'getTCString';

  @override
  Future<String> invoke({
    required MethodChannel channel,
  }) async {
    final result = await channel.invokeMethod(_name);
    return result as String;
  }
}
