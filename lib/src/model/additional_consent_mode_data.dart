class AdditionalConsentModeData {
  const AdditionalConsentModeData(
      {
        required this.acString,
        required this.adTechProviders
      });

  final String acString;
  final List<AdTechProvider> adTechProviders;
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
}