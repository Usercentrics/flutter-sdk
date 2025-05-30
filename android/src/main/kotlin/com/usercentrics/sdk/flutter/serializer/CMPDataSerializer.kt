package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.UsercentricsCMPData
import com.usercentrics.sdk.v2.location.data.UsercentricsLocation
import com.usercentrics.sdk.v2.settings.data.CCPASettings
import com.usercentrics.sdk.v2.settings.data.CustomizationColor
import com.usercentrics.sdk.v2.settings.data.CustomizationFont
import com.usercentrics.sdk.v2.settings.data.FirstLayer
import com.usercentrics.sdk.v2.settings.data.PublishedApp
import com.usercentrics.sdk.v2.settings.data.SecondLayer
import com.usercentrics.sdk.v2.settings.data.TCF2ChangedPurposes
import com.usercentrics.sdk.v2.settings.data.TCF2Settings
import com.usercentrics.sdk.v2.settings.data.UsercentricsCategory
import com.usercentrics.sdk.v2.settings.data.UsercentricsCustomization
import com.usercentrics.sdk.v2.settings.data.UsercentricsLabels
import com.usercentrics.sdk.v2.settings.data.UsercentricsService
import com.usercentrics.sdk.v2.settings.data.UsercentricsSettings
import com.usercentrics.sdk.v2.settings.data.VariantsSettings
import com.usercentrics.sdk.v2.translation.data.LegalBasisLocalization
import com.usercentrics.sdk.v2.translation.data.TranslationAriaLabels

internal fun UsercentricsCMPData.serialize(): Any {
    return mapOf(
        "settings" to settings.serialize(),
        "services" to services.map { it.serialize() },
        "categories" to categories.map { it.serialize() },
        "activeVariant" to activeVariant.name,
        "userLocation" to userLocation.serialize(),
        "legalBasis" to legalBasis.serialize()
    )
}

private fun UsercentricsSettings.serialize(): Any {
    return mapOf(
        "labels" to labels.serialize(),
        "showInitialViewForVersionChange" to showInitialViewForVersionChange,
        "reshowBanner" to reshowBanner,
        "displayOnlyForEU" to displayOnlyForEU,
        "secondLayer" to secondLayer.serialize(),
        "cookiePolicyUrl" to cookiePolicyUrl,
        "tcf2" to tcf2?.serialize(),
        "ccpa" to ccpa?.serialize(),
        "privacyPolicyUrl" to privacyPolicyUrl,
        "firstLayer" to firstLayer?.serialize(),
        "imprintUrl" to imprintUrl,
        "firstLayerDescriptionHtml" to firstLayerDescriptionHtml,
        "bannerMobileDescriptionIsActive" to bannerMobileDescriptionIsActive,
        "firstLayerMobileDescriptionHtml" to firstLayerMobileDescriptionHtml,
        "version" to version,
        "language" to language,
        "tcf2Enabled" to tcf2Enabled,
        "settingsId" to settingsId,
        "languagesAvailable" to languagesAvailable,
        "enablePoweredBy" to enablePoweredBy,
        "editableLanguages" to editableLanguages,
        "customization" to customization?.serialize(),
        "variants" to variants?.serialize(),
        "dpsDisplayFormat" to (dpsDisplayFormat?.name ?: ""),
        "framework" to (framework?.name ?: ""),
        "publishedApps" to publishedApps?.map { it.serialize() },
        "renewConsentsTimestamp" to renewConsentsTimestamp,
        "consentWebhook" to consentWebhook
    )
}

