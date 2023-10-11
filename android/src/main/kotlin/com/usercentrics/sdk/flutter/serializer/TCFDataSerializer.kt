package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.services.tcf.interfaces.*
import com.usercentrics.tcf.core.model.gvl.DataRetention
import com.usercentrics.tcf.core.model.gvl.RetentionPeriod
import com.usercentrics.tcf.core.model.gvl.VendorUrl

internal fun TCFData.serialize(): Any {
    return mapOf(
        "features" to features.map { it.serialize() },
        "purposes" to purposes.map { it.serialize() },
        "specialFeatures" to specialFeatures.map { it.serialize() },
        "specialPurposes" to specialPurposes.map { it.serialize() },
        "stacks" to stacks.map { it.serialize() },
        "vendors" to vendors.map { it.serialize() },
        "tcString" to tcString,
        "thirdPartyCount" to thirdPartyCount
    )
}

private fun TCFFeature.serialize(): Any {
    return mapOf(
        "purposeDescription" to purposeDescription,
        "illustrations" to illustrations,
        "id" to id,
        "name" to name,
    )
}

private fun TCFPurpose.serialize(): Any {
    return mapOf(
        "purposeDescription" to purposeDescription,
        "illustrations" to illustrations,
        "id" to id,
        "name" to name,
        "consent" to consent,
        "isPartOfASelectedStack" to isPartOfASelectedStack,
        "legitimateInterestConsent" to legitimateInterestConsent,
        "showConsentToggle" to showConsentToggle,
        "showLegitimateInterestToggle" to showLegitimateInterestToggle,
        "stackId" to stackId,
    )
}


private fun TCFSpecialPurpose.serialize(): Any {
    return mapOf(
        "purposeDescription" to purposeDescription,
        "illustrations" to illustrations,
        "id" to id,
        "name" to name,
    )
}

private fun TCFSpecialFeature.serialize(): Any {
    return mapOf(
        "purposeDescription" to purposeDescription,
        "illustrations" to illustrations,
        "id" to id,
        "name" to name,
        "consent" to consent,
        "isPartOfASelectedStack" to isPartOfASelectedStack,
        "stackId" to stackId,
        "showConsentToggle" to showConsentToggle,
    )
}

private fun TCFStack.serialize(): Any {
    return mapOf(
        "description" to description,
        "id" to id,
        "name" to name,
        "purposeIds" to purposeIds,
        "specialFeatureIds" to specialFeatureIds,
    )
}

private fun TCFVendor.serialize(): Any {
    return mapOf(
        "consent" to consent,
        "features" to features.map { it.id },
        "flexiblePurposes" to flexiblePurposes.map { it.id },
        "id" to id,
        "legitimateInterestConsent" to legitimateInterestConsent,
        "legitimateInterestPurposes" to legitimateInterestPurposes.map { it.id },
        "name" to name,
        "policyUrl" to policyUrl,
        "purposes" to purposes.map { it.id },
//        "restrictions" to restrictions.map { restrictions.serialize() },
        "specialFeatures" to specialFeatures.map { it.id },
        "specialPurposes" to specialPurposes.map { it.id },
        "showConsentToggle" to showConsentToggle,
        "showLegitimateInterestToggle" to showLegitimateInterestToggle,
        "cookieMaxAgeSeconds" to cookieMaxAgeSeconds,
        "usesNonCookieAccess" to usesNonCookieAccess,
        "deviceStorageDisclosureUrl" to deviceStorageDisclosureUrl,
//        "deviceStorage" to deviceStorage.serialize(),
        "usesCookies" to usesCookies,
        "cookieRefresh" to cookieRefresh,
        "dataSharedOutsideEU" to dataSharedOutsideEU,
        "dataRetention" to dataRetention?.serializer(),
        "dataCategories" to dataCategories.map { it.id },
        "vendorUrls" to vendorUrls.map { it.serializer() }
    )
}

private fun DataRetention.serializer(): Any {
    return mapOf(
        "stdRetention" to this.stdRetention,
        "purposes" to this.purposes.idAndPeriod,
        "specialPurposes" to this.specialPurposes.idAndPeriod
    )
}
private fun VendorUrl.serializer(): Any {
    return mapOf(
        "langId" to this.langId,
        "privacy" to this.privacy,
        "legIntClaim" to this.legIntClaim
    )
}
