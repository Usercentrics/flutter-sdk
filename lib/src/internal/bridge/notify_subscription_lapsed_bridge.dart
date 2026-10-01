import 'package:flutter/services.dart';

abstract class NotifySubscriptionLapsedBridge {
  const NotifySubscriptionLapsedBridge();

  Future<void> invoke({required MethodChannel channel});
}

class MethodChannelNotifySubscriptionLapsed
    extends NotifySubscriptionLapsedBridge {
  const MethodChannelNotifySubscriptionLapsed();

  static const String _name = 'notifySubscriptionLapsed';

  @override
  Future<void> invoke({required MethodChannel channel}) async {
    await channel.invokeMethod(_name);
  }
}
