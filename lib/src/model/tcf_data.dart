import 'package:flutter/foundation.dart';

/// All the data that needs to be disclosed to the end-user if TCF is enabled.
class TCFData {
  const TCFData({
    required this.features,
    required this.purposes,
    required this.specialFeatures,
    required this.specialPurposes,
    required this.stacks,
    required this.vendors,
    required this.tcString,
  });

  /// A list of all the TCF features that need to be disclosed to the end-user if TCF is enabled.
  final List<TCFFeature> features;

  /// A list of all the TCF purposes that need to be disclosed to the end-user if TCF is enabled.
  final List<TCFPurpose> purposes;

  /// A list of all the TCF special features that need to be disclosed to the end-user if TCF is enabled
  final List<TCFSpecialFeature> specialFeatures;

  /// A list of all the TCF special purposes that need to be disclosed to the end-user if TCF is enabled
  final List<TCFSpecialPurpose> specialPurposes;

  /// A list of all TCF stacks that need to be disclosed to the end-user if TCF is enabled. On the first layer of a
  /// TCF UI, stacks may be shown as alternative its comprising purposes and special features. However, on the second
  /// layer, this is not allowed according to the IAB TCF v.2.0 guidelines. Also on the first layer, a purpose or special
  /// feature may not be shown if a stack containing this purpose or special feature is already displayed. Note, that all
  /// purposes and special features that are part of stacks will still be listed in the TCFData purposes and special
  /// features fields, but they will be flagged with isPartOfASelectedStack = true and include a non-null stackId.
  final List<TCFStack> stacks;

  /// A list of all TCF vendors that need to be disclosed to the end-user if TCF is enabled
  final List<TCFVendor> vendors;

  /// The encoded IAB TCString
  final String tcString;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TCFData &&
          runtimeType == other.runtimeType &&
          listEquals(features, other.features) &&
          listEquals(purposes, other.purposes) &&
          listEquals(specialFeatures, other.specialFeatures) &&
          listEquals(specialPurposes, other.specialPurposes) &&
          listEquals(stacks, other.stacks) &&
          listEquals(vendors, other.vendors) &&
          tcString == other.tcString;

  @override
  int get hashCode =>
      features.hashCode +
      purposes.hashCode +
      specialFeatures.hashCode +
      specialPurposes.hashCode +
      stacks.hashCode +
      vendors.hashCode +
      tcString.hashCode;

  @override
  String toString() => "$TCFData($tcString)";
}

/// A TCF feature that needs to be disclosed to the end-user.
class TCFFeature {
  const TCFFeature({
    required this.purposeDescription,
    required this.descriptionLegal,
    required this.id,
    required this.name,
  });

  final String purposeDescription;
  final String descriptionLegal;
  final int id;
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TCFFeature &&
          runtimeType == other.runtimeType &&
          purposeDescription == other.purposeDescription &&
          descriptionLegal == other.descriptionLegal &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode =>
      purposeDescription.hashCode +
      descriptionLegal.hashCode +
      id.hashCode +
      name.hashCode;

  @override
  String toString() => "$TCFFeature(id: $id)";
}

/// TCF purpose that needs to be disclosed to the end-user and requires the end-user's consent and legitimate interest consent.
class TCFPurpose {
  const TCFPurpose({
    required this.purposeDescription,
    required this.descriptionLegal,
    required this.id,
    required this.name,
    required this.consent,
    required this.isPartOfASelectedStack,
    required this.legitimateInterestConsent,
    required this.showConsentToggle,
    required this.showLegitimateInterestToggle,
    required this.stackId,
  });

  final String purposeDescription;
  final String descriptionLegal;
  final int id;
  final String name;
  final bool? consent;
  final bool isPartOfASelectedStack;
  final bool? legitimateInterestConsent;
  final bool showConsentToggle;
  final bool showLegitimateInterestToggle;
  final int? stackId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TCFPurpose &&
          runtimeType == other.runtimeType &&
          purposeDescription == other.purposeDescription &&
          descriptionLegal == other.descriptionLegal &&
          id == other.id &&
          name == other.name &&
          consent == other.consent &&
          isPartOfASelectedStack == other.isPartOfASelectedStack &&
          legitimateInterestConsent == other.legitimateInterestConsent &&
          showConsentToggle == other.showConsentToggle &&
          showLegitimateInterestToggle == other.showLegitimateInterestToggle &&
          stackId == other.stackId;

  @override
  int get hashCode =>
      purposeDescription.hashCode +
      descriptionLegal.hashCode +
      id.hashCode +
      name.hashCode +
      consent.hashCode +
      isPartOfASelectedStack.hashCode +
      legitimateInterestConsent.hashCode +
      showConsentToggle.hashCode +
      showLegitimateInterestToggle.hashCode +
      stackId.hashCode;

  @override
  String toString() => "$TCFPurpose(id: $id)";
}

/// A TCF special feature that needs to be disclosed to the end-user and requires the end-user's consent.
class TCFSpecialFeature {
  const TCFSpecialFeature({
    required this.purposeDescription,
    required this.descriptionLegal,
    required this.id,
    required this.name,
    required this.consent,
    required this.isPartOfASelectedStack,
    required this.stackId,
    required this.showConsentToggle,
  });

  final String purposeDescription;
  final String descriptionLegal;
  final int id;
  final String name;
  final bool? consent;
  final bool isPartOfASelectedStack;
  final int? stackId;
  final bool showConsentToggle;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TCFSpecialFeature &&
          runtimeType == other.runtimeType &&
          purposeDescription == other.purposeDescription &&
          descriptionLegal == other.descriptionLegal &&
          id == other.id &&
          name == other.name &&
          consent == other.consent &&
          isPartOfASelectedStack == other.isPartOfASelectedStack &&
          stackId == other.stackId &&
          showConsentToggle == other.showConsentToggle;

