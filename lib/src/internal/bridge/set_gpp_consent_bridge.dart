import 'package:flutter/services.dart';

abstract class SetGPPConsentBridge {
  const SetGPPConsentBridge();

  Future<void> invoke({
    required MethodChannel channel,
    required String sectionName,
    required String fieldName,
    required dynamic value,
  });
}

class MethodChannelSetGPPConsent extends SetGPPConsentBridge {
  const MethodChannelSetGPPConsent();

  static const String _name = 'setGPPConsent';

  @override
  Future<void> invoke({
    required MethodChannel channel,
    required String sectionName,
    required String fieldName,
    required dynamic value,
  }) async {
    await channel.invokeMethod(
      _name,
      {
        'sectionName': sectionName,
        'fieldName': fieldName,
        'value': value,
      },
    );
  }
}
