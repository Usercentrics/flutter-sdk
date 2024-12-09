class LegalBasisLocalization {
  const LegalBasisLocalization({required this.labelsAria, required this.data});

  final TranslationAriaLabels labelsAria;
  final Map<String, String> data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LegalBasisLocalization &&
          runtimeType == other.runtimeType &&
          labelsAria == other.labelsAria &&
          data == other.data;

  @override
  int get hashCode => labelsAria.hashCode + data.hashCode;

  @override
  String toString() =>
      "LegalBasisLocalization(labelsAria: $labelsAria, data: $data)";
}

class TranslationAriaLabels {
  const TranslationAriaLabels(
      {required this.acceptAllButton,
      required this.ccpaButton,
      required this.ccpaMoreInformation,
      required this.closeButton,
      required this.collapse,
      required this.cookiePolicyButton,
      required this.copyControllerId,
      required this.denyAllButton,
      required this.expand,
      required this.fullscreenButton,
      required this.imprintButton,
      required this.languageSelector,
      required this.privacyButton,
      required this.privacyPolicyButton,
      required this.saveButton,
      required this.serviceInCategoryDetails,
      required this.servicesInCategory,
      required this.tabButton,
      required this.usercentricsCMPButtons,
      required this.usercentricsCMPContent,
      required this.usercentricsCMPHeader,
      required this.usercentricsCMPUI,
      required this.usercentricsCard,
      required this.usercentricsList,
      required this.vendorConsentToggle,
      required this.vendorDetailedStorageInformation,
      required this.vendorLegIntToggle});

  final String? acceptAllButton;
  final String? ccpaButton;
  final String? ccpaMoreInformation;
  final String? closeButton;
  final String? collapse;
  final String? cookiePolicyButton;
  final String? copyControllerId;
  final String? denyAllButton;
  final String? expand;
  final String? fullscreenButton;
  final String? imprintButton;
  final String? languageSelector;
  final String? privacyButton;
  final String? privacyPolicyButton;
  final String? saveButton;
  final String? serviceInCategoryDetails;
  final String? servicesInCategory;
  final String? tabButton;
  final String? usercentricsCMPButtons;
  final String? usercentricsCMPContent;
  final String? usercentricsCMPHeader;
  final String? usercentricsCMPUI;
  final String? usercentricsCard;
  final String? usercentricsList;
  final String? vendorConsentToggle;
  final String? vendorDetailedStorageInformation;
  final String? vendorLegIntToggle;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslationAriaLabels &&
          runtimeType == other.runtimeType &&
          acceptAllButton == other.acceptAllButton &&
          ccpaButton == other.ccpaButton &&
          ccpaMoreInformation == other.ccpaMoreInformation &&
          closeButton == other.closeButton &&
          collapse == other.collapse &&
          cookiePolicyButton == other.cookiePolicyButton &&
          copyControllerId == other.copyControllerId &&
          denyAllButton == other.denyAllButton &&
          expand == other.expand &&
          fullscreenButton == other.fullscreenButton &&
          imprintButton == other.imprintButton &&
          languageSelector == other.languageSelector &&
          privacyButton == other.privacyButton &&
          privacyPolicyButton == other.privacyPolicyButton &&
          saveButton == other.saveButton &&
          serviceInCategoryDetails == other.serviceInCategoryDetails &&
          servicesInCategory == other.servicesInCategory &&
          tabButton == other.tabButton &&
          usercentricsCMPButtons == other.usercentricsCMPButtons &&
          usercentricsCMPContent == other.usercentricsCMPContent &&
          usercentricsCMPHeader == other.usercentricsCMPHeader &&
          usercentricsCMPUI == other.usercentricsCMPUI &&
          usercentricsCard == other.usercentricsCard &&
          usercentricsList == other.usercentricsList &&
          vendorConsentToggle == other.vendorConsentToggle &&
          vendorDetailedStorageInformation ==
              other.vendorDetailedStorageInformation &&
          vendorLegIntToggle == other.vendorLegIntToggle;

  @override
  int get hashCode =>
      acceptAllButton.hashCode +
      ccpaButton.hashCode +
      ccpaMoreInformation.hashCode +
      closeButton.hashCode +
      collapse.hashCode +
      cookiePolicyButton.hashCode +
      copyControllerId.hashCode +
      denyAllButton.hashCode +
      expand.hashCode +
      fullscreenButton.hashCode +
      imprintButton.hashCode +
      languageSelector.hashCode +
      privacyButton.hashCode +
      privacyPolicyButton.hashCode +
      saveButton.hashCode +
      serviceInCategoryDetails.hashCode +
      servicesInCategory.hashCode +
      tabButton.hashCode +
      usercentricsCMPButtons.hashCode +
      usercentricsCMPContent.hashCode +
      usercentricsCMPHeader.hashCode +
      usercentricsCMPUI.hashCode +
      usercentricsCard.hashCode +
      usercentricsList.hashCode +
      vendorConsentToggle.hashCode +
      vendorDetailedStorageInformation.hashCode +
      vendorLegIntToggle.hashCode;

  @override
  String toString() =>
      "$TranslationAriaLabels(acceptAllButton: $acceptAllButton, ccpaButton: $ccpaButton, ccpaMoreInformation: $ccpaMoreInformation, closeButton: $closeButton, collapse: $collapse, cookiePolicyButton: $cookiePolicyButton, copyControllerId: $copyControllerId, denyAllButton: $denyAllButton, expand: $expand, fullscreenButton: $fullscreenButton, imprintButton: $imprintButton, languageSelector: $languageSelector, privacyButton: $privacyButton, privacyPolicyButton: $privacyPolicyButton, saveButton: $saveButton, serviceInCategoryDetails: $serviceInCategoryDetails, servicesInCategory: $servicesInCategory, tabButton: $tabButton, usercentricsCMPButtons: $usercentricsCMPButtons, usercentricsCMPContent: $usercentricsCMPContent, usercentricsCMPHeader: $usercentricsCMPHeader, usercentricsCMPUI: $usercentricsCMPUI, usercentricsCard: $usercentricsCard, usercentricsList: $usercentricsList, vendorConsentToggle: $vendorConsentToggle, vendorDetailedStorageInformation: $vendorDetailedStorageInformation, vendorLegIntToggle: $vendorLegIntToggle)";
}
