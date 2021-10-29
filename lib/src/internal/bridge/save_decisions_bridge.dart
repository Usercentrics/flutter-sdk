import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/serializer/consent_serializer.dart';
import 'package:usercentrics_sdk/src/internal/serializer/consent_type_serializer.dart';
import 'package:usercentrics_sdk/src/internal/serializer/user_decision_serializer.dart';
import 'package:usercentrics_sdk/src/model/model.dart';
import 'package:usercentrics_sdk/src/model/user_decision.dart';

abstract class SaveDecisionsBridge {
  const SaveDecisionsBridge();

  Future<List<UsercentricsServiceConsent>> invoke({
    required MethodChannel channel,
    required List<UserDecision> decisions,
    required UsercentricsConsentType consentType,
  });
}

class MethodChannelSaveDecisions extends SaveDecisionsBridge {
  const MethodChannelSaveDecisions();

  static const String _name = 'saveDecisions';

  @override
  Future<List<UsercentricsServiceConsent>> invoke({
    required MethodChannel channel,
    required List<UserDecision> decisions,
    required UsercentricsConsentType consentType,
  }) async {
    final result = await channel.invokeMethod(
      _name,
      {
        'decisions':
            decisions.map((e) => UserDecisionSerializer.serialize(e)).toList(),
        'consentType': ConsentTypeSerializer.serialize(consentType),
      },
    );
    return (result as List)
        .map((e) => ConsentSerializer.deserialize(e))
        .toList();
  }
}
