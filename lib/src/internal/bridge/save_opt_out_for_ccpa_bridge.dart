import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/serializer/consent_serializer.dart';
import 'package:usercentrics_sdk/src/internal/serializer/consent_type_serializer.dart';
import 'package:usercentrics_sdk/src/model/model.dart';

abstract class SaveOptOutForCCPABridge {
  const SaveOptOutForCCPABridge();

  Future<List<UsercentricsServiceConsent>> invoke({
    required MethodChannel channel,
    required bool isOptedOut,
    required UsercentricsConsentType consentType,
  });
}

class MethodChannelSaveOptOutForCCPA extends SaveOptOutForCCPABridge {
  const MethodChannelSaveOptOutForCCPA();

  static const String _name = 'saveOptOutForCCPA';

  @override
  Future<List<UsercentricsServiceConsent>> invoke({
    required MethodChannel channel,
    required bool isOptedOut,
    required UsercentricsConsentType consentType,
  }) async {
    final result = await channel.invokeMethod(
      _name,
      {
        'isOptedOut': isOptedOut,
        'consentType': ConsentTypeSerializer.serialize(consentType),
      },
    );
    return (result as List)
        .map((e) => ConsentSerializer.deserialize(e))
        .toList();
  }
}
