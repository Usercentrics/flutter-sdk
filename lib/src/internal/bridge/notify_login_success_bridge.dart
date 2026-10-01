import 'package:flutter/services.dart';

abstract class NotifyLoginSuccessBridge {
  const NotifyLoginSuccessBridge();

  Future<void> invoke({required MethodChannel channel});
}

class MethodChannelNotifyLoginSuccess extends NotifyLoginSuccessBridge {
  const MethodChannelNotifyLoginSuccess();

  static const String _name = 'notifyLoginSuccess';

  @override
  Future<void> invoke({required MethodChannel channel}) async {
    await channel.invokeMethod(_name);
  }
}
