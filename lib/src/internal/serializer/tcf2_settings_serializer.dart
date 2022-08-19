import 'package:usercentrics_sdk/src/model/tcf2_settings.dart';

class TCF2SettingsSerializer {
  static TCF2Settings deserialize(dynamic value) {
    return TCF2Settings(
      firstLayerTitle: value['firstLayerTitle'] ?? "",
      secondLayerTitle: value['secondLayerTitle'] ?? "",
      tabsPurposeLabel: value['tabsPurposeLabel'] ?? "",
      tabsVendorsLabel: value['tabsVendorsLabel'] ?? "",
      labelsFeatures: value['labelsFeatures'] ?? "",
      labelsIabVendors: value['labelsIabVendors'] ?? "",
      labelsNonIabPurposes: value['labelsNonIabPurposes'] ?? "",
      labelsNonIabVendors: value['labelsNonIabVendors'] ?? "",
      labelsPurposes: value['labelsPurposes'] ?? "",
      vendorFeatures: value['vendorFeatures'] ?? "",
      vendorLegitimateInterestPurposes:
          value['vendorLegitimateInterestPurposes'] ?? "",
      vendorPurpose: value['vendorPurpose'] ?? "",
      vendorSpecialFeatures: value['vendorSpecialFeatures'] ?? "",
      vendorSpecialPurposes: value['vendorSpecialPurposes'] ?? "",
      togglesConsentToggleLabel: value['togglesConsentToggleLabel'] ?? "",
      togglesLegIntToggleLabel: value['togglesLegIntToggleLabel'] ?? "",
      buttonsAcceptAllLabel: value['buttonsAcceptAllLabel'] ?? "",
      buttonsDenyAllLabel: value['buttonsDenyAllLabel'] ?? "",
      buttonsSaveLabel: value['buttonsSaveLabel'] ?? "",
      linksManageSettingsLabel: value['linksManageSettingsLabel'] ?? "",
      linksVendorListLinkLabel: value['linksVendorListLinkLabel'] ?? "",
      cmpId: value['cmpId'],
      cmpVersion: value['cmpVersion'],
      firstLayerHideToggles: value['firstLayerHideToggles'],
      secondLayerHideToggles: value['secondLayerHideToggles'],
      hideLegitimateInterestToggles: value['hideLegitimateInterestToggles'],
      firstLayerHideButtonDeny: value['firstLayerHideButtonDeny'],
      secondLayerHideButtonDeny: value['secondLayerHideButtonDeny'],
      publisherCountryCode: value['publisherCountryCode'] ?? "",
      purposeOneTreatment: value['purposeOneTreatment'],
      selectedVendorIds: value['selectedVendorIds']?.cast<int>() ?? [],
      gdprApplies: value['gdprApplies'],
      consensuDomain: value['consensuDomain'] ?? "",
      consensuScriptPath: value['consensuScriptPath'] ?? "",
      selectedStacks: value['selectedStacks']?.cast<int>() ?? [],
      disabledSpecialFeatures:
          value['disabledSpecialFeatures']?.cast<int>() ?? [],
      firstLayerShowDescriptions: value['firstLayerShowDescriptions'],
      hideNonIabOnFirstLayer: value['hideNonIabOnFirstLayer'],
      resurfacePeriodEnded: value['resurfacePeriodEnded'],
      resurfacePurposeChanged: value['resurfacePurposeChanged'],
      resurfaceVendorAdded: value['resurfaceVendorAdded'],
      vendorToggleAll: value['vendorToggleAll'],
      firstLayerDescription: value['firstLayerDescription'] ?? "",
      firstLayerAdditionalInfo: value['firstLayerAdditionalInfo'] ?? "",
      secondLayerDescription: value['secondLayerDescription'] ?? "",
      togglesSpecialFeaturesToggleOn:
          value['togglesSpecialFeaturesToggleOn'] ?? "",
      togglesSpecialFeaturesToggleOff:
          value['togglesSpecialFeaturesToggleOff'] ?? "",
      appLayerNoteResurface: value['appLayerNoteResurface'] ?? "",
      firstLayerNoteGlobal: value['firstLayerNoteGlobal'] ?? "",
      firstLayerNoteResurface: value['firstLayerNoteResurface'] ?? "",
    );
  }
}
