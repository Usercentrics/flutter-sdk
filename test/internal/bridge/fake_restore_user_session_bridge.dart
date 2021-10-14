import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/internal/bridge/restore_user_session_bridge.dart';
import 'package:usercentrics_sdk/model/ready_status.dart';

class FakeRestoreUserSessionBridge extends RestoreUserSessionBridge {
  FakeRestoreUserSessionBridge({
    this.invokeAnswer,
  });

  final UsercentricsReadyStatus? invokeAnswer;
  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;
  String? invokeControllerIdArgument;

  @override
  Future<UsercentricsReadyStatus> invoke({
    required MethodChannel channel,
    required String controllerId,
  }) {
    invokeCount++;
    invokeControllerIdArgument = controllerId;
    invokeChannelArgument = channel;
    return Future.value(invokeAnswer!);
  }
}
