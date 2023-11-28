import 'package:usercentrics_sdk/src/internal/serializer/consent_disclosure_object_serializer.dart';
import 'package:usercentrics_sdk/src/model/service.dart';

class ServiceSerializer {
  static UsercentricsService deserialize(dynamic value) {
    return UsercentricsService(
      templateId: value['templateId'] ?? "",
      version: value['version'] ?? "",
      categorySlug: value['categorySlug'] ?? "",
      type: value['type'] ?? "",
      dataProcessor: value['dataProcessor'] ?? "",
      dataPurposes: value['dataPurposes']?.cast<String>() ?? [],
      processingCompany: value['processingCompany'] ?? "",
      nameOfProcessingCompany: value['nameOfProcessingCompany'] ?? "",
      addressOfProcessingCompany: value['addressOfProcessingCompany'] ?? "",
      descriptionOfService: value['descriptionOfService'] ?? "",
      languagesAvailable: value['languagesAvailable']?.cast<String>() ?? [],
      dataCollectedList: value['dataCollectedList']?.cast<String>() ?? [],
      dataPurposesList: value['dataPurposesList']?.cast<String>() ?? [],
      dataRecipientsList: value['dataRecipientsList']?.cast<String>() ?? [],
      legalBasisList: value['legalBasisList']?.cast<String>() ?? [],
      retentionPeriodList: value['retentionPeriodList']?.cast<String>() ?? [],
      subConsents: value['subConsents']?.cast<String>() ?? [],
      technologyUsed: value['technologyUsed']?.cast<String>() ?? [],
      language: value['language'] ?? "",
      linkToDpa: value['linkToDpa'] ?? "",
      legalGround: value['legalGround'] ?? "",
      optOutUrl: value['optOutUrl'] ?? "",
      policyOfProcessorUrl: value['policyOfProcessorUrl'] ?? "",
      retentionPeriodDescription: value['retentionPeriodDescription'] ?? "",
      dataProtectionOfficer: value['dataProtectionOfficer'] ?? "",
      privacyPolicyURL: value['privacyPolicyURL'] ?? "",
      cookiePolicyURL: value['cookiePolicyURL'] ?? "",
      locationOfProcessing: value['locationOfProcessing'] ?? "",
      dataCollectedDescription: value['dataCollectedDescription'] ?? "",
      thirdCountryTransfer: value['thirdCountryTransfer'] ?? "",
      description: value['description'] ?? "",
      cookieMaxAgeSeconds: value['cookieMaxAgeSeconds'],
      usesNonCookieAccess: value['usesNonCookieAccess'],
      deviceStorageDisclosureUrl: value['deviceStorageDisclosureUrl'] ?? "",
      isDeactivated: value['isDeactivated'],
      disableLegalBasis: value['disableLegalBasis'],
      isEssential: value['isEssential'],
      deviceStorage:
          ConsentDisclosureObjectSerializer.deserialize(value['deviceStorage']),
      isHidden: value['isHidden'],
    );
  }
}
