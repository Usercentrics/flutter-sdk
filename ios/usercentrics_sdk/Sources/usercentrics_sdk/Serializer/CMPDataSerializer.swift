import Usercentrics
import Flutter

extension UsercentricsCMPData {
    func serialize() -> Any {
        return [
            "settings": self.settings.serialize(),
            "services": self.services.map { $0.serialize() },
            "categories": self.categories.map { $0.serialize() },
            "activeVariant": self.activeVariant.name as Any,
            "userLocation": self.userLocation.serialize(),
            "legalBasis": self.legalBasis.serialize(),
        ]
    }
}

extension UsercentricsSettings {
    func serialize() -> Any {
        return [
            "labels" : self.labels.serialize(),
            "showInitialViewForVersionChange" : self.showInitialViewForVersionChange,
            "reshowBanner" : self.reshowBanner as Any,
            "displayOnlyForEU" : self.displayOnlyForEU,
            "secondLayer" : self.secondLayer.serialize() as Any,
            "cookiePolicyUrl" : self.cookiePolicyUrl as Any,
            "tcf2" : self.tcf2?.serialize() as Any,
            "ccpa" : self.ccpa?.serialize() as Any,
            "privacyPolicyUrl" : self.privacyPolicyUrl as Any,
            "firstLayer" : self.firstLayer?.serialize() as Any,
            "imprintUrl" : self.imprintUrl as Any,
            "firstLayerDescriptionHtml" : self.firstLayerDescriptionHtml as Any,
            "bannerMobileDescriptionIsActive" : self.bannerMobileDescriptionIsActive,
            "firstLayerMobileDescriptionHtml" : self.firstLayerMobileDescriptionHtml as Any,
            "version" : self.version,
            "language" : self.language,
            "tcf2Enabled" : self.tcf2Enabled,
            "settingsId" : self.settingsId,
            "languagesAvailable" : self.languagesAvailable,
            "enablePoweredBy" : self.enablePoweredBy,
            "editableLanguages" : self.editableLanguages,
            "customization" : self.customization?.serialize() as Any,
            "variants": (self.variants?.serialize() ?? nil) as Any,
            "dpsDisplayFormat": (self.dpsDisplayFormat?.name ?? "") as Any,
            "framework": (self.framework?.name ?? "") as Any,
            "publishedApps": (self.publishedApps?.map { $0.serialize() } ?? nil) as Any,
            "renewConsentsTimestamp": self.renewConsentsTimestamp as Any
        ]
    }
}

extension UsercentricsLabels {
    func serialize() -> Any {
        return [
            "btnAcceptAll" : self.btnAcceptAll,
            "btnDeny" : self.btnDeny,
            "btnSave" : self.btnSave,
            "firstLayerTitle" : self.firstLayerTitle,
            "accepted" : self.accepted,
            "denied" : self.denied,
            "date" : self.date,
            "decision" : self.decision,
            "dataCollectedList" : self.dataCollectedList,
            "dataCollectedInfo" : self.dataCollectedInfo,
            "locationOfProcessing" : self.locationOfProcessing,
            "transferToThirdCountries" : self.transferToThirdCountries,
            "dataPurposes" : self.dataPurposes,
            "dataPurposesInfo" : self.dataPurposesInfo,
            "dataRecipientsList" : self.dataRecipientsList,
            "descriptionOfService" : self.descriptionOfService,
            "history" : self.history,
            "historyDescription" : self.historyDescription,
            "legalBasisList" : self.legalBasisList,
            "legalBasisInfo" : self.legalBasisInfo,
            "processingCompanyTitle" : self.processingCompanyTitle,
            "technologiesUsed" : self.technologiesUsed,
            "technologiesUsedInfo" : self.technologiesUsedInfo,
            "cookiePolicyInfo" : self.cookiePolicyInfo,
            "optOut" : self.optOut,
            "policyOf" : self.policyOf,
            "imprintLinkText" : self.imprintLinkText,
            "privacyPolicyLinkText" : self.privacyPolicyLinkText,
            "categories" : self.categories,
            "anyDomain" : self.anyDomain,
            "day" : self.day,
            "days" : self.days,
            "domain" : self.domain,
            "duration" : self.duration,
            "informationLoadingNotPossible" : self.informationLoadingNotPossible,
            "hour" : self.hour,
            "hours" : self.hours,
            "identifier" : self.identifier,
            "maximumAgeCookieStorage" : self.maximumAgeCookieStorage,
            "minute" : self.minute,
            "minutes" : self.minutes,
            "month" : self.month,
            "months" : self.months,
            "multipleDomains" : self.multipleDomains,
            "no" : self.no,
            "nonCookieStorage" : self.nonCookieStorage,
            "seconds" : self.seconds,
            "session" : self.session,
            "loadingStorageInformation" : self.loadingStorageInformation,
            "storageInformation" : self.storageInformation,
            "detailedStorageInformation" : self.detailedStorageInformation,
            "tryAgain" : self.tryAgain,
            "type" : self.type,
            "year" : self.year,
            "years" : self.years,
            "yes" : self.yes,
            "storageInformationDescription" : self.storageInformationDescription,
            "btnBannerReadMore" : self.btnBannerReadMore,
            "linkToDpaInfo" : self.linkToDpaInfo,
            "second" : self.second,
            "consent" : self.consent,
            "secondLayerDescriptionHtml" : self.secondLayerDescriptionHtml,
            "secondLayerTitle" : self.secondLayerTitle,
            "btnMore": self.btnMore,
            "retentionPeriod": self.retentionPeriod,
            "explicit": self.explicit_ as Any,
            "transferToThirdCountriesInfo": self.transferToThirdCountriesInfo,
            "more": self.more,
            "headerModal": self.headerModal,
            "furtherInformationOptOut": self.furtherInformationOptOut,
            "cookiePolicyLinkText": self.cookiePolicyLinkText,
            "noImplicit": self.noImplicit,
            "yesImplicit": self.yesImplicit,
            "readLess": self.readLess
        ]
    }
}

