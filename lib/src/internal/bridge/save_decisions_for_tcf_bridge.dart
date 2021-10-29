import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/serializer/consent_serializer.dart';
import 'package:usercentrics_sdk/src/internal/serializer/consent_type_serializer.dart';
import 'package:usercentrics_sdk/src/internal/serializer/tcf_decision_ui_layer_serializer.dart';
import 'package:usercentrics_sdk/src/internal/serializer/user_decision_serializer.dart';
import 'package:usercentrics_sdk/src/model/model.dart';
import 'package:usercentrics_sdk/src/model/tcf_decision_ui_layer.dart';
import 'package:usercentrics_sdk/src/model/user_decision.dart';

abstract class SaveDecisionsForTCFBridge {
  const SaveDecisionsForTCFBridge();

  Future<List<UsercentricsServiceConsent>> invoke({
    required MethodChannel channel,
    required TCFUserDecisions tcfDecisions,
    required TCFDecisionUILayer fromLayer,
    required List<UserDecision> serviceDecisions,
    required UsercentricsConsentType consentType,
  });
}

class MethodChannelSaveDecisionsForTCF extends SaveDecisionsForTCFBridge {
  const MethodChannelSaveDecisionsForTCF();

  static const String _name = 'saveDecisionsForTCF';

  @override
  Future<List<UsercentricsServiceConsent>> invoke({
    required MethodChannel channel,
    required TCFUserDecisions tcfDecisions,
    required TCFDecisionUILayer fromLayer,
    required List<UserDecision> serviceDecisions,
    required UsercentricsConsentType consentType,
  }) async {
    final result = await channel.invokeMethod(
      _name,
      {
        'tcfDecisions': TCFUserDecisionsSerializer.serialize(tcfDecisions),
        'fromLayer': TCFDecisionUILayerSerializer.serialize(fromLayer),
        'serviceDecisions':
            serviceDecisions.map((e) => UserDecisionSerializer.serialize(e)).toList(),
        'consentType': ConsentTypeSerializer.serialize(consentType),
      },
    );
    return (result as List)
        .map((e) => ConsentSerializer.deserialize(e))
        .toList();
  }
}
