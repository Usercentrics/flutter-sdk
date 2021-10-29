import 'package:flutter/foundation.dart';

/// A service.
class UsercentricsService {
  const UsercentricsService({
    required this.templateId,
    required this.version,
    required this.type,
    required this.dataProcessor,
    required this.dataPurposes,
    required this.processingCompany,
    required this.nameOfProcessingCompany,
    required this.addressOfProcessingCompany,
    required this.descriptionOfService,
    required this.languagesAvailable,
    required this.dataCollectedList,
    required this.dataPurposesList,
    required this.dataRecipientsList,
    required this.legalBasisList,
    required this.retentionPeriodList,
    required this.subConsents,
    required this.cookieNames,
    required this.language,
    required this.isLatest,
    required this.isShared,
    required this.shareCustomConsent,
    required this.linkToDpa,
    required this.defaultConsentStatus,
    required this.legalGround,
    required this.optOutUrl,
    required this.policyOfProcessorUrl,
    required this.categorySlug,
    required this.retentionPeriod,
    required this.retentionPeriodDescription,
    required this.iabId,
    required this.iabv2Id,
    required this.dataProtectionOfficer,
    required this.privacyPolicyURL,
    required this.cookiePolicyURL,
    required this.locationOfProcessing,
    required this.dataCollectedDescription,
    required this.dataPurposesDescription,
    required this.legalBasisDescription,
    required this.optOutDescription,
    required this.thirdCountryTransfer,
    required this.defaultCategoryLabel,
    required this.description,
    required this.cookieMaxAgeSeconds,
    required this.usesNonCookieAccess,
    required this.deviceStorageDisclosureUrl,
    required this.isDeactivated,
    required this.disableLegalBasis,
  });

  /// The template ID of the service.
  final String templateId;

  /// The version of the service.
  final String version;

  /// The category slug identifier of the service.
  final String categorySlug;

  final String type;
  final String dataProcessor;
  final List<String> dataPurposes;
  final String processingCompany;
  final String nameOfProcessingCompany;
  final String addressOfProcessingCompany;
  final String descriptionOfService;
  final List<String> languagesAvailable;
  final List<String> dataCollectedList;
  final List<String> dataPurposesList;
  final List<String> dataRecipientsList;
  final List<String> legalBasisList;
  final List<String> retentionPeriodList;
  final List<String> subConsents;
  final List<String> cookieNames;
  final String language;
  final bool? isLatest;
  final bool? isShared;
  final String shareCustomConsent;
  final String linkToDpa;
  final bool? defaultConsentStatus;
  final String legalGround;
  final String optOutUrl;
  final String policyOfProcessorUrl;
  final int retentionPeriod;
  final String retentionPeriodDescription;
  final String iabId;
  final String iabv2Id;
  final String dataProtectionOfficer;
  final String privacyPolicyURL;
  final String cookiePolicyURL;
  final String locationOfProcessing;
  final String dataCollectedDescription;
  final String dataPurposesDescription;
  final String legalBasisDescription;
  final String optOutDescription;
  final String thirdCountryTransfer;
  final String defaultCategoryLabel;
  final String description;
  final int? cookieMaxAgeSeconds;
  final bool? usesNonCookieAccess;
  final String deviceStorageDisclosureUrl;
  final bool? isDeactivated;
  final bool? disableLegalBasis;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsService &&
          runtimeType == other.runtimeType &&
          templateId == other.templateId &&
          version == other.version &&
          categorySlug == other.categorySlug &&
          type == other.type &&
          dataProcessor == other.dataProcessor &&
          listEquals(dataPurposes, other.dataPurposes) &&
          processingCompany == other.processingCompany &&
          nameOfProcessingCompany == other.nameOfProcessingCompany &&
          addressOfProcessingCompany == other.addressOfProcessingCompany &&
          descriptionOfService == other.descriptionOfService &&
          listEquals(languagesAvailable, other.languagesAvailable) &&
          listEquals(dataCollectedList, other.dataCollectedList) &&
          listEquals(dataPurposesList, other.dataPurposesList) &&
          listEquals(dataRecipientsList, other.dataRecipientsList) &&
          listEquals(legalBasisList, other.legalBasisList) &&
          listEquals(retentionPeriodList, other.retentionPeriodList) &&
          listEquals(subConsents, other.subConsents) &&
          listEquals(cookieNames, other.cookieNames) &&
          language == other.language &&
          isLatest == other.isLatest &&
          isShared == other.isShared &&
          shareCustomConsent == other.shareCustomConsent &&
          linkToDpa == other.linkToDpa &&
          defaultConsentStatus == other.defaultConsentStatus &&
          legalGround == other.legalGround &&
          optOutUrl == other.optOutUrl &&
          policyOfProcessorUrl == other.policyOfProcessorUrl &&
          retentionPeriod == other.retentionPeriod &&
          retentionPeriodDescription == other.retentionPeriodDescription &&
          iabId == other.iabId &&
          iabv2Id == other.iabv2Id &&
          dataProtectionOfficer == other.dataProtectionOfficer &&
          privacyPolicyURL == other.privacyPolicyURL &&
          cookiePolicyURL == other.cookiePolicyURL &&
          locationOfProcessing == other.locationOfProcessing &&
          dataCollectedDescription == other.dataCollectedDescription &&
          dataPurposesDescription == other.dataPurposesDescription &&
          legalBasisDescription == other.legalBasisDescription &&
          optOutDescription == other.optOutDescription &&
          thirdCountryTransfer == other.thirdCountryTransfer &&
          defaultCategoryLabel == other.defaultCategoryLabel &&
          description == other.description &&
          cookieMaxAgeSeconds == other.cookieMaxAgeSeconds &&
          usesNonCookieAccess == other.usesNonCookieAccess &&
          deviceStorageDisclosureUrl == other.deviceStorageDisclosureUrl &&
          isDeactivated == other.isDeactivated &&
          disableLegalBasis == other.disableLegalBasis;

