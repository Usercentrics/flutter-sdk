import 'package:flutter/foundation.dart';

/// The user consent decision about a service.
class UserDecision {
  const UserDecision({
    required this.serviceId,
    required this.consent,
  });

  /// The service ID. Also known as 'Template ID'.
  final String serviceId;

  /// True if the consent was given. False if not.
  final bool consent;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDecision &&
          runtimeType == other.runtimeType &&
          serviceId == other.serviceId &&
          consent == other.consent;

  @override
  int get hashCode => serviceId.hashCode + consent.hashCode;

  @override
  String toString() =>
      "$UserDecision(serviceId: $serviceId, consent: $consent)";
}

/// The user consent decision on all TCF options.
class TCFUserDecisions {
  const TCFUserDecisions({
    required this.purposes,
    required this.specialFeatures,
    required this.vendors,
    required this.adTechProviders,
  });

  /// A user's consent decision on TCF purposes.
  final List<TCFUserDecisionOnPurpose> purposes;

  /// A user's consent decision on TCF special features.
  final List<TCFUserDecisionOnSpecialFeature> specialFeatures;

  /// A user's consent decision on TCF vendors.
  final List<TCFUserDecisionOnVendor> vendors;

  /// A user's consent decision on Ad Tech Providers.
  final List<AdTechProviderDecision> adTechProviders;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TCFUserDecisions &&
          runtimeType == other.runtimeType &&
          listEquals(purposes, other.purposes) &&
          listEquals(specialFeatures, other.specialFeatures) &&
          listEquals(vendors, other.vendors);

  @override
  int get hashCode =>
      purposes.hashCode + specialFeatures.hashCode + vendors.hashCode;

  @override
  String toString() =>
      "$TCFUserDecisions(purposes: $purposes, specialFeatures: $specialFeatures, vendors: $vendors)";
}

/// The user consent decision for a single purpose.
class TCFUserDecisionOnPurpose {
  const TCFUserDecisionOnPurpose({
    required this.id,
    required this.consent,
    required this.legitimateInterestConsent,
  });

  final int id;
  final bool? consent;
  final bool? legitimateInterestConsent;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TCFUserDecisionOnPurpose &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          consent == other.consent &&
          legitimateInterestConsent == other.legitimateInterestConsent;

  @override
  int get hashCode =>
      id.hashCode + consent.hashCode + legitimateInterestConsent.hashCode;

  @override
  String toString() =>
      "$TCFUserDecisionOnPurpose(id: $id, consent: $consent, legitimateInterestConsent: $legitimateInterestConsent)";
}

/// The user consent decision for a single special feature.
class TCFUserDecisionOnSpecialFeature {
  const TCFUserDecisionOnSpecialFeature({
    required this.id,
    required this.consent,
  });

  final int id;
  final bool? consent;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TCFUserDecisionOnSpecialFeature &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          consent == other.consent;

  @override
  int get hashCode => id.hashCode + consent.hashCode;

  @override
  String toString() =>
      "$TCFUserDecisionOnSpecialFeature(id: $id, consent: $consent)";
}

/// The user consent decision for a single vendor.
class TCFUserDecisionOnVendor {
  const TCFUserDecisionOnVendor({
    required this.id,
    required this.consent,
    required this.legitimateInterestConsent,
  });

  final int id;
  final bool? consent;
  final bool? legitimateInterestConsent;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TCFUserDecisionOnVendor &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          consent == other.consent &&
          legitimateInterestConsent == other.legitimateInterestConsent;

  @override
  int get hashCode =>
      id.hashCode + consent.hashCode + legitimateInterestConsent.hashCode;

  @override
  String toString() =>
      "$TCFUserDecisionOnVendor(id: $id, consent: $consent, legitimateInterestConsent: $legitimateInterestConsent)";
}

class AdTechProviderDecision {
  const AdTechProviderDecision ({
    required this.id,
    required this.consent
});

  final int id;
  final bool consent;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TCFUserDecisionOnVendor &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              consent == other.consent;

  @override
  int get hashCode =>
      id.hashCode + consent.hashCode;

  @override
  String toString() =>
      "$AdTechProviderDecision(id: $id, consent: $consent)";
}
