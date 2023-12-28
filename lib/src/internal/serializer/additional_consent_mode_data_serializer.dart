import 'package:usercentrics_sdk/src/model/additional_consent_mode_data.dart';

class AdditionalConsentModeDataSerializer {
  static AdditionalConsentModeData deserialize(dynamic value) {
    return AdditionalConsentModeData(
        acString: value['acString'],
        adTechProviders: (value['adTechProviders'] as List)
            .map((e) => _deserializeAdTechProviders(e))
            .toList());
  }

  static AdTechProvider _deserializeAdTechProviders(dynamic value) {
    return AdTechProvider(
        id: value['id'],
        name: value['name'],
        privacyPolicyUrl: value['privacyPolicyUrl'],
        consent: value['consent']);
  }
}
