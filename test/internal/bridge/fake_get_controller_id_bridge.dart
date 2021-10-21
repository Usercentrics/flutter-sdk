import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';

class FakeGetControllerIdBridge extends GetControllerIdBridge {
  FakeGetControllerIdBridge({
    this.invokeAnswer,
  });

  final String? invokeAnswer;
  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;

  @override
  Future<String> invoke({
    required MethodChannel channel,
  }) {
    invokeCount++;
    invokeChannelArgument = channel;
    return Future.value(invokeAnswer!);
  }
}
