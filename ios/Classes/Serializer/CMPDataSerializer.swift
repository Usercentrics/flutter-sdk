import Usercentrics

extension UsercentricsCMPData {
    func serialize() -> Any {
        return [
            "settings": self.settings.serialize(),
            "services": self.services.map { $0.serialize() },
            "categories": self.categories.map { $0.serialize() },
            "activeVariant": self.activeVariant.name as Any,
            "userLocation": self.userLocation.serialize(),
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
            "urlConsentInfo" : self.urlConsentInfo,
            "updatedAt" : self.updatedAt as Any,
            "secondLayer" : self.secondLayer?.serialize() as Any,
            "cookiePolicyUrl" : self.cookiePolicyUrl as Any,
            "tcf2" : self.tcf2?.serialize() as Any,
            "ccpa" : self.ccpa?.serialize() as Any,
            "btnDenyIsVisible" : self.btnDenyIsVisible as Any,
            "privacyPolicyUrl" : self.privacyPolicyUrl as Any,
            "firstLayer" : self.firstLayer?.serialize() as Any,
            "showLanguageDropdown" : self.showLanguageDropdown,
            "imprintUrl" : self.imprintUrl as Any,
            "btnMoreInfoIsVisible" : self.btnMoreInfoIsVisible,
            "bannerMessage" : self.bannerMessage as Any,
            "bannerMobileDescriptionIsActive" : self.bannerMobileDescriptionIsActive,
            "dataController" : self.dataController as Any,
            "bannerMobileDescription" : self.bannerMobileDescription as Any,
            "version" : self.version,
            "isLatest" : Bool(from: self.isLatest) as Any,
            "language" : self.language,
            "tcf2Enabled" : self.tcf2Enabled,
            "settingsId" : self.settingsId,
            "languagesAvailable" : self.languagesAvailable,
            "createdAt" : self.createdAt as Any,
            "enablePoweredBy" : self.enablePoweredBy,
            "editableLanguages" : self.editableLanguages,
            "partnerPoweredByLogoUrl" : self.partnerPoweredByLogoUrl,
            "customization" : self.customization?.serialize() as Any,
            "moreInfoButtonUrl" : self.moreInfoButtonUrl,
            "iabConsentIsActive" : self.iabConsentIsActive,
            "partnerPoweredByUrl" : self.partnerPoweredByUrl,
            //        "googleConsentMode" : self.googleConsentMode,
            //        "appIds" : self.appIds,
            //        "privacyButtonUrls" : self.privacyButtonUrls,
            //        "styles" : self.styles.serialize(),
            //        "interactionAnalytics" : self.interactionAnalytics,
        ]
    }
}

extension UsercentricsLabels {
    func serialize() -> Any {
        return [
            // Required only
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
            "retentionPeriod" : self.retentionPeriod,
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
            //        "region" : self.region.name,
            "showOnPageLoad" : self.showOnPageLoad,
            "reshowCMP" : self.reshowCMP,
            "reshowAfterDays" : self.reshowAfterDays,
            "iabAgreementExists" : self.iabAgreementExists,
            "firstLayerDescription" : self.firstLayerDescription as Any,
            "appFirstLayerDescription" : self.appFirstLayerDescription as Any,
            "firstLayerMobileDescriptionIsActive" : self.firstLayerMobileDescriptionIsActive,
            "firstLayerMobileDescription" : self.firstLayerMobileDescription as Any,
            //        "firstLayerVariant" : self.firstLayerVariant.name,
            "firstLayerHideLanguageSwitch" : self.firstLayerHideLanguageSwitch,
            "secondLayerTitle" : self.secondLayerTitle as Any,
            "secondLayerDescription" : self.secondLayerDescription as Any,
            //        "secondLayerVariant" : self.secondLayerVariant.name,
            "secondLayerHideLanguageSwitch" : self.secondLayerHideLanguageSwitch,
            "btnMoreInfo" : self.btnMoreInfo as Any,
            //        "secondLayerSide" : self.secondLayerSide.name,
        ]
    }
}