private fun UsercentricsLabels.serialize(): Any {
    return mapOf(
        "btnAcceptAll" to btnAcceptAll,
        "btnDeny" to btnDeny,
        "btnSave" to btnSave,
        "firstLayerTitle" to firstLayerTitle,
        "accepted" to accepted,
        "denied" to denied,
        "date" to date,
        "decision" to decision,
        "dataCollectedList" to dataCollectedList,
        "dataCollectedInfo" to dataCollectedInfo,
        "locationOfProcessing" to locationOfProcessing,
        "transferToThirdCountries" to transferToThirdCountries,
        "dataPurposes" to dataPurposes,
        "dataPurposesInfo" to dataPurposesInfo,
        "dataRecipientsList" to dataRecipientsList,
        "descriptionOfService" to descriptionOfService,
        "history" to history,
        "historyDescription" to historyDescription,
        "legalBasisList" to legalBasisList,
        "legalBasisInfo" to legalBasisInfo,
        "processingCompanyTitle" to processingCompanyTitle,
        "technologiesUsed" to technologiesUsed,
        "technologiesUsedInfo" to technologiesUsedInfo,
        "cookiePolicyInfo" to cookiePolicyInfo,
        "optOut" to optOut,
        "policyOf" to policyOf,
        "imprintLinkText" to imprintLinkText,
        "privacyPolicyLinkText" to privacyPolicyLinkText,
        "categories" to categories,
        "anyDomain" to anyDomain,
        "day" to day,
        "days" to days,
        "domain" to domain,
        "duration" to duration,
        "informationLoadingNotPossible" to informationLoadingNotPossible,
        "hour" to hour,
        "hours" to hours,
        "identifier" to identifier,
        "maximumAgeCookieStorage" to maximumAgeCookieStorage,
        "minute" to minute,
        "minutes" to minutes,
        "month" to month,
        "months" to months,
        "multipleDomains" to multipleDomains,
        "no" to no,
        "nonCookieStorage" to nonCookieStorage,
        "seconds" to seconds,
        "session" to session,
        "loadingStorageInformation" to loadingStorageInformation,
        "storageInformation" to storageInformation,
        "detailedStorageInformation" to detailedStorageInformation,
        "tryAgain" to tryAgain,
        "type" to type,
        "year" to year,
        "years" to years,
        "yes" to yes,
        "storageInformationDescription" to storageInformationDescription,
        "btnBannerReadMore" to btnBannerReadMore,
        "linkToDpaInfo" to linkToDpaInfo,
        "second" to second,
        "consent" to consent,
        "secondLayerTitle" to secondLayerTitle,
        "secondLayerDescriptionHtml" to secondLayerDescriptionHtml,
        "btnMore" to btnMore,
        "retentionPeriod" to retentionPeriod,
        "explicit" to explicit,
        "transferToThirdCountriesInfo" to transferToThirdCountriesInfo,
        "more" to more,
        "headerModal" to headerModal,
        "furtherInformationOptOut" to furtherInformationOptOut,
        "cookiePolicyLinkText" to cookiePolicyLinkText,
        "noImplicit" to noImplicit,
        "yesImplicit" to yesImplicit,
        "readLess" to readLess,
    )
}

private fun CCPASettings.serialize(): Any {
    return mapOf(
        "optOutNoticeLabel" to optOutNoticeLabel,
        "btnSave" to btnSave,
        "firstLayerTitle" to firstLayerTitle,
        "isActive" to isActive,
        "showOnPageLoad" to showOnPageLoad,
        "reshowAfterDays" to reshowAfterDays,
        "iabAgreementExists" to iabAgreementExists,
        "appFirstLayerDescription" to appFirstLayerDescription,
        "firstLayerMobileDescriptionIsActive" to firstLayerMobileDescriptionIsActive,
        "firstLayerMobileDescription" to firstLayerMobileDescription,
        "secondLayerTitle" to secondLayerTitle,
        "secondLayerDescription" to secondLayerDescription,
        "secondLayerHideLanguageSwitch" to secondLayerHideLanguageSwitch,
        "btnMoreInfo" to btnMoreInfo,
    )
}

