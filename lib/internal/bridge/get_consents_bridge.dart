import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/internal/serializer/consent_serializer.dart';
import 'package:usercentrics_sdk/model/service_consent.dart';

class GetConsentsBridge {
  static const String _name = 'getConsents';

  static Future<List<UsercentricsServiceConsent>> invoke({
    required MethodChannel channel,
  }) async {
    final result = channel.invokeMethod(_name);
    return (result as List)
        .map((e) => ConsentSerializer.deserialize(e))
        .toList();
  }
}
