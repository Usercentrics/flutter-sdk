import 'package:flutter/foundation.dart';

class AdditionalConsentModeData {
  const AdditionalConsentModeData(
      {required this.acString, required this.adTechProviders});

  /// The encoded ac string containing the accepted vendors and the disclosed vendor
  final String acString;

  /// The list of the selected Ad Tech Providers
  final List<AdTechProvider> adTechProviders;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdditionalConsentModeData &&
          runtimeType == other.runtimeType &&
          acString == other.acString &&
          listEquals(adTechProviders, other.adTechProviders);

  @override
  int get hashCode =>
    acString.hashCode  ^
    adTechProviders.hashCode;

  @override
  String toString() => "$AdditionalConsentModeData($acString)";
}

class AdTechProvider {
  const AdTechProvider({
    required this.id,
    required this.name,
    required this.privacyPolicyUrl,
    required this.consent,
  });

  final int id;
  final String name;
  final String privacyPolicyUrl;
  final bool consent;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdTechProvider &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          privacyPolicyUrl == other.privacyPolicyUrl &&
          consent == other.consent;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      privacyPolicyUrl.hashCode ^
      consent.hashCode;

  @override
  String toString() => "$AdditionalConsentModeData($id, $name, $consent)";
}