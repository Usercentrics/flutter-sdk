import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/model/ready_status.dart';

class FakeIsReadyBridge extends IsReadyBridge {
  FakeIsReadyBridge({
    this.invokeAnswer,
  });

  final UsercentricsReadyStatus? invokeAnswer;
  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;

  @override
  Future<UsercentricsReadyStatus> invoke({
    required MethodChannel channel,
  }) {
    invokeCount++;
    invokeChannelArgument = channel;
    return Future.value(invokeAnswer!);
  }
}