private fun TCF2Settings.serialize(): Any {
    return mapOf(
        "firstLayerTitle" to firstLayerTitle,
        "secondLayerTitle" to secondLayerTitle,
        "tabsPurposeLabel" to tabsPurposeLabel,
        "tabsVendorsLabel" to tabsVendorsLabel,
        "labelsFeatures" to labelsFeatures,
        "labelsIabVendors" to labelsIabVendors,
        "labelsNonIabPurposes" to labelsNonIabPurposes,
        "labelsNonIabVendors" to labelsNonIabVendors,
        "labelsPurposes" to labelsPurposes,
        "vendorFeatures" to vendorFeatures,
        "vendorLegitimateInterestPurposes" to vendorLegitimateInterestPurposes,
        "vendorPurpose" to vendorPurpose,
        "vendorSpecialFeatures" to vendorSpecialFeatures,
        "vendorSpecialPurposes" to vendorSpecialPurposes,
        "togglesConsentToggleLabel" to togglesConsentToggleLabel,
        "togglesLegIntToggleLabel" to togglesLegIntToggleLabel,
        "buttonsAcceptAllLabel" to buttonsAcceptAllLabel,
        "buttonsDenyAllLabel" to buttonsDenyAllLabel,
        "buttonsSaveLabel" to buttonsSaveLabel,
        "linksManageSettingsLabel" to linksManageSettingsLabel,
        "linksVendorListLinkLabel" to linksVendorListLinkLabel,
        "cmpId" to cmpId,
        "cmpVersion" to cmpVersion,
        "categoriesOfDataLabel" to categoriesOfDataLabel,
        "dataRetentionPeriodLabel" to dataRetentionPeriodLabel,
        "legitimateInterestLabel" to legitimateInterestLabel,
        "version" to version,
        "examplesLabel" to examplesLabel,
        "firstLayerHideToggles" to firstLayerHideToggles,
        "secondLayerHideToggles" to secondLayerHideToggles,
        "hideLegitimateInterestToggles" to hideLegitimateInterestToggles,
        "firstLayerHideButtonDeny" to firstLayerHideButtonDeny,
        "secondLayerHideButtonDeny" to secondLayerHideButtonDeny,
        "publisherCountryCode" to publisherCountryCode,
        "purposeOneTreatment" to purposeOneTreatment,
        "selectedVendorIds" to selectedVendorIds,
        "gdprApplies" to gdprApplies,
        "selectedStacks" to selectedStacks,
        "disabledSpecialFeatures" to disabledSpecialFeatures,
        "firstLayerShowDescriptions" to firstLayerShowDescriptions,
        "hideNonIabOnFirstLayer" to hideNonIabOnFirstLayer,
        "resurfacePeriodEnded" to resurfacePeriodEnded,
        "resurfacePurposeChanged" to resurfacePurposeChanged,
        "resurfaceVendorAdded" to resurfaceVendorAdded,
        "firstLayerDescription" to firstLayerDescription,
        "firstLayerAdditionalInfo" to firstLayerAdditionalInfo,
        "secondLayerDescription" to secondLayerDescription,
        "togglesSpecialFeaturesToggleOn" to togglesSpecialFeaturesToggleOn,
        "togglesSpecialFeaturesToggleOff" to togglesSpecialFeaturesToggleOff,
        "appLayerNoteResurface" to appLayerNoteResurface,
        "firstLayerNoteResurface" to firstLayerNoteResurface,
        "firstLayerMobileVariant" to (firstLayerMobileVariant?.name ?: ""),
        "showDataSharedOutsideEUText" to showDataSharedOutsideEUText,
        "dataSharedOutsideEUText" to dataSharedOutsideEUText,
        "vendorIdsOutsideEUList" to vendorIdsOutsideEUList,
        "scope" to scope.name,
        "changedPurposes" to changedPurposes?.serialize(),
        "acmV2Enabled" to acmV2Enabled,
        "selectedATPIds" to selectedATPIds
    )
}

private fun UsercentricsCustomization.serialize(): Any {
    return mapOf(
        "color" to color?.serialize(),
        "font" to font?.serialize(),
        "logoUrl" to logoUrl,
        "borderRadiusLayer" to borderRadiusLayer,
        "borderRadiusButton" to borderRadiusButton,
        "overlayOpacity" to overlayOpacity,
    )
}

private fun CustomizationFont.serialize(): Any {
    return mapOf(
        "family" to family,
        "size" to size,
    )
}

private fun CustomizationColor.serialize(): Any {
    return mapOf(
        "primary" to primary,
        "acceptBtnText" to acceptBtnText,
        "acceptBtnBackground" to acceptBtnBackground,
        "denyBtnText" to denyBtnText,
        "denyBtnBackground" to denyBtnBackground,
        "saveBtnText" to saveBtnText,
        "saveBtnBackground" to saveBtnBackground,
        "linkIcon" to linkIcon,
        "linkFont" to linkFont,
        "text" to text,
        "layerBackground" to layerBackground,
        "overlay" to overlay,
        "toggleInactiveBackground" to toggleInactiveBackground,
        "toggleInactiveIcon" to toggleInactiveIcon,
        "toggleActiveBackground" to toggleActiveBackground,
        "toggleActiveIcon" to toggleActiveIcon,
        "toggleDisabledBackground" to toggleDisabledBackground,
        "toggleDisabledIcon" to toggleDisabledIcon,
        "secondLayerTab" to secondLayerTab,
    )
}

private fun FirstLayer.serialize(): Any {
    return mapOf(
        "hideButtonDeny" to hideButtonDeny,
    )
}

private fun SecondLayer.serialize(): Any {
    return mapOf(
        "tabsCategoriesLabel" to tabsCategoriesLabel,
        "tabsServicesLabel" to tabsServicesLabel,
        "acceptButtonText" to acceptButtonText,
        "denyButtonText" to denyButtonText,
        "hideButtonDeny" to hideButtonDeny,
        "hideLanguageSwitch" to hideLanguageSwitch,
        "hideTogglesForServices" to hideTogglesForServices,
        "hideDataProcessingServices" to hideDataProcessingServices,
    )
}

