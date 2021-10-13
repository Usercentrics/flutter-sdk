import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/internal/serializer/ready_status_serializer.dart';
import 'package:usercentrics_sdk/model/ready_status.dart';

abstract class IsReadyBridge {
  const IsReadyBridge();

  Future<UsercentricsReadyStatus> invoke({
    required MethodChannel channel,
  });
}

class MethodChannelIsReady extends IsReadyBridge {
  const MethodChannelIsReady();

  static const String _name = 'isReady';

  @override
  Future<UsercentricsReadyStatus> invoke({
    required MethodChannel channel,
  }) async {
    final result = await channel.invokeMethod(_name);
    return ReadyStatusSerializer.deserialize(result);
  }
}
