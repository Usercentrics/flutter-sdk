import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/internal/bridge/bridge.dart';

class FakeResetBridge extends ResetBridge {
  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;

  @override
  void invoke({
    required MethodChannel channel,
  }) {
    invokeCount++;
    invokeChannelArgument = channel;
  }
}