  @override
  int get hashCode =>
      templateId.hashCode +
      version.hashCode +
      categorySlug.hashCode +
      type.hashCode +
      dataProcessor.hashCode +
      dataPurposes.hashCode +
      processingCompany.hashCode +
      nameOfProcessingCompany.hashCode +
      addressOfProcessingCompany.hashCode +
      descriptionOfService.hashCode +
      languagesAvailable.hashCode +
      dataCollectedList.hashCode +
      dataPurposesList.hashCode +
      dataRecipientsList.hashCode +
      legalBasisList.hashCode +
      retentionPeriodList.hashCode +
      subConsents.hashCode +
      cookieNames.hashCode +
      language.hashCode +
      isLatest.hashCode +
      isShared.hashCode +
      shareCustomConsent.hashCode +
      linkToDpa.hashCode +
      defaultConsentStatus.hashCode +
      legalGround.hashCode +
      optOutUrl.hashCode +
      policyOfProcessorUrl.hashCode +
      retentionPeriod.hashCode +
      retentionPeriodDescription.hashCode +
      iabId.hashCode +
      iabv2Id.hashCode +
      dataProtectionOfficer.hashCode +
      privacyPolicyURL.hashCode +
      cookiePolicyURL.hashCode +
      locationOfProcessing.hashCode +
      dataCollectedDescription.hashCode +
      dataPurposesDescription.hashCode +
      legalBasisDescription.hashCode +
      optOutDescription.hashCode +
      thirdCountryTransfer.hashCode +
      defaultCategoryLabel.hashCode +
      description.hashCode +
      cookieMaxAgeSeconds.hashCode +
      usesNonCookieAccess.hashCode +
      deviceStorageDisclosureUrl.hashCode +
      isDeactivated.hashCode +
      disableLegalBasis.hashCode;

  @override
  String toString() =>
      "$UsercentricsService(templateId: $templateId, version: $version, categorySlug: $categorySlug, language: $language)";
}
