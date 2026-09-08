import 'package:flutter/services.dart';

abstract class NotifySubscribeSuccessBridge {
  const NotifySubscribeSuccessBridge();

  Future<void> invoke({required MethodChannel channel});
}

class MethodChannelNotifySubscribeSuccess extends NotifySubscribeSuccessBridge {
  const MethodChannelNotifySubscribeSuccess();

  static const String _name = 'notifySubscribeSuccess';

  @override
  Future<void> invoke({required MethodChannel channel}) async {
    await channel.invokeMethod(_name);
  }
}
