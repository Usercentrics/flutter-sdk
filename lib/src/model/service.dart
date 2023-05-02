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
    required this.technologyUsed,
    required this.language,
    required this.linkToDpa,
    required this.legalGround,
    required this.optOutUrl,
    required this.policyOfProcessorUrl,
    required this.categorySlug,
    required this.retentionPeriodDescription,
    required this.dataProtectionOfficer,
    required this.privacyPolicyURL,
    required this.cookiePolicyURL,
    required this.locationOfProcessing,
    required this.dataCollectedDescription,
    required this.thirdCountryTransfer,
    required this.description,
    required this.cookieMaxAgeSeconds,
    required this.usesNonCookieAccess,
    required this.deviceStorageDisclosureUrl,
    required this.isDeactivated,
    required this.disableLegalBasis,
    required this.isEssential,
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
  final List<String> technologyUsed;
  final String language;
  final String linkToDpa;
  final String legalGround;
  final String optOutUrl;
  final String policyOfProcessorUrl;
  final String retentionPeriodDescription;
  final String dataProtectionOfficer;
  final String privacyPolicyURL;
  final String cookiePolicyURL;
  final String locationOfProcessing;
  final String dataCollectedDescription;
  final String thirdCountryTransfer;
  final String description;
  final int? cookieMaxAgeSeconds;
  final bool? usesNonCookieAccess;
  final String deviceStorageDisclosureUrl;
  final bool? isDeactivated;
  final bool? disableLegalBasis;
  final bool isEssential;

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
          language == other.language &&
          linkToDpa == other.linkToDpa &&
          legalGround == other.legalGround &&
          optOutUrl == other.optOutUrl &&
          policyOfProcessorUrl == other.policyOfProcessorUrl &&
          retentionPeriodDescription == other.retentionPeriodDescription &&
          dataProtectionOfficer == other.dataProtectionOfficer &&
          privacyPolicyURL == other.privacyPolicyURL &&
          cookiePolicyURL == other.cookiePolicyURL &&
          locationOfProcessing == other.locationOfProcessing &&
          dataCollectedDescription == other.dataCollectedDescription &&
          thirdCountryTransfer == other.thirdCountryTransfer &&
          description == other.description &&
          cookieMaxAgeSeconds == other.cookieMaxAgeSeconds &&
          usesNonCookieAccess == other.usesNonCookieAccess &&
          deviceStorageDisclosureUrl == other.deviceStorageDisclosureUrl &&
          isDeactivated == other.isDeactivated &&
          disableLegalBasis == other.disableLegalBasis &&
          isEssential == other.isEssential;

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
      language.hashCode +
      linkToDpa.hashCode +
      legalGround.hashCode +
      optOutUrl.hashCode +
      policyOfProcessorUrl.hashCode +
      retentionPeriodDescription.hashCode +
      dataProtectionOfficer.hashCode +
      privacyPolicyURL.hashCode +
      cookiePolicyURL.hashCode +
      locationOfProcessing.hashCode +
      dataCollectedDescription.hashCode +
      thirdCountryTransfer.hashCode +
      description.hashCode +
      cookieMaxAgeSeconds.hashCode +
      usesNonCookieAccess.hashCode +
      deviceStorageDisclosureUrl.hashCode +
      isDeactivated.hashCode +
      disableLegalBasis.hashCode +
      isEssential.hashCode;

  @override
  String toString() =>
      "$UsercentricsService(templateId: $templateId, version: $version, categorySlug: $categorySlug, language: $language)";
}
