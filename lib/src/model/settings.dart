import 'package:flutter/foundation.dart';
import 'package:usercentrics_sdk/src/model/ccpa_settings.dart';
import 'package:usercentrics_sdk/src/model/customization.dart';
import 'package:usercentrics_sdk/src/model/labels.dart';
import 'package:usercentrics_sdk/src/model/tcf2_settings.dart';

/// The general settings defined for the settingsId.
class UsercentricsSettings {
  const UsercentricsSettings({
    required this.labels,
    required this.version,
    required this.urlConsentInfo,
    required this.language,
    required this.partnerPoweredByUrl,
    required this.partnerPoweredByLogoUrl,
    required this.imprintUrl,
    required this.privacyPolicyUrl,
    required this.cookiePolicyUrl,
    required this.bannerMessage,
    required this.bannerMobileDescription,
    required this.dataController,
    required this.createdAt,
    required this.updatedAt,
    required this.settingsId,
    required this.isLatest,
    required this.btnMoreInfoIsVisible,
    required this.btnDenyIsVisible,
    required this.showLanguageDropdown,
    required this.bannerMobileDescriptionIsActive,
    required this.iabConsentIsActive,
    required this.enablePoweredBy,
    required this.displayOnlyForEU,
    required this.tcf2Enabled,
    required this.reshowBanner,
    required this.editableLanguages,
    required this.languagesAvailable,
    required this.showInitialViewForVersionChange,
    required this.ccpa,
    required this.tcf2,
    required this.customization,
    required this.firstLayer,
    required this.secondLayer,
    required this.moreInfoButtonUrl,
  });

  final UsercentricsLabels labels;
  final String version;
  final String urlConsentInfo;
  final String language;
  final String partnerPoweredByUrl;
  final String partnerPoweredByLogoUrl;
  final String imprintUrl;
  final String privacyPolicyUrl;
  final String cookiePolicyUrl;
  final String bannerMessage;
  final String bannerMobileDescription;
  final String dataController;
  final String createdAt;
  final String updatedAt;
  final String settingsId;
  final bool? isLatest;
  final bool btnMoreInfoIsVisible;
  final bool btnDenyIsVisible;
  final bool showLanguageDropdown;
  final bool bannerMobileDescriptionIsActive;
  final bool iabConsentIsActive;
  final bool enablePoweredBy;
  final bool displayOnlyForEU;
  final bool tcf2Enabled;
  final int? reshowBanner;
  final List<String> editableLanguages;
  final List<String> languagesAvailable;
  final List<String> showInitialViewForVersionChange;
  final CCPASettings? ccpa;
  final TCF2Settings? tcf2;
  final UsercentricsCustomization? customization;
  final FirstLayer? firstLayer;
  final SecondLayer? secondLayer;
  final String moreInfoButtonUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsSettings &&
          runtimeType == other.runtimeType &&
          labels == other.labels &&
          version == other.version &&
          urlConsentInfo == other.urlConsentInfo &&
          language == other.language &&
          partnerPoweredByUrl == other.partnerPoweredByUrl &&
          partnerPoweredByLogoUrl == other.partnerPoweredByLogoUrl &&
          imprintUrl == other.imprintUrl &&
          privacyPolicyUrl == other.privacyPolicyUrl &&
          cookiePolicyUrl == other.cookiePolicyUrl &&
          bannerMessage == other.bannerMessage &&
          bannerMobileDescription == other.bannerMobileDescription &&
          dataController == other.dataController &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          settingsId == other.settingsId &&
          isLatest == other.isLatest &&
          btnMoreInfoIsVisible == other.btnMoreInfoIsVisible &&
          btnDenyIsVisible == other.btnDenyIsVisible &&
          showLanguageDropdown == other.showLanguageDropdown &&
          bannerMobileDescriptionIsActive ==
              other.bannerMobileDescriptionIsActive &&
          iabConsentIsActive == other.iabConsentIsActive &&
          enablePoweredBy == other.enablePoweredBy &&
          displayOnlyForEU == other.displayOnlyForEU &&
          tcf2Enabled == other.tcf2Enabled &&
          reshowBanner == other.reshowBanner &&
          listEquals(editableLanguages, other.editableLanguages) &&
          listEquals(languagesAvailable, other.languagesAvailable) &&
          listEquals(showInitialViewForVersionChange,
              other.showInitialViewForVersionChange) &&
          ccpa == other.ccpa &&
          tcf2 == other.tcf2 &&
          customization == other.customization &&
          firstLayer == other.firstLayer &&
          secondLayer == other.secondLayer &&
          moreInfoButtonUrl == other.moreInfoButtonUrl;

