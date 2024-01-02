import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/serializer/additional_consent_mode_data_serializer.dart';
import 'package:usercentrics_sdk/src/model/additional_consent_mode_data.dart';

abstract class GetAdditionalConsentModeDataBridge {
  const GetAdditionalConsentModeDataBridge();

  Future<AdditionalConsentModeData> invoke({required MethodChannel channel});
}

class MethodChannelGetAdditionalConsentModeData
    extends GetAdditionalConsentModeDataBridge {
  const MethodChannelGetAdditionalConsentModeData();

  static const String _name = 'getAdditionalConsentModeData';

  @override
  Future<AdditionalConsentModeData> invoke({
    required MethodChannel channel,
  }) async {
    final result = await channel.invokeMethod(_name);
    return AdditionalConsentModeDataSerializer.deserialize(result);
  }
}
