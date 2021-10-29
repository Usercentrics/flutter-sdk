import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/serializer/consent_serializer.dart';
import 'package:usercentrics_sdk/src/internal/serializer/consent_type_serializer.dart';
import 'package:usercentrics_sdk/src/model/model.dart';

abstract class AcceptAllBridge {
  const AcceptAllBridge();

  Future<List<UsercentricsServiceConsent>> invoke({
    required MethodChannel channel,
    required UsercentricsConsentType consentType,
  });
}

class MethodChannelAcceptAll extends AcceptAllBridge {
  const MethodChannelAcceptAll();

  static const String _name = 'acceptAll';

  @override
  Future<List<UsercentricsServiceConsent>> invoke({
    required MethodChannel channel,
    required UsercentricsConsentType consentType,
  }) async {
    final result = await channel.invokeMethod(
      _name,
      ConsentTypeSerializer.serialize(consentType),
    );
    return (result as List)
        .map((e) => ConsentSerializer.deserialize(e))
        .toList();
  }
}
