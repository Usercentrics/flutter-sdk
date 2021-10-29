import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/serializer/tcf_data_serializer.dart';
import 'package:usercentrics_sdk/src/model/tcf_data.dart';

abstract class GetTCFDataBridge {
  const GetTCFDataBridge();

  Future<TCFData> invoke({
    required MethodChannel channel,
  });
}

class MethodChannelGetTCFData extends GetTCFDataBridge {
  const MethodChannelGetTCFData();

  static const String _name = 'getTCFData';

  @override
  Future<TCFData> invoke({
    required MethodChannel channel,
  }) async {
    final result = await channel.invokeMethod(_name);
    return TCFDataSerializer.deserialize(result);
  }
}