extension TCF2Settings {
    func serialize() -> Any {
        return [
            // Required
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
            // Optional
            "firstLayerHideToggles" : self.firstLayerHideToggles,
            "secondLayerHideToggles" : self.secondLayerHideToggles,
            "hideLegitimateInterestToggles" : self.hideLegitimateInterestToggles,
            "firstLayerHideButtonDeny" : Bool(from: self.firstLayerHideButtonDeny) as Any,
            "secondLayerHideButtonDeny" : self.secondLayerHideButtonDeny,
            "publisherCountryCode" : self.publisherCountryCode,
            "purposeOneTreatment" : self.purposeOneTreatment,
            "selectedVendorIds" : self.selectedVendorIds,
            "gdprApplies" : self.gdprApplies,
            "consensuDomain" : self.consensuDomain as Any,
            "consensuScriptPath" : self.consensuScriptPath as Any,
            "selectedStacks" : self.selectedStacks,
            //        "scope" : self.scope.name,
            "disabledSpecialFeatures" : self.disabledSpecialFeatures,
            "firstLayerShowDescriptions" : self.firstLayerShowDescriptions,
            "hideNonIabOnFirstLayer" : self.hideNonIabOnFirstLayer,
            "resurfaceIABLegalBasisChanged" : self.resurfaceIABLegalBasisChanged,
            "resurfacePeriodEnded" : self.resurfacePeriodEnded,
            "resurfacePurposeChanged" : self.resurfacePurposeChanged,
            "resurfaceVendorAdded" : self.resurfaceVendorAdded,
            "vendorToggleAll" : self.vendorToggleAll,
            "firstLayerDescription" : self.firstLayerDescription as Any,
            "firstLayerAdditionalInfo" : self.firstLayerAdditionalInfo as Any,
            "secondLayerDescription" : self.secondLayerDescription as Any,
            "togglesSpecialFeaturesToggleOn" : self.togglesSpecialFeaturesToggleOn as Any,
            "togglesSpecialFeaturesToggleOff" : self.togglesSpecialFeaturesToggleOff as Any,
            "appLayerNoteResurface" : self.appLayerNoteResurface as Any,
            "firstLayerNoteGlobal" : self.firstLayerNoteGlobal as Any,
            "firstLayerNoteResurface" : self.firstLayerNoteResurface as Any,
            //        "labelsActivateAllVendors" : self.labelsActivateAllVendors,
            //    "changedPurposes" : self.changedPurposes.serialize(),
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
            "useBackgroundShadow" : Bool(from: self.useBackgroundShadow),
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
            "moreBtnBackground" : self.moreBtnBackground,
            "moreBtnText" : self.moreBtnText,
        ]
    }
}



extension FirstLayer {
    func serialize() -> Any {
        return [
            "isOverlayEnabled" : Bool(from: self.isOverlayEnabled) as Any,
            "isCategoryTogglesEnabled" : Bool(from: self.isCategoryTogglesEnabled) as Any,
            //    "variant" : self.variant.name,
            "hideButtonDeny" : Bool(from: self.hideButtonDeny) as Any,
            "hideLanguageSwitch" : Bool(from: self.hideLanguageSwitch) as Any,
            //        "logoPosition" : self.logoPosition?.name,
            //    "secondLayerTrigger" : self.secondLayerTrigger.name,
            "title" : self.title as Any,
            "descriptionDefault" : self.descriptionDefault as Any,
            "descriptionShort" : self.descriptionShort as Any,
        ]
    }
}



extension SecondLayer {
    func serialize() -> Any {
        return [
            // Required
            "tabsCategoriesLabel" : self.tabsCategoriesLabel,
            "tabsServicesLabel" : self.tabsServicesLabel,
            // Optional
            "isOverlayEnabled" : Bool(from: self.isOverlayEnabled) as Any,
            "tabsCategoriesIsEnabled" : Bool(from: self.tabsCategoriesIsEnabled) as Any,
            "tabsServicesIsEnabled" : Bool(from: self.tabsServicesIsEnabled) as Any,
            //    "variant" : self.variant.name,
            "hideButtonDeny" : Bool(from: self.hideButtonDeny) as Any,
            "hideLanguageSwitch" : Bool(from: self.hideLanguageSwitch) as Any,
            //        "side" : self.side.name,
            "title" : self.title as Any,
            "description" : self.description,
        ]
    }
}