extension CCPASettings {
    func serialize() -> Any {
        return [
            "optOutNoticeLabel" : self.optOutNoticeLabel,
            "btnSave" : self.btnSave,
            "firstLayerTitle" : self.firstLayerTitle,
            "isActive" : self.isActive,
            "showOnPageLoad" : self.showOnPageLoad,
            "reshowAfterDays" : self.reshowAfterDays,
            "iabAgreementExists" : self.iabAgreementExists,
            "appFirstLayerDescription" : self.appFirstLayerDescription as Any,
            "firstLayerMobileDescriptionIsActive" : self.firstLayerMobileDescriptionIsActive,
            "firstLayerMobileDescription" : self.firstLayerMobileDescription as Any,
            "secondLayerTitle" : self.secondLayerTitle as Any,
            "secondLayerDescription" : self.secondLayerDescription as Any,
            "secondLayerHideLanguageSwitch" : self.secondLayerHideLanguageSwitch,
            "btnMoreInfo" : self.btnMoreInfo as Any,
        ]
    }
}


extension TCF2Settings {
    func serialize() -> Any {
        return [
            "firstLayerTitle" : self.firstLayerTitle,
            "secondLayerTitle" : self.secondLayerTitle,
            "tabsPurposeLabel" : self.tabsPurposeLabel,
            "tabsVendorsLabel" : self.tabsVendorsLabel,
            "labelsFeatures" : self.labelsFeatures,
            "labelsIabVendors" : self.labelsIabVendors,
            "labelsNonIabPurposes" : self.labelsNonIabPurposes,
            "labelsNonIabVendors" : self.labelsNonIabVendors,
            "labelsPurposes" : self.labelsPurposes,
            "vendorFeatures" : self.vendorFeatures,
            "vendorLegitimateInterestPurposes" : self.vendorLegitimateInterestPurposes,
            "vendorPurpose" : self.vendorPurpose,
            "vendorSpecialFeatures" : self.vendorSpecialFeatures,
            "vendorSpecialPurposes" : self.vendorSpecialPurposes,
            "togglesConsentToggleLabel" : self.togglesConsentToggleLabel,
            "togglesLegIntToggleLabel" : self.togglesLegIntToggleLabel,
            "buttonsAcceptAllLabel" : self.buttonsAcceptAllLabel,
            "buttonsDenyAllLabel" : self.buttonsDenyAllLabel,
            "buttonsSaveLabel" : self.buttonsSaveLabel,
            "linksManageSettingsLabel" : self.linksManageSettingsLabel,
            "linksVendorListLinkLabel" : self.linksVendorListLinkLabel,
            "cmpId" : self.cmpId,
            "cmpVersion" : self.cmpVersion,
            "categoriesOfDataLabel" : self.categoriesOfDataLabel,
            "dataRetentionPeriodLabel" : self.dataRetentionPeriodLabel,
            "legitimateInterestLabel" : self.legitimateInterestLabel,
            "version" : self.version,
            "examplesLabel" : self.examplesLabel,
            "firstLayerHideToggles" : self.firstLayerHideToggles,
            "secondLayerHideToggles" : self.secondLayerHideToggles,
            "hideLegitimateInterestToggles" : self.hideLegitimateInterestToggles,
            "firstLayerHideButtonDeny" : Bool(from: self.firstLayerHideButtonDeny) as Any,
            "secondLayerHideButtonDeny" : self.secondLayerHideButtonDeny,
            "publisherCountryCode" : self.publisherCountryCode,
            "purposeOneTreatment" : self.purposeOneTreatment,
            "selectedVendorIds" : self.selectedVendorIds,
            "gdprApplies" : self.gdprApplies,
            "selectedStacks" : self.selectedStacks,
            "disabledSpecialFeatures" : self.disabledSpecialFeatures,
            "firstLayerShowDescriptions" : self.firstLayerShowDescriptions,
            "hideNonIabOnFirstLayer" : self.hideNonIabOnFirstLayer,
            "resurfacePeriodEnded" : self.resurfacePeriodEnded,
            "resurfacePurposeChanged" : self.resurfacePurposeChanged,
            "resurfaceVendorAdded" : self.resurfaceVendorAdded,
            "firstLayerDescription" : self.firstLayerDescription as Any,
            "firstLayerAdditionalInfo" : self.firstLayerAdditionalInfo as Any,
            "secondLayerDescription" : self.secondLayerDescription as Any,
            "togglesSpecialFeaturesToggleOn" : self.togglesSpecialFeaturesToggleOn as Any,
            "togglesSpecialFeaturesToggleOff" : self.togglesSpecialFeaturesToggleOff as Any,
            "appLayerNoteResurface" : self.appLayerNoteResurface as Any,
            "firstLayerNoteResurface" : self.firstLayerNoteResurface as Any,
            "firstLayerMobileVariant": self.firstLayerMobileVariant?.name ?? "",
            "showDataSharedOutsideEUText": self.showDataSharedOutsideEUText,
            "dataSharedOutsideEUText": self.dataSharedOutsideEUText as Any,
            "vendorIdsOutsideEUList": self.vendorIdsOutsideEUList,
            "scope": self.scope.name,
            "changedPurposes": self.changedPurposes?.serialize() as Any,
            "acmV2Enabled" : self.acmV2Enabled,
            "selectedATPIds" : self.selectedATPIds
        ]
    }
}


