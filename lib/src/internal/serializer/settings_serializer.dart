import 'package:usercentrics_sdk/src/internal/serializer/ccpa_settings_serializer.dart';
import 'package:usercentrics_sdk/src/internal/serializer/customization_serializer.dart';
import 'package:usercentrics_sdk/src/internal/serializer/labels_serializer.dart';
import 'package:usercentrics_sdk/src/internal/serializer/tcf2_settings_serializer.dart';
import 'package:usercentrics_sdk/src/model/model.dart';

class SettingsSerializer {
  static UsercentricsSettings deserialize(dynamic value) {
    return UsercentricsSettings(
      labels: LabelsSerializer.deserialize(value['labels']),
      version: value['version'] ?? "",
      urlConsentInfo: value['urlConsentInfo'] ?? "",
      language: value['language'] ?? "",
      partnerPoweredByUrl: value['partnerPoweredByUrl'] ?? "",
      partnerPoweredByLogoUrl: value['partnerPoweredByLogoUrl'] ?? "",
      imprintUrl: value['imprintUrl'] ?? "",
      privacyPolicyUrl: value['privacyPolicyUrl'] ?? "",
      cookiePolicyUrl: value['cookiePolicyUrl'] ?? "",
      firstLayerDescriptionHtml: value['firstLayerDescriptionHtml'] ?? "",
      firstLayerMobileDescriptionHtml: value['firstLayerMobileDescriptionHtml'] ?? "",
      dataController: value['dataController'] ?? "",
      createdAt: value['createdAt'] ?? "",
      updatedAt: value['updatedAt'] ?? "",
      settingsId: value['settingsId'] ?? "",
      isLatest: value['isLatest'],
      btnMoreInfoIsVisible: value['btnMoreInfoIsVisible'],
      btnDenyIsVisible: value['btnDenyIsVisible'],
      showLanguageDropdown: value['showLanguageDropdown'],
      bannerMobileDescriptionIsActive: value['bannerMobileDescriptionIsActive'],
      iabConsentIsActive: value['iabConsentIsActive'],
      enablePoweredBy: value['enablePoweredBy'],
      displayOnlyForEU: value['displayOnlyForEU'],
      tcf2Enabled: value['tcf2Enabled'],
      reshowBanner: value['reshowBanner'],
      editableLanguages: value['editableLanguages']?.cast<String>() ?? [],
      languagesAvailable: value['languagesAvailable']?.cast<String>() ?? [],
      showInitialViewForVersionChange:
          value['showInitialViewForVersionChange']?.cast<String>() ?? [],
      ccpa: CCPASettingsSerializer.deserialize(value['ccpa']),
      tcf2: TCF2SettingsSerializer.deserialize(value['tcf2']),
      customization:
          CustomizationSerializer.deserialize(value['customization']),
      firstLayer: FirstLayerSerializer.deserialize(value['firstLayer']),
      secondLayer: SecondLayerSerializer.deserialize(value['secondLayer']),
      moreInfoButtonUrl: value['moreInfoButtonUrl'] ?? "",
    );
  }
}

class FirstLayerSerializer {
  static FirstLayer deserialize(dynamic value) {
    return FirstLayer(
      isOverlayEnabled: value['isOverlayEnabled'],
      isCategoryTogglesEnabled: value['isCategoryTogglesEnabled'],
      hideButtonDeny: value['hideButtonDeny'],
      hideLanguageSwitch: value['hideLanguageSwitch'],
      title: value['title'] ?? "",
      descriptionDefault: value['descriptionDefault'] ?? "",
      descriptionShort: value['descriptionShort'] ?? "",
    );
  }
}

class SecondLayerSerializer {
  static SecondLayer deserialize(dynamic value) {
    return SecondLayer(
      tabsCategoriesLabel: value['tabsCategoriesLabel'] ?? "",
      tabsServicesLabel: value['tabsServicesLabel'] ?? "",
      isOverlayEnabled: value['isOverlayEnabled'],
      tabsCategoriesIsEnabled: value['tabsCategoriesIsEnabled'],
      tabsServicesIsEnabled: value['tabsServicesIsEnabled'],
      hideButtonDeny: value['hideButtonDeny'],
      hideLanguageSwitch: value['hideLanguageSwitch'],
    );
  }
}
