import 'package:flutter/foundation.dart';

class TCF2Settings {
  const TCF2Settings({
    required this.firstLayerTitle,
    required this.secondLayerTitle,
    required this.tabsPurposeLabel,
    required this.tabsVendorsLabel,
    required this.labelsFeatures,
    required this.labelsIabVendors,
    required this.labelsNonIabPurposes,
    required this.labelsNonIabVendors,
    required this.labelsPurposes,
    required this.vendorFeatures,
    required this.vendorLegitimateInterestPurposes,
    required this.vendorPurpose,
    required this.vendorSpecialFeatures,
    required this.vendorSpecialPurposes,
    required this.togglesConsentToggleLabel,
    required this.togglesLegIntToggleLabel,
    required this.buttonsAcceptAllLabel,
    required this.buttonsDenyAllLabel,
    required this.buttonsSaveLabel,
    required this.linksManageSettingsLabel,
    required this.linksVendorListLinkLabel,
    required this.cmpId,
    required this.cmpVersion,
    required this.firstLayerHideToggles,
    required this.secondLayerHideToggles,
    required this.hideLegitimateInterestToggles,
    required this.firstLayerHideButtonDeny,
    required this.secondLayerHideButtonDeny,
    required this.publisherCountryCode,
    required this.purposeOneTreatment,
    required this.selectedVendorIds,
    required this.gdprApplies,
    required this.consensuDomain,
    required this.consensuScriptPath,
    required this.selectedStacks,
    required this.disabledSpecialFeatures,
    required this.firstLayerShowDescriptions,
    required this.hideNonIabOnFirstLayer,
    required this.resurfaceIABLegalBasisChanged,
    required this.resurfacePeriodEnded,
    required this.resurfacePurposeChanged,
    required this.resurfaceVendorAdded,
    required this.vendorToggleAll,
    required this.firstLayerDescription,
    required this.firstLayerAdditionalInfo,
    required this.secondLayerDescription,
    required this.togglesSpecialFeaturesToggleOn,
    required this.togglesSpecialFeaturesToggleOff,
    required this.appLayerNoteResurface,
    required this.firstLayerNoteGlobal,
    required this.firstLayerNoteResurface,
  });

  final String firstLayerTitle;
  final String secondLayerTitle;
  final String tabsPurposeLabel;
  final String tabsVendorsLabel;
  final String labelsFeatures;
  final String labelsIabVendors;
  final String labelsNonIabPurposes;
  final String labelsNonIabVendors;
  final String labelsPurposes;
  final String vendorFeatures;
  final String vendorLegitimateInterestPurposes;
  final String vendorPurpose;
  final String vendorSpecialFeatures;
  final String vendorSpecialPurposes;
  final String togglesConsentToggleLabel;
  final String togglesLegIntToggleLabel;
  final String buttonsAcceptAllLabel;
  final String buttonsDenyAllLabel;
  final String buttonsSaveLabel;
  final String linksManageSettingsLabel;
  final String linksVendorListLinkLabel;
  final int cmpId;
  final int cmpVersion;
  final bool firstLayerHideToggles;
  final bool secondLayerHideToggles;
  final bool hideLegitimateInterestToggles;
  final bool? firstLayerHideButtonDeny;
  final bool secondLayerHideButtonDeny;
  final String publisherCountryCode;
  final bool purposeOneTreatment;
  final List<int> selectedVendorIds;
  final bool gdprApplies;
  final String consensuDomain;
  final String consensuScriptPath;
  final List<int> selectedStacks;
  final List<int> disabledSpecialFeatures;
  final bool firstLayerShowDescriptions;
  final bool hideNonIabOnFirstLayer;
  final bool resurfaceIABLegalBasisChanged;
  final bool resurfacePeriodEnded;
  final bool resurfacePurposeChanged;
  final bool resurfaceVendorAdded;
  final bool vendorToggleAll;
  final String firstLayerDescription;
  final String firstLayerAdditionalInfo;
  final String secondLayerDescription;
  final String togglesSpecialFeaturesToggleOn;
  final String togglesSpecialFeaturesToggleOff;
  final String appLayerNoteResurface;
  final String firstLayerNoteGlobal;
  final String firstLayerNoteResurface;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TCF2Settings &&
          runtimeType == other.runtimeType &&
          firstLayerTitle == other.firstLayerTitle &&
          secondLayerTitle == other.secondLayerTitle &&
          tabsPurposeLabel == other.tabsPurposeLabel &&
          tabsVendorsLabel == other.tabsVendorsLabel &&
          labelsFeatures == other.labelsFeatures &&
          labelsIabVendors == other.labelsIabVendors &&
          labelsNonIabPurposes == other.labelsNonIabPurposes &&
          labelsNonIabVendors == other.labelsNonIabVendors &&
          labelsPurposes == other.labelsPurposes &&
          vendorFeatures == other.vendorFeatures &&
          vendorLegitimateInterestPurposes ==
              other.vendorLegitimateInterestPurposes &&
          vendorPurpose == other.vendorPurpose &&
          vendorSpecialFeatures == other.vendorSpecialFeatures &&
          vendorSpecialPurposes == other.vendorSpecialPurposes &&
          togglesConsentToggleLabel == other.togglesConsentToggleLabel &&
          togglesLegIntToggleLabel == other.togglesLegIntToggleLabel &&
          buttonsAcceptAllLabel == other.buttonsAcceptAllLabel &&
          buttonsDenyAllLabel == other.buttonsDenyAllLabel &&
          buttonsSaveLabel == other.buttonsSaveLabel &&
          linksManageSettingsLabel == other.linksManageSettingsLabel &&
          linksVendorListLinkLabel == other.linksVendorListLinkLabel &&
          cmpId == other.cmpId &&
          cmpVersion == other.cmpVersion &&
          firstLayerHideToggles == other.firstLayerHideToggles &&
          secondLayerHideToggles == other.secondLayerHideToggles &&
          hideLegitimateInterestToggles ==
              other.hideLegitimateInterestToggles &&
          firstLayerHideButtonDeny == other.firstLayerHideButtonDeny &&
          secondLayerHideButtonDeny == other.secondLayerHideButtonDeny &&
          publisherCountryCode == other.publisherCountryCode &&
          purposeOneTreatment == other.purposeOneTreatment &&
          listEquals(selectedVendorIds, other.selectedVendorIds) &&
          gdprApplies == other.gdprApplies &&
          consensuDomain == other.consensuDomain &&
          consensuScriptPath == other.consensuScriptPath &&
          listEquals(selectedStacks, other.selectedStacks) &&
          listEquals(disabledSpecialFeatures, other.disabledSpecialFeatures) &&
          firstLayerShowDescriptions == other.firstLayerShowDescriptions &&
          hideNonIabOnFirstLayer == other.hideNonIabOnFirstLayer &&
          resurfaceIABLegalBasisChanged ==
              other.resurfaceIABLegalBasisChanged &&
          resurfacePeriodEnded == other.resurfacePeriodEnded &&
          resurfacePurposeChanged == other.resurfacePurposeChanged &&
          resurfaceVendorAdded == other.resurfaceVendorAdded &&
          vendorToggleAll == other.vendorToggleAll &&
          firstLayerDescription == other.firstLayerDescription &&
          firstLayerAdditionalInfo == other.firstLayerAdditionalInfo &&
          secondLayerDescription == other.secondLayerDescription &&
          togglesSpecialFeaturesToggleOn ==
              other.togglesSpecialFeaturesToggleOn &&
          togglesSpecialFeaturesToggleOff ==
              other.togglesSpecialFeaturesToggleOff &&
          appLayerNoteResurface == other.appLayerNoteResurface &&
          firstLayerNoteGlobal == other.firstLayerNoteGlobal &&
          firstLayerNoteResurface == other.firstLayerNoteResurface;

