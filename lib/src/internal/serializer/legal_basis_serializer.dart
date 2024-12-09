import 'package:usercentrics_sdk/src/model/legal_basis.dart';

class LegalBasisSerializer {
  static LegalBasisLocalization deserialize(dynamic value) {
    return LegalBasisLocalization(
        labelsAria: _deserializeTranslationAriaLabels(value['labelsAria']),
        data: _deserializeData(value['data']));
  }

  static TranslationAriaLabels _deserializeTranslationAriaLabels(
      dynamic value) {
    return TranslationAriaLabels(
        acceptAllButton: value['acceptAllButton'],
        ccpaButton: value['ccpaButton'],
        ccpaMoreInformation: value['ccpaMoreInformation'],
        closeButton: value['closeButton'],
        collapse: value['collapse'],
        cookiePolicyButton: value['cookiePolicyButton'],
        copyControllerId: value['copyControllerId'],
        denyAllButton: value['denyAllButton'],
        expand: value['expand'],
        fullscreenButton: value['fullscreenButton'],
        imprintButton: value['imprintButton'],
        languageSelector: value['languageSelector'],
        privacyButton: value['privacyButton'],
        privacyPolicyButton: value['privacyPolicyButton'],
        saveButton: value['saveButton'],
        serviceInCategoryDetails: value['serviceInCategoryDetails'],
        servicesInCategory: value['servicesInCategory'],
        tabButton: value['tabButton'],
        usercentricsCMPButtons: value['usercentricsCMPButtons'],
        usercentricsCMPContent: value['usercentricsCMPContent'],
        usercentricsCMPHeader: value['usercentricsCMPHeader'],
        usercentricsCMPUI: value['usercentricsCMPUI'],
        usercentricsCard: value['usercentricsCard'],
        usercentricsList: value['usercentricsList'],
        vendorConsentToggle: value['vendorConsentToggle'],
        vendorDetailedStorageInformation:
            value['vendorDetailedStorageInformation'],
        vendorLegIntToggle: value['vendorLegIntToggle']);
  }

  static Map<String, String> _deserializeData(dynamic value) {
    final Map<String, String> data = {};

    var map = (value as Map);

    for (var key in map.keys) {
      data[key] = map[key];
    }

    return data;
  }
}
