import 'package:flutter/services.dart';

abstract class GetUserSessionDataBridge {
  const GetUserSessionDataBridge();

  Future<String> invoke({
    required MethodChannel channel,
  });
}

class MethodChannelGetUserSessionData extends GetUserSessionDataBridge {
  const MethodChannelGetUserSessionData();

  static const String _name = 'getUserSessionData';

  @override
  Future<String> invoke({
    required MethodChannel channel,
  }) async {
    final result = await channel.invokeMethod(_name);
    return result as String;
  }
}
