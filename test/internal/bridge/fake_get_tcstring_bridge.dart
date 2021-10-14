import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/internal/bridge/get_tcstring_bridge.dart';

class FakeGetTCStringBridge extends GetTCStringBridge {
  FakeGetTCStringBridge({
    this.invokeAnswer,
  });

  final String? invokeAnswer;
  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;

  @override
  Future<String> invoke({required MethodChannel channel}) {
    invokeCount++;
    invokeChannelArgument = channel;
    return Future.value(invokeAnswer!);
  }
}
