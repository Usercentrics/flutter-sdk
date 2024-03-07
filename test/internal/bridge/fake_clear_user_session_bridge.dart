import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/src/internal/bridge/clear_user_session_bridge.dart';
import 'package:usercentrics_sdk/src/model/ready_status.dart';

class FakeClearUserSessionBridge extends ClearUserSessionBridge {
  FakeClearUserSessionBridge({
    this.invokeAnswer,
  });

  final UsercentricsReadyStatus? invokeAnswer;
  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;

  @override
  Future<UsercentricsReadyStatus> invoke({
    required MethodChannel channel
  }) {
    invokeCount++;
    invokeChannelArgument = channel;
    return Future.value(invokeAnswer!);
  }
}