extension UsercentricsService {
    func serialize() -> Any {
        return [
            "templateId" : self.templateId as Any,
            "version" : self.version as Any,
            "type" : self.type as Any,
            //        "adminSettingsId" : self.adminSettingsId,
            "dataProcessor" : self.dataProcessor as Any,
            "dataPurposes" : self.dataPurposes,
            //        "domAttributes" : self.domAttributes,
            //        "domElements" : self.domElements,
            //        "domKeys" : self.domKeys,
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
            "cookieNames" : self.cookieNames as Any,
            "language" : self.language,
            //        "createdBy" : self.createdBy,
            //        "updatedBy" : self.updatedBy,
            "isLatest" : Bool(from: self.isLatest) as Any,
            "isShared" : Bool(from: self.isShared) as Any,
            "shareCustomConsent" : self.shareCustomConsent as Any,
            "linkToDpa" : self.linkToDpa,
            "defaultConsentStatus" : Bool(from: self.defaultConsentStatus) as Any,
            "legalGround" : self.legalGround,
            "optOutUrl" : self.optOutUrl,
            "policyOfProcessorUrl" : self.policyOfProcessorUrl,
            "categorySlug" : self.categorySlug as Any,
            //        "recordsOfProcessingActivities" : self.recordsOfProcessingActivities,
            "retentionPeriod" : self.retentionPeriod as Any,
            "retentionPeriodDescription" : self.retentionPeriodDescription,
            "iabId" : self.iabId as Any,
            "iabv2Id" : self.iabv2Id as Any,
            "dataProtectionOfficer" : self.dataProtectionOfficer,
            "privacyPolicyURL" : self.privacyPolicyURL,
            "cookiePolicyURL" : self.cookiePolicyURL,
            "locationOfProcessing" : self.locationOfProcessing,
            "dataCollectedDescription" : self.dataCollectedDescription as Any,
            "dataPurposesDescription" : self.dataPurposesDescription as Any,
            "dataRecipientsDescription" : self.dataRecipientsDescription as Any,
            "legalBasisDescription" : self.legalBasisDescription as Any,
            "optOutDescription" : self.optOutDescription as Any,
            "thirdCountryTransfer" : self.thirdCountryTransfer,
            "defaultCategoryLabel" : self.defaultCategoryLabel as Any,
            "description" : self.description,
            "cookieMaxAgeSeconds" : self.cookieMaxAgeSeconds as Any,
            "usesNonCookieAccess" : Bool(from: self.usesNonCookieAccess) as Any,
            "deviceStorageDisclosureUrl" : self.deviceStorageDisclosureUrl as Any,
            //    "deviceStorage" : self.deviceStorage.serialize(),
            //        "isDeprecated" : self.isDeprecated,
            "isDeactivated" : Bool(from: self.isDeactivated) as Any,
            //        "isAutoUpdateAllowed" : self.isAutoUpdateAllowed,
            "disableLegalBasis" : Bool(from: self.disableLegalBasis) as Any,
        ]
    }
}

extension UsercentricsCategory {
    func serialize() -> Any? {
        return [
            "categorySlug" : self.categorySlug,
            "label" : self.label as Any,
            "description" : self.description,
            "isEssential" : self.isEssential
        ]
    }
}

extension UsercentricsLocation {
    func serialize() -> Any {
        return [
            "countryCode" : self.countryCode,
            "countryName" : self.countryName,
            "regionCode" : self.regionCode,
            "isInEU" : self.isInEU(),
            "isInUS" : self.isInUS(),
            "isInCalifornia" : self.isInCalifornia(),
        ]
    }
}
