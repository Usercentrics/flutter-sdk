/// {@nodoc}
library restore_user_session_bridge;

import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/internal/serializer/ready_status_serializer.dart';
import 'package:usercentrics_sdk/model/ready_status.dart';

abstract class RestoreUserSessionBridge {
  const RestoreUserSessionBridge();

  Future<UsercentricsReadyStatus> invoke({
    required MethodChannel channel,
    required String controllerId,
  });
}

class MethodChannelRestoreUserSession extends RestoreUserSessionBridge {
  const MethodChannelRestoreUserSession();

  static const String _name = 'restoreUserSession';

  @override
  Future<UsercentricsReadyStatus> invoke({
    required MethodChannel channel,
    required String controllerId,
  }) async {
    final result = await channel.invokeMethod(_name, controllerId);
    return ReadyStatusSerializer.deserialize(result);
  }
}
