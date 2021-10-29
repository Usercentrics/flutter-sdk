import 'package:flutter/services.dart';

abstract class SetCMPIdBridge {
  const SetCMPIdBridge();

  Future<void> invoke({
    required MethodChannel channel,
    required int id,
  });
}

class MethodChannelSetCMPId extends SetCMPIdBridge {
  const MethodChannelSetCMPId();

  static const String _name = 'setCMPId';

  @override
  Future<void> invoke({
    required MethodChannel channel,
    required int id,
  }) async {
    await channel.invokeMethod(
      _name,
      id,
    );
  }
}
