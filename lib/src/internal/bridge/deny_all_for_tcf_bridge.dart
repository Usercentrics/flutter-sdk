import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/serializer/consent_serializer.dart';
import 'package:usercentrics_sdk/src/internal/serializer/consent_type_serializer.dart';
import 'package:usercentrics_sdk/src/internal/serializer/tcf_decision_ui_layer_serializer.dart';
import 'package:usercentrics_sdk/src/model/model.dart';

abstract class DenyAllForTCFBridge {
  const DenyAllForTCFBridge();

  Future<List<UsercentricsServiceConsent>> invoke({
    required MethodChannel channel,
    required TCFDecisionUILayer fromLayer,
    required UsercentricsConsentType consentType,
    Map<int, bool>? unsavedPurposeLIDecisions,
    Map<int, bool>? unsavedVendorLIDecisions,
  });
}

class MethodChannelDenyAllForTCF extends DenyAllForTCFBridge {
  const MethodChannelDenyAllForTCF();

  static const String _name = 'denyAllForTCF';

  @override
  Future<List<UsercentricsServiceConsent>> invoke({
    required MethodChannel channel,
    required TCFDecisionUILayer fromLayer,
    required UsercentricsConsentType consentType,
    Map<int, bool>? unsavedPurposeLIDecisions,
    Map<int, bool>? unsavedVendorLIDecisions,
  }) async {
    final result = await channel.invokeMethod(
      _name,
      {
        'fromLayer': TCFDecisionUILayerSerializer.serialize(fromLayer),
        'consentType': ConsentTypeSerializer.serialize(consentType),
        if (unsavedPurposeLIDecisions != null)
          'unsavedPurposeLIDecisions': unsavedPurposeLIDecisions,
        if (unsavedVendorLIDecisions != null)
          'unsavedVendorLIDecisions': unsavedVendorLIDecisions,
      },
    );
    return (result as List)
        .map((e) => ConsentSerializer.deserialize(e))
        .toList();
  }
}
