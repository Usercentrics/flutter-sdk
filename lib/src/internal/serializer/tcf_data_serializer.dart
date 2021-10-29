import 'package:usercentrics_sdk/src/model/tcf_data.dart';

class TCFDataSerializer {
  static TCFData deserialize(dynamic value) {
    return TCFData(
      features: (value['features'] as List)
          .map((e) => _deserializeFeature(e))
          .toList(),
      purposes: (value['purposes'] as List)
          .map((e) => _deserializePurpose(e))
          .toList(),
      specialFeatures: (value['specialFeatures'] as List)
          .map((e) => _deserializeSpecialFeature(e))
          .toList(),
      specialPurposes: (value['specialPurposes'] as List)
          .map((e) => _deserializeSpecialPurpose(e))
          .toList(),
      stacks:
          (value['stacks'] as List).map((e) => _deserializeStack(e)).toList(),
      vendors:
          (value['vendors'] as List).map((e) => _deserializeVendor(e)).toList(),
    );
  }

  static TCFFeature _deserializeFeature(dynamic value) {
    return TCFFeature(
      purposeDescription: value['purposeDescription'],
      descriptionLegal: value['descriptionLegal'],
      id: value['id'],
      name: value['name'],
    );
  }

  static TCFPurpose _deserializePurpose(dynamic value) {
    return TCFPurpose(
      purposeDescription: value['purposeDescription'],
      descriptionLegal: value['descriptionLegal'],
      id: value['id'],
      name: value['name'],
      consent: value['consent'],
      isPartOfASelectedStack: value['isPartOfASelectedStack'],
      legitimateInterestConsent: value['legitimateInterestConsent'],
      showConsentToggle: value['showConsentToggle'],
      showLegitimateInterestToggle: value['showLegitimateInterestToggle'],
      stackId: value['stackId'],
    );
  }

  static TCFSpecialFeature _deserializeSpecialFeature(dynamic value) {
    return TCFSpecialFeature(
      purposeDescription: value['purposeDescription'],
      descriptionLegal: value['descriptionLegal'],
      id: value['id'],
      name: value['name'],
      consent: value['consent'],
      isPartOfASelectedStack: value['isPartOfASelectedStack'],
      stackId: value['stackId'],
      showConsentToggle: value['showConsentToggle'],
    );
  }

  static TCFSpecialPurpose _deserializeSpecialPurpose(dynamic value) {
    return TCFSpecialPurpose(
      purposeDescription: value['purposeDescription'],
      descriptionLegal: value['descriptionLegal'],
      id: value['id'],
      name: value['name'],
    );
  }

  static TCFStack _deserializeStack(dynamic value) {
    return TCFStack(
      description: value['description'],
      id: value['id'],
      name: value['name'],
      purposeIds: value['purposeIds']?.cast<int>() ?? [],
      specialFeatureIds: value['specialFeatureIds']?.cast<int>() ?? [],
    );
  }

  static TCFVendor _deserializeVendor(dynamic value) {
    return TCFVendor(
      consent: value['consent'],
      features: value['features']?.cast<int>() ?? [],
      flexiblePurposes: value['flexiblePurposes']?.cast<int>() ?? [],
      id: value['id'],
      legitimateInterestConsent: value['legitimateInterestConsent'],
      legitimateInterestPurposes:
          value['legitimateInterestPurposes']?.cast<int>() ?? [],
      name: value['name'],
      policyUrl: value['policyUrl'],
      purposes: value['purposes']?.cast<int>() ?? [],
      specialFeatures: value['specialFeatures']?.cast<int>() ?? [],
      specialPurposes: value['specialPurposes']?.cast<int>() ?? [],
      showConsentToggle: value['showConsentToggle'],
      showLegitimateInterestToggle: value['showLegitimateInterestToggle'],
      cookieMaxAgeSeconds: value['cookieMaxAgeSeconds'],
      usesNonCookieAccess: value['usesNonCookieAccess'],
      deviceStorageDisclosureUrl: value['deviceStorageDisclosureUrl'],
      usesCookies: value['usesCookies'],
      cookieRefresh: value['cookieRefresh'],
    );
  }
}
