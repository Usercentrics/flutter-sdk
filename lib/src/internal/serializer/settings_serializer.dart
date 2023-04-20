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
      language: value['language'] ?? "",
      imprintUrl: value['imprintUrl'] ?? "",
      privacyPolicyUrl: value['privacyPolicyUrl'] ?? "",
      cookiePolicyUrl: value['cookiePolicyUrl'] ?? "",
      firstLayerDescriptionHtml: value['firstLayerDescriptionHtml'] ?? "",
      firstLayerMobileDescriptionHtml:
          value['firstLayerMobileDescriptionHtml'] ?? "",
      settingsId: value['settingsId'] ?? "",
      bannerMobileDescriptionIsActive: value['bannerMobileDescriptionIsActive'],
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
    );
  }
}

class FirstLayerSerializer {
  static FirstLayer deserialize(dynamic value) {
    return FirstLayer(
      hideButtonDeny: value['hideButtonDeny'],
    );
  }
}

class SecondLayerSerializer {
  static SecondLayer deserialize(dynamic value) {
    return SecondLayer(
      tabsCategoriesLabel: value['tabsCategoriesLabel'] ?? "",
      tabsServicesLabel: value['tabsServicesLabel'] ?? "",
      acceptButtonText: value['acceptButtonText'] ?? "",
      denyButtonText: value['denyButtonText'] ?? "",
      hideButtonDeny: value['hideButtonDeny'],
      hideLanguageSwitch: value['hideLanguageSwitch'],
    );
  }
}
