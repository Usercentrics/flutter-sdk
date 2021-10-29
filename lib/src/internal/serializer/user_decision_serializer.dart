import 'package:usercentrics_sdk/src/model/user_decision.dart';

class UserDecisionSerializer {
  static dynamic serialize(UserDecision value) => {
        'serviceId': value.serviceId,
        'consent': value.consent,
      };
}

class TCFUserDecisionsSerializer {
  static dynamic serialize(TCFUserDecisions value) => {
        'purposes': value.purposes.map((e) => _serializePurpose(e)).toList(),
        'specialFeatures':
            value.specialFeatures.map((e) => _serializeFeature(e)).toList(),
        'vendors': value.vendors.map((e) => _serializeVendor(e)).toList(),
      };

  static dynamic _serializePurpose(TCFUserDecisionOnPurpose value) => {
        'id': value.id,
        'consent': value.consent,
        'legitimateInterestConsent': value.legitimateInterestConsent,
      };

  static dynamic _serializeFeature(TCFUserDecisionOnSpecialFeature value) => {
        'id': value.id,
        'consent': value.consent,
      };

  static dynamic _serializeVendor(TCFUserDecisionOnVendor value) => {
        'id': value.id,
        'consent': value.consent,
        'legitimateInterestConsent': value.legitimateInterestConsent,
      };
}