extension UsercentricsCustomization {
    func serialize() -> Any {
        return [
            "color" : self.color?.serialize(),
            "font" : self.font?.serialize(),
            "logoUrl" : self.logoUrl,
            "borderRadiusLayer" : self.borderRadiusLayer,
            "borderRadiusButton" : self.borderRadiusButton,
            "overlayOpacity" : self.overlayOpacity,
        ]
    }
}



extension CustomizationFont {
    func serialize() -> Any {
        return [
            "family" : self.family as Any,
            "size" : self.size as Any,
        ]
    }
}



extension CustomizationColor {
    func serialize() -> Any {
        return [
            "primary" : self.primary,
            "acceptBtnText" : self.acceptBtnText,
            "acceptBtnBackground" : self.acceptBtnBackground,
            "denyBtnText" : self.denyBtnText,
            "denyBtnBackground" : self.denyBtnBackground,
            "saveBtnText" : self.saveBtnText,
            "saveBtnBackground" : self.saveBtnBackground,
            "linkIcon" : self.linkIcon,
            "linkFont" : self.linkFont,
            "text" : self.text,
            "layerBackground" : self.layerBackground,
            "overlay" : self.overlay,
            "toggleInactiveBackground" : self.toggleInactiveBackground,
            "toggleInactiveIcon" : self.toggleInactiveIcon,
            "toggleActiveBackground" : self.toggleActiveBackground,
            "toggleActiveIcon" : self.toggleActiveIcon,
            "toggleDisabledBackground" : self.toggleDisabledBackground,
            "toggleDisabledIcon" : self.toggleDisabledIcon,
            "secondLayerTab" : self.secondLayerTab,
        ]
    }
}



extension FirstLayer {
    func serialize() -> Any {
        return [
            "hideButtonDeny" : Bool(from: self.hideButtonDeny) as Any,
        ]
    }
}



extension SecondLayer {
    func serialize() -> Any {
        return [
            "tabsCategoriesLabel" : self.tabsCategoriesLabel,
            "tabsServicesLabel" : self.tabsServicesLabel,
            "acceptButtonText" : self.acceptButtonText as Any,
            "denyButtonText" : self.denyButtonText as Any,
            "hideButtonDeny" : Bool(from: self.hideButtonDeny) as Any,
            "hideLanguageSwitch" : Bool(from: self.hideLanguageSwitch) as Any,
            "hideTogglesForServices": self.hideTogglesForServices,
            "hideDataProcessingServices": self.hideDataProcessingServices,
        ]
    }
}