private fun UsercentricsService.serialize(): Any {
    return mapOf(
        "templateId" to templateId,
        "version" to version,
        "type" to type,
        "dataProcessor" to dataProcessor,
        "dataPurposes" to dataPurposes,
        "processingCompany" to processingCompany,
        "nameOfProcessingCompany" to nameOfProcessingCompany,
        "addressOfProcessingCompany" to addressOfProcessingCompany,
        "descriptionOfService" to descriptionOfService,
        "languagesAvailable" to languagesAvailable,
        "dataCollectedList" to dataCollectedList,
        "dataPurposesList" to dataPurposesList,
        "dataRecipientsList" to dataRecipientsList,
        "legalBasisList" to legalBasisList,
        "retentionPeriodList" to retentionPeriodList,
        "subConsents" to subConsents,
        "language" to language,
        "linkToDpa" to linkToDpa,
        "legalGround" to legalGround,
        "optOutUrl" to optOutUrl,
        "policyOfProcessorUrl" to policyOfProcessorUrl,
        "categorySlug" to categorySlug,
        "retentionPeriodDescription" to retentionPeriodDescription,
        "dataProtectionOfficer" to dataProtectionOfficer,
        "privacyPolicyURL" to privacyPolicyURL,
        "cookiePolicyURL" to cookiePolicyURL,
        "locationOfProcessing" to locationOfProcessing,
        "dataCollectedDescription" to dataCollectedDescription,
        "thirdCountryTransfer" to thirdCountryTransfer,
        "description" to description,
        "cookieMaxAgeSeconds" to cookieMaxAgeSeconds,
        "usesNonCookieAccess" to usesNonCookieAccess,
        "deviceStorageDisclosureUrl" to deviceStorageDisclosureUrl,
        "isDeactivated" to isDeactivated,
        "disableLegalBasis" to disableLegalBasis,
        "isEssential" to isEssential,
        "technologyUsed" to technologyUsed,
        "deviceStorage" to deviceStorage.serializer(),
        "isHidden" to isHidden,
    )
}

private fun UsercentricsCategory.serialize(): Any {
    return mapOf(
        "categorySlug" to categorySlug,
        "label" to label,
        "description" to description,
        "isEssential" to isEssential
    )
}

internal fun UsercentricsLocation.serialize(): Any {
    return mapOf(
        "countryCode" to countryCode,
        "regionCode" to regionCode,
        "isInEU" to isInEU(),
        "isInUS" to isInUS(),
        "isInCalifornia" to isInCalifornia(),
    )
}

internal fun LegalBasisLocalization.serialize(): Any {
    return mapOf(
        "labelsAria" to labelsAria?.serialize(),
        "data" to data
    )
}

internal fun TranslationAriaLabels.serialize(): Any {
    return mapOf(
        "acceptAllButton" to acceptAllButton,
        "ccpaButton" to ccpaButton,
        "ccpaMoreInformation" to ccpaMoreInformation,
        "closeButton" to closeButton,
        "collapse" to collapse,
        "cookiePolicyButton" to cookiePolicyButton,
        "copyControllerId" to copyControllerId,
        "denyAllButton" to denyAllButton,
        "expand" to expand,
        "fullscreenButton" to fullscreenButton,
        "imprintButton" to imprintButton,
        "languageSelector" to languageSelector,
        "privacyButton" to privacyButton,
        "privacyPolicyButton" to privacyPolicyButton,
        "saveButton" to saveButton,
        "serviceInCategoryDetails" to serviceInCategoryDetails,
        "servicesInCategory" to servicesInCategory,
        "tabButton" to tabButton,
        "usercentricsCMPButtons" to usercentricsCMPButtons,
        "usercentricsCMPContent" to usercentricsCMPContent,
        "usercentricsCMPHeader" to usercentricsCMPHeader,
        "usercentricsCMPUI" to usercentricsCMPUI,
        "usercentricsCard" to usercentricsCard,
        "usercentricsList" to usercentricsList,
        "vendorConsentToggle" to vendorConsentToggle,
        "vendorDetailedStorageInformation" to vendorDetailedStorageInformation,
        "vendorLegIntToggle" to vendorLegIntToggle
    )
}

private fun VariantsSettings?.serialize(): Any? {
    if (this == null) {
        return null
    }
    return mapOf(
        "enabled" to enabled,
        "experimentsJson" to experimentsJson,
        "activateWith" to activateWith,
    )
}

private fun PublishedApp.serialize(): Any {
    return mapOf(
        "bundleId" to bundleId,
        "platform" to platform.name,
    )
}

private fun TCF2ChangedPurposes?.serialize(): Any? {
    if (this == null) {
        return null
    }
    return mapOf(
        "purposes" to purposes,
        "legIntPurposes" to legIntPurposes
    )
}
