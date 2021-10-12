import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/internal/serializer/ready_status_serializer.dart';
import 'package:usercentrics_sdk/model/ready_status.dart';

class RestoreUserSessionBridge {
  static const String _name = 'restoreUserSession';

  static Future<UsercentricsReadyStatus> invoke({
    required MethodChannel channel,
    required String controllerId,
  }) async {
    final result = await channel.invokeMethod(_name, controllerId);
    return ReadyStatusSerializer.deserialize(result);
  }
}
