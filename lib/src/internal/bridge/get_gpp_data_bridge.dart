import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/serializer/gpp_data_serializer.dart';
import 'package:usercentrics_sdk/src/model/gpp_data.dart';

abstract class GetGPPDataBridge {
  const GetGPPDataBridge();

  Future<GppData> invoke({
    required MethodChannel channel,
  });
}

class MethodChannelGetGPPData extends GetGPPDataBridge {
  const MethodChannelGetGPPData();

  static const String _name = 'getGPPData';

  @override
  Future<GppData> invoke({
    required MethodChannel channel,
  }) async {
    final result = await channel.invokeMethod(_name);
    return GppDataSerializer.deserialize(result);
  }
}
