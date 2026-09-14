import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/src/internal/bridge/notify_subscription_lapsed_bridge.dart';

class FakeNotifySubscriptionLapsedBridge
    extends NotifySubscriptionLapsedBridge {
  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;

  @override
  Future<void> invoke({required MethodChannel channel}) {
    invokeCount++;
    invokeChannelArgument = channel;
    return Future.value(null);
  }
}