  @override
  int get hashCode =>
      firstLayerTitle.hashCode +
      secondLayerTitle.hashCode +
      tabsPurposeLabel.hashCode +
      tabsVendorsLabel.hashCode +
      labelsFeatures.hashCode +
      labelsIabVendors.hashCode +
      labelsNonIabPurposes.hashCode +
      labelsNonIabVendors.hashCode +
      labelsPurposes.hashCode +
      vendorFeatures.hashCode +
      vendorLegitimateInterestPurposes.hashCode +
      vendorPurpose.hashCode +
      vendorSpecialFeatures.hashCode +
      vendorSpecialPurposes.hashCode +
      togglesConsentToggleLabel.hashCode +
      togglesLegIntToggleLabel.hashCode +
      buttonsAcceptAllLabel.hashCode +
      buttonsDenyAllLabel.hashCode +
      buttonsSaveLabel.hashCode +
      linksManageSettingsLabel.hashCode +
      linksVendorListLinkLabel.hashCode +
      cmpId.hashCode +
      cmpVersion.hashCode +
      firstLayerHideToggles.hashCode +
      secondLayerHideToggles.hashCode +
      hideLegitimateInterestToggles.hashCode +
      firstLayerHideButtonDeny.hashCode +
      secondLayerHideButtonDeny.hashCode +
      publisherCountryCode.hashCode +
      purposeOneTreatment.hashCode +
      selectedVendorIds.hashCode +
      gdprApplies.hashCode +
      consensuDomain.hashCode +
      consensuScriptPath.hashCode +
      selectedStacks.hashCode +
      disabledSpecialFeatures.hashCode +
      firstLayerShowDescriptions.hashCode +
      hideNonIabOnFirstLayer.hashCode +
      resurfaceIABLegalBasisChanged.hashCode +
      resurfacePeriodEnded.hashCode +
      resurfacePurposeChanged.hashCode +
      resurfaceVendorAdded.hashCode +
      vendorToggleAll.hashCode +
      firstLayerDescription.hashCode +
      firstLayerAdditionalInfo.hashCode +
      secondLayerDescription.hashCode +
      togglesSpecialFeaturesToggleOn.hashCode +
      togglesSpecialFeaturesToggleOff.hashCode +
      appLayerNoteResurface.hashCode +
      firstLayerNoteGlobal.hashCode +
      firstLayerNoteResurface.hashCode;

  @override
  String toString() => "$TCF2Settings($hashCode)";
}
