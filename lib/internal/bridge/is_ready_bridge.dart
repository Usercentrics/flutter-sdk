import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/internal/serializer/ready_status_serializer.dart';
import 'package:usercentrics_sdk/model/ready_status.dart';

class IsReadyBridge {
  static const String _name = 'isReady';

  static Future<UsercentricsReadyStatus> invoke({
    required MethodChannel channel,
  }) async {
    final result = await channel.invokeMethod(_name);
    return ReadyStatusSerializer.deserialize(result);
  }
}