  @override
  int get hashCode =>
      purposeDescription.hashCode +
      descriptionLegal.hashCode +
      id.hashCode +
      name.hashCode +
      consent.hashCode +
      isPartOfASelectedStack.hashCode +
      stackId.hashCode +
      showConsentToggle.hashCode;

  @override
  String toString() => "$TCFSpecialFeature(id: $id)";
}

/// A TCF special purpose that needs to be disclosed to the end-user.
class TCFSpecialPurpose {
  const TCFSpecialPurpose({
    required this.purposeDescription,
    required this.descriptionLegal,
    required this.id,
    required this.name,
  });

  final String purposeDescription;
  final String descriptionLegal;
  final int id;
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TCFSpecialPurpose &&
          runtimeType == other.runtimeType &&
          purposeDescription == other.purposeDescription &&
          descriptionLegal == other.descriptionLegal &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode =>
      purposeDescription.hashCode +
      descriptionLegal.hashCode +
      id.hashCode +
      name.hashCode;

  @override
  String toString() => "$TCFSpecialPurpose(id: $id)";
}

/// A TCF stack is a collection of multiple TCF purposes and TCF special features, with one shared description. On the
/// first layer of a TCF UI, stacks may be shown as alternative to the included single purposes and special features.
class TCFStack {
  const TCFStack({
    required this.description,
    required this.id,
    required this.name,
    required this.purposeIds,
    required this.specialFeatureIds,
  });

  final String description;
  final int id;
  final String name;
  final List<int> purposeIds;
  final List<int> specialFeatureIds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TCFStack &&
          runtimeType == other.runtimeType &&
          description == other.description &&
          id == other.id &&
          name == other.name &&
          listEquals(purposeIds, other.purposeIds) &&
          listEquals(specialFeatureIds, other.specialFeatureIds);

  @override
  int get hashCode =>
      description.hashCode +
      id.hashCode +
      name.hashCode +
      purposeIds.hashCode +
      specialFeatureIds.hashCode;

  @override
  String toString() => "$TCFStack(id: $id)";
}

/// A TCF vendor (aka. advertiser, tracking service, third party) that is registered with the IAB global vendor list.
/// A TCF vendor needs to be disclosed to the end-user and requires the end-user's consent and legitimate interest consent.
class TCFVendor {
  const TCFVendor({
    required this.consent,
    required this.features,
    required this.flexiblePurposes,
    required this.id,
    required this.legitimateInterestConsent,
    required this.legitimateInterestPurposes,
    required this.name,
    required this.policyUrl,
    required this.purposes,
    required this.specialFeatures,
    required this.specialPurposes,
    required this.showConsentToggle,
    required this.showLegitimateInterestToggle,
    required this.cookieMaxAgeSeconds,
    required this.usesNonCookieAccess,
    required this.deviceStorageDisclosureUrl,
    required this.usesCookies,
    required this.cookieRefresh,
  });

  final bool? consent;
  final List<int> features;
  final List<int> flexiblePurposes;
  final int id;
  final bool? legitimateInterestConsent;
  final List<int> legitimateInterestPurposes;
  final String name;
  final String policyUrl;
  final List<int> purposes;
  final List<int> specialFeatures;
  final List<int> specialPurposes;
  final bool showConsentToggle;
  final bool showLegitimateInterestToggle;
  final double? cookieMaxAgeSeconds;
  final bool usesNonCookieAccess;
  final String? deviceStorageDisclosureUrl;
  final bool usesCookies;
  final bool? cookieRefresh;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TCFVendor &&
          runtimeType == other.runtimeType &&
          consent == other.consent &&
          listEquals(features, other.features) &&
          listEquals(flexiblePurposes, other.flexiblePurposes) &&
          id == other.id &&
          legitimateInterestConsent == other.legitimateInterestConsent &&
          listEquals(
              legitimateInterestPurposes, other.legitimateInterestPurposes) &&
          name == other.name &&
          policyUrl == other.policyUrl &&
          listEquals(purposes, other.purposes) &&
          listEquals(specialFeatures, other.specialFeatures) &&
          listEquals(specialPurposes, other.specialPurposes) &&
          showConsentToggle == other.showConsentToggle &&
          showLegitimateInterestToggle == other.showLegitimateInterestToggle &&
          cookieMaxAgeSeconds == other.cookieMaxAgeSeconds &&
          usesNonCookieAccess == other.usesNonCookieAccess &&
          deviceStorageDisclosureUrl == other.deviceStorageDisclosureUrl &&
          usesCookies == other.usesCookies &&
          cookieRefresh == other.cookieRefresh;

  @override
  int get hashCode =>
      consent.hashCode +
      features.hashCode +
      flexiblePurposes.hashCode +
      id.hashCode +
      legitimateInterestConsent.hashCode +
      legitimateInterestPurposes.hashCode +
      name.hashCode +
      policyUrl.hashCode +
      purposes.hashCode +
      specialFeatures.hashCode +
      specialPurposes.hashCode +
      showConsentToggle.hashCode +
      showLegitimateInterestToggle.hashCode +
      cookieMaxAgeSeconds.hashCode +
      usesNonCookieAccess.hashCode +
      deviceStorageDisclosureUrl.hashCode +
      usesCookies.hashCode +
      cookieRefresh.hashCode;

  @override
  String toString() => "$TCFVendor(id: $id)";
}
