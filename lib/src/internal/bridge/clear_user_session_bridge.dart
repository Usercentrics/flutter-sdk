import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/serializer/ready_status_serializer.dart';
import 'package:usercentrics_sdk/src/model/ready_status.dart';

abstract class ClearUserSessionBridge {
  const ClearUserSessionBridge();

  Future<UsercentricsReadyStatus> invoke({required MethodChannel channel});
}

class MethodChannelClearUserSession extends ClearUserSessionBridge {
  const MethodChannelClearUserSession();

  static const String _name = 'clearUserSession';

  @override
  Future<UsercentricsReadyStatus> invoke(
      {required MethodChannel channel}) async {
    final result = await channel.invokeMethod(_name);
    return ReadyStatusSerializer.deserialize(result);
  }
}