extension UsercentricsService {
    func serialize() -> Any {
        return [
            "templateId" : self.templateId as Any,
            "version" : self.version as Any,
            "type" : self.type as Any,
            "dataProcessor" : self.dataProcessor as Any,
            "dataPurposes" : self.dataPurposes,
            "processingCompany" : self.processingCompany as Any,
            "nameOfProcessingCompany" : self.nameOfProcessingCompany,
            "addressOfProcessingCompany" : self.addressOfProcessingCompany,
            "descriptionOfService" : self.descriptionOfService,
            "languagesAvailable" : self.languagesAvailable,
            "dataCollectedList" : self.dataCollectedList,
            "dataPurposesList" : self.dataPurposesList,
            "dataRecipientsList" : self.dataRecipientsList,
            "legalBasisList" : self.legalBasisList,
            "retentionPeriodList" : self.retentionPeriodList,
            "subConsents" : self.subConsents as Any,
            "language" : self.language,
            "linkToDpa" : self.linkToDpa,
            "legalGround" : self.legalGround,
            "optOutUrl" : self.optOutUrl,
            "policyOfProcessorUrl" : self.policyOfProcessorUrl,
            "categorySlug" : self.categorySlug as Any,
            "retentionPeriodDescription" : self.retentionPeriodDescription,
            "dataProtectionOfficer" : self.dataProtectionOfficer,
            "privacyPolicyURL" : self.privacyPolicyURL,
            "cookiePolicyURL" : self.cookiePolicyURL,
            "locationOfProcessing" : self.locationOfProcessing,
            "dataCollectedDescription" : self.dataCollectedDescription as Any,
            "thirdCountryTransfer" : self.thirdCountryTransfer,
            "description" : self.description_ as Any,
            "cookieMaxAgeSeconds" : self.cookieMaxAgeSeconds as Any,
            "usesNonCookieAccess" : Bool(from: self.usesNonCookieAccess) as Any,
            "deviceStorageDisclosureUrl" : self.deviceStorageDisclosureUrl as Any,
            "isDeactivated" : Bool(from: self.isDeactivated) as Any,
            "disableLegalBasis" : Bool(from: self.disableLegalBasis) as Any,
            "isEssential" : self.isEssential,
            "technologyUsed": self.technologyUsed as Any,
            "deviceStorage": self.deviceStorage.serialize(),
            "isHidden": self.isHidden
        ]
    }
}

extension UsercentricsCategory {
    func serialize() -> Any? {
        return [
            "categorySlug" : self.categorySlug,
            "label" : self.label as Any,
            "description" : self.description_ as Any,
            "isEssential" : self.isEssential
        ]
    }
}

extension UsercentricsLocation {
    func serialize() -> Any {
        return [
            "countryCode" : self.countryCode,
            "regionCode" : self.regionCode,
            "isInEU" : self.isInEU(),
            "isInUS" : self.isInUS(),
            "isInCalifornia" : self.isInCalifornia(),
        ] as [String : Any]
    }
}

extension VariantsSettings {
    func serialize() -> Any {
        return [
            "enabled": enabled,
            "experimentsJson": experimentsJson,
            "activateWith": activateWith,
        ] as [String : Any]
    }
}

extension PublishedApp {
    func serialize() -> Any {
        return [
            "bundleId": bundleId,
            "platform": platform.name,
        ]
    }
}

extension TCF2ChangedPurposes {
    func serialize() -> Any {
        return [
            "purposes": purposes,
            "legIntPurposes": legIntPurposes
        ]
    }
}


extension LegalBasisLocalization {
    func serialize() -> Any {
        return [
            "labelsAria": self.labelsAria?.serialize(),
            "data": self.data
        ]
    }
}

extension TranslationAriaLabels {
    func serialize() -> Any {
        return [
            "acceptAllButton": self.acceptAllButton,
            "ccpaButton": self.ccpaButton,
            "ccpaMoreInformation": self.ccpaMoreInformation,
            "closeButton": self.closeButton,
            "collapse": self.collapse,
            "cookiePolicyButton": self.cookiePolicyButton,
            "copyControllerId": self.copyControllerId,
            "denyAllButton": self.denyAllButton,
            "expand": self.expand,
            "fullscreenButton": self.fullscreenButton,
            "imprintButton": self.imprintButton,
            "languageSelector": self.languageSelector,
            "privacyButton": self.privacyButton,
            "privacyPolicyButton": self.privacyPolicyButton,
            "saveButton": self.saveButton,
            "serviceInCategoryDetails": self.serviceInCategoryDetails,
            "servicesInCategory": self.servicesInCategory,
            "tabButton": self.tabButton,
            "usercentricsCMPButtons": self.usercentricsCMPButtons,
            "usercentricsCMPContent": self.usercentricsCMPContent,
            "usercentricsCMPHeader": self.usercentricsCMPHeader,
            "usercentricsCMPUI": self.usercentricsCMPUI,
            "usercentricsCard": self.usercentricsCard,
            "usercentricsList": self.usercentricsList,
            "vendorConsentToggle": self.vendorConsentToggle,
            "vendorDetailedStorageInformation": self.vendorDetailedStorageInformation,
            "vendorLegIntToggle": self.vendorLegIntToggle
        ]
    }
}
