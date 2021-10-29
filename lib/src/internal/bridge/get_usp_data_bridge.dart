import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/serializer/ccpa_data_serializer.dart';
import 'package:usercentrics_sdk/src/model/ccpa_data.dart';

abstract class GetUSPDataBridge {
  const GetUSPDataBridge();

  Future<CCPAData> invoke({
    required MethodChannel channel,
  });
}

class MethodChannelGetUSPData extends GetUSPDataBridge {
  const MethodChannelGetUSPData();

  static const String _name = 'getUSPData';

  @override
  Future<CCPAData> invoke({
    required MethodChannel channel,
  }) async {
    final result = await channel.invokeMethod(_name);
    return CCPADataSerializer.deserialize(result);
  }
}