  @override
  int get hashCode =>
      labels.hashCode +
      version.hashCode +
      urlConsentInfo.hashCode +
      language.hashCode +
      partnerPoweredByUrl.hashCode +
      partnerPoweredByLogoUrl.hashCode +
      imprintUrl.hashCode +
      privacyPolicyUrl.hashCode +
      cookiePolicyUrl.hashCode +
      bannerMessage.hashCode +
      bannerMobileDescription.hashCode +
      dataController.hashCode +
      createdAt.hashCode +
      updatedAt.hashCode +
      settingsId.hashCode +
      isLatest.hashCode +
      btnMoreInfoIsVisible.hashCode +
      btnDenyIsVisible.hashCode +
      showLanguageDropdown.hashCode +
      bannerMobileDescriptionIsActive.hashCode +
      iabConsentIsActive.hashCode +
      enablePoweredBy.hashCode +
      displayOnlyForEU.hashCode +
      tcf2Enabled.hashCode +
      reshowBanner.hashCode +
      editableLanguages.hashCode +
      languagesAvailable.hashCode +
      showInitialViewForVersionChange.hashCode +
      ccpa.hashCode +
      tcf2.hashCode +
      customization.hashCode +
      firstLayer.hashCode +
      secondLayer.hashCode +
      moreInfoButtonUrl.hashCode;

  @override
  String toString() =>
      "$UsercentricsSettings(settingsId: $settingsId, version: $version, language: $language)";
}

class FirstLayer {
  const FirstLayer({
    required this.isOverlayEnabled,
    required this.isCategoryTogglesEnabled,
    required this.hideButtonDeny,
    required this.hideLanguageSwitch,
    required this.title,
    required this.descriptionDefault,
    required this.descriptionShort,
  });

  final bool? isOverlayEnabled;
  final bool? isCategoryTogglesEnabled;
  final bool? hideButtonDeny;
  final bool? hideLanguageSwitch;
  final String title;
  final String descriptionDefault;
  final String descriptionShort;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FirstLayer &&
          runtimeType == other.runtimeType &&
          isOverlayEnabled == other.isOverlayEnabled &&
          isCategoryTogglesEnabled == other.isCategoryTogglesEnabled &&
          hideButtonDeny == other.hideButtonDeny &&
          hideLanguageSwitch == other.hideLanguageSwitch &&
          title == other.title &&
          descriptionDefault == other.descriptionDefault &&
          descriptionShort == other.descriptionShort;

  @override
  int get hashCode =>
      isOverlayEnabled.hashCode +
      isCategoryTogglesEnabled.hashCode +
      hideButtonDeny.hashCode +
      hideLanguageSwitch.hashCode +
      title.hashCode +
      descriptionDefault.hashCode +
      descriptionShort.hashCode;

  @override
  String toString() => "$FirstLayer($hashCode)";
}

class SecondLayer {
  const SecondLayer({
    required this.tabsCategoriesLabel,
    required this.tabsServicesLabel,
    required this.isOverlayEnabled,
    required this.tabsCategoriesIsEnabled,
    required this.tabsServicesIsEnabled,
    required this.hideButtonDeny,
    required this.hideLanguageSwitch,
    required this.title,
    required this.description,
  });

  final String tabsCategoriesLabel;
  final String tabsServicesLabel;
  final bool? isOverlayEnabled;
  final bool? tabsCategoriesIsEnabled;
  final bool? tabsServicesIsEnabled;
  final bool? hideButtonDeny;
  final bool? hideLanguageSwitch;
  final String title;
  final String description;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SecondLayer &&
          runtimeType == other.runtimeType &&
          tabsCategoriesLabel == other.tabsCategoriesLabel &&
          tabsServicesLabel == other.tabsServicesLabel &&
          isOverlayEnabled == other.isOverlayEnabled &&
          tabsCategoriesIsEnabled == other.tabsCategoriesIsEnabled &&
          tabsServicesIsEnabled == other.tabsServicesIsEnabled &&
          hideButtonDeny == other.hideButtonDeny &&
          hideLanguageSwitch == other.hideLanguageSwitch &&
          title == other.title &&
          description == other.description;

  @override
  int get hashCode =>
      tabsCategoriesLabel.hashCode +
      tabsServicesLabel.hashCode +
      isOverlayEnabled.hashCode +
      tabsCategoriesIsEnabled.hashCode +
      tabsServicesIsEnabled.hashCode +
      hideButtonDeny.hashCode +
      hideLanguageSwitch.hashCode +
      title.hashCode +
      description.hashCode;

  @override
  String toString() => "$SecondLayer($hashCode)";
}
