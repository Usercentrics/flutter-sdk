import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/cmp_data.dart';

abstract class GetCMPDataBridge {
  const GetCMPDataBridge();

  Future<UsercentricsCMPData> invoke({
    required MethodChannel channel,
  });
}

class MethodChannelGetCMPData extends GetCMPDataBridge {
  const MethodChannelGetCMPData();

  static const String _name = 'getCMPData';

  @override
  Future<UsercentricsCMPData> invoke({
    required MethodChannel channel,
  }) async {
    final result = await channel.invokeMethod(_name);
    return CMPDataSerializer.deserialize(result);
  }
}
