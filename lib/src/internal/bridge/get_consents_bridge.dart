import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/serializer/consent_serializer.dart';
import 'package:usercentrics_sdk/src/model/service_consent.dart';

abstract class GetConsentsBridge {
  const GetConsentsBridge();

  Future<List<UsercentricsServiceConsent>> invoke({
    required MethodChannel channel,
  });
}

class MethodChannelGetConsents extends GetConsentsBridge {
  const MethodChannelGetConsents();

  static const String _name = 'getConsents';

  @override
  Future<List<UsercentricsServiceConsent>> invoke({
    required MethodChannel channel,
  }) async {
    final result = await channel.invokeMethod(_name);
    return (result as List)
        .map((e) => ConsentSerializer.deserialize(e))
        .toList();
  }
}
