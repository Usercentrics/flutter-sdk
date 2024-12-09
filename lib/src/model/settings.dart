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
    required this.language,
    required this.imprintUrl,
    required this.privacyPolicyUrl,
    required this.cookiePolicyUrl,
    required this.firstLayerDescriptionHtml,
    required this.firstLayerMobileDescriptionHtml,
    required this.settingsId,
    required this.bannerMobileDescriptionIsActive,
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
    required this.variants,
    required this.dpsDisplayFormat,
    required this.framework,
    required this.publishedApps,
    required this.renewConsentsTimestamp,
  });

  final UsercentricsLabels labels;
  final String version;
  final String language;
  final String imprintUrl;
  final String privacyPolicyUrl;
  final String cookiePolicyUrl;
  final String firstLayerDescriptionHtml;
  final String firstLayerMobileDescriptionHtml;
  final String settingsId;
  final bool bannerMobileDescriptionIsActive;
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
  final VariantsSettings? variants;
  final DpsDisplayFormat? dpsDisplayFormat;
  final USAFrameworks? framework;
  final List<PublishedApp>? publishedApps;
  final int? renewConsentsTimestamp;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsSettings &&
          runtimeType == other.runtimeType &&
          labels == other.labels &&
          version == other.version &&
          language == other.language &&
          imprintUrl == other.imprintUrl &&
          privacyPolicyUrl == other.privacyPolicyUrl &&
          cookiePolicyUrl == other.cookiePolicyUrl &&
          firstLayerDescriptionHtml == other.firstLayerDescriptionHtml &&
          firstLayerMobileDescriptionHtml ==
              other.firstLayerMobileDescriptionHtml &&
          settingsId == other.settingsId &&
          bannerMobileDescriptionIsActive ==
              other.bannerMobileDescriptionIsActive &&
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
          variants == other.variants &&
          dpsDisplayFormat == other.dpsDisplayFormat &&
          framework == other.framework &&
          listEquals(publishedApps, other.publishedApps) &&
          renewConsentsTimestamp == other.renewConsentsTimestamp;

  @override
  int get hashCode =>
      labels.hashCode +
      version.hashCode +
      language.hashCode +
      imprintUrl.hashCode +
      privacyPolicyUrl.hashCode +
      cookiePolicyUrl.hashCode +
      firstLayerDescriptionHtml.hashCode +
      firstLayerMobileDescriptionHtml.hashCode +
      settingsId.hashCode +
      bannerMobileDescriptionIsActive.hashCode +
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
      variants.hashCode +
      dpsDisplayFormat.hashCode +
      framework.hashCode +
      publishedApps.hashCode +
      renewConsentsTimestamp.hashCode;

  @override
  String toString() =>
      "$UsercentricsSettings(settingsId: $settingsId, version: $version, language: $language)";
}

class FirstLayer {
  const FirstLayer({
    required this.hideButtonDeny,
  });

  final bool? hideButtonDeny;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FirstLayer &&
          runtimeType == other.runtimeType &&
          hideButtonDeny == other.hideButtonDeny;

  @override
  int get hashCode => hideButtonDeny.hashCode;

  @override
  String toString() => "$FirstLayer($hashCode)";
}

class SecondLayer {
  const SecondLayer({
    required this.tabsCategoriesLabel,
    required this.tabsServicesLabel,
    required this.acceptButtonText,
    required this.denyButtonText,
    required this.hideButtonDeny,
    required this.hideLanguageSwitch,
    required this.hideTogglesForServices,
    required this.hideDataProcessingServices,
  });

  final String tabsCategoriesLabel;
  final String tabsServicesLabel;
  final String? acceptButtonText;
  final String? denyButtonText;
  final bool? hideButtonDeny;
  final bool? hideLanguageSwitch;
  final bool hideTogglesForServices;
  final bool hideDataProcessingServices;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SecondLayer &&
          runtimeType == other.runtimeType &&
          tabsCategoriesLabel == other.tabsCategoriesLabel &&
          tabsServicesLabel == other.tabsServicesLabel &&
          acceptButtonText == other.acceptButtonText &&
          denyButtonText == other.denyButtonText &&
          hideButtonDeny == other.hideButtonDeny &&
          hideLanguageSwitch == other.hideLanguageSwitch &&
          hideTogglesForServices == other.hideTogglesForServices &&
          hideDataProcessingServices == other.hideDataProcessingServices;

  @override
  int get hashCode =>
      tabsCategoriesLabel.hashCode ^
      tabsServicesLabel.hashCode ^
      acceptButtonText.hashCode ^
      denyButtonText.hashCode ^
      hideButtonDeny.hashCode ^
      hideLanguageSwitch.hashCode ^
      hideTogglesForServices.hashCode ^
      hideDataProcessingServices.hashCode;

  @override
  String toString() => "$SecondLayer($hashCode)";
}

class VariantsSettings {
  const VariantsSettings(
      {required this.enabled,
      required this.experimentsJson,
      required this.activateWith});

  final bool enabled;
  final String experimentsJson;
  final String activateWith;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VariantsSettings &&
          runtimeType == other.runtimeType &&
          enabled == other.enabled &&
          experimentsJson == other.experimentsJson &&
          activateWith == other.activateWith;

  @override
  int get hashCode =>
      enabled.hashCode ^ experimentsJson.hashCode ^ activateWith.hashCode;
}

enum DpsDisplayFormat { all, short }

enum USAFrameworks {
  cpra,
  vcdpa,
  cpa,
  ctdpa,
  ucpa,
}

class PublishedApp {
  const PublishedApp({required this.bundleId, required this.platform});

  final String bundleId;
  final PublishedAppPlatform platform;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PublishedApp &&
          runtimeType == other.runtimeType &&
          bundleId == other.bundleId &&
          platform == other.platform;

  @override
  int get hashCode => bundleId.hashCode ^ platform.hashCode;
}

enum PublishedAppPlatform { android, ios }
