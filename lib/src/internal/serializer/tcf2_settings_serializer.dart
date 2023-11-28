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
      selectedStacks: value['selectedStacks']?.cast<int>() ?? [],
      disabledSpecialFeatures:
          value['disabledSpecialFeatures']?.cast<int>() ?? [],
      firstLayerShowDescriptions: value['firstLayerShowDescriptions'],
      hideNonIabOnFirstLayer: value['hideNonIabOnFirstLayer'],
      resurfacePeriodEnded: value['resurfacePeriodEnded'],
      resurfacePurposeChanged: value['resurfacePurposeChanged'],
      resurfaceVendorAdded: value['resurfaceVendorAdded'],
      firstLayerDescription: value['firstLayerDescription'] ?? "",
      firstLayerAdditionalInfo: value['firstLayerAdditionalInfo'] ?? "",
      secondLayerDescription: value['secondLayerDescription'] ?? "",
      togglesSpecialFeaturesToggleOn:
          value['togglesSpecialFeaturesToggleOn'] ?? "",
      togglesSpecialFeaturesToggleOff:
          value['togglesSpecialFeaturesToggleOff'] ?? "",
      appLayerNoteResurface: value['appLayerNoteResurface'] ?? "",
      firstLayerNoteResurface: value['firstLayerNoteResurface'] ?? "",
      categoriesOfDataLabel: value['categoriesOfDataLabel'] ?? "",
      dataRetentionPeriodLabel: value['dataRetentionPeriodLabel'] ?? "",
      legitimateInterestLabel: value['legitimateInterestLabel'] ?? "",
      version: value['version'] ?? "",
      examplesLabel: value['examplesLabel'] ?? "",
      firstLayerMobileVariant: FirstLayerMobileVariantSerializer.deserialize(
          value['firstLayerMobileVariant']),
      showDataSharedOutsideEUText: value['showDataSharedOutsideEUText'],
      dataSharedOutsideEUText: value['dataSharedOutsideEUText'] ?? "",
      vendorIdsOutsideEUList:
          value['vendorIdsOutsideEUList']?.cast<int>() ?? [],
      scope: TCF2ScopeSerializer.deserialize(value['scope'])!,
      changedPurposes:
          TCF2ChangedPurposesSerializer.deserialize(value['changedPurposes']),
    );
  }
}

class FirstLayerMobileVariantSerializer {
  static FirstLayerMobileVariant? deserialize(value) {
    switch (value) {
      case 'SHEET':
        return FirstLayerMobileVariant.sheet;
      case 'FULL':
        return FirstLayerMobileVariant.full;
      case 'POPUP_BOTTOM':
        return FirstLayerMobileVariant.popupBottom;
      case 'POPUP_CENTER':
        return FirstLayerMobileVariant.popupCenter;
    }
    return null;
  }
}

class TCF2ScopeSerializer {
  static TCF2Scope? deserialize(value) {
    switch (value) {
      case 'GLOBAL':
        return TCF2Scope.global;
      case 'SERVICE':
        return TCF2Scope.service;
    }
    return null;
  }
}

class TCF2ChangedPurposesSerializer {
  static TCF2ChangedPurposes deserialize(value) {
    return TCF2ChangedPurposes(
        purposes: value['purposes']?.cast<int>() ?? [],
        legIntPurposes: value['legIntPurposes']?.cast<int>() ?? []);
  }
}
