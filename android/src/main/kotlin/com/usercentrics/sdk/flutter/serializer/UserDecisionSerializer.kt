package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.UserDecision
import com.usercentrics.sdk.services.tcf.interfaces.TCFUserDecisionOnPurpose
import com.usercentrics.sdk.services.tcf.interfaces.TCFUserDecisionOnSpecialFeature
import com.usercentrics.sdk.services.tcf.interfaces.TCFUserDecisionOnVendor
import com.usercentrics.sdk.services.tcf.interfaces.TCFUserDecisions

internal fun Any?.deserializeUserDecision(): UserDecision {
    this as Map<*, *>
    return UserDecision(
        serviceId = this["serviceId"] as String,
        consent = this["consent"] as Boolean,
    )
}

internal fun Any?.deserializeTCFUserDecisions(): TCFUserDecisions {
    this as Map<*, *>
    return TCFUserDecisions(
        purposes = (this["purposes"] as List<*>).map { it.deserializeTCFUserDecisionOnPurpose() },
        specialFeatures = (this["specialFeatures"] as List<*>).map { it.deserializeTCFUserDecisionOnSpecialFeature() },
        vendors = (this["vendors"] as List<*>).map { it.deserializeTCFUserDecisionOnVendor() },
    )
}

private fun Any?.deserializeTCFUserDecisionOnPurpose(): TCFUserDecisionOnPurpose {
    this as Map<*, *>
    return TCFUserDecisionOnPurpose(
        id = this["id"] as Int,
        consent = this["consent"] as Boolean?,
        legitimateInterestConsent = this["legitimateInterestConsent"] as Boolean?,
    )
}

private fun Any?.deserializeTCFUserDecisionOnSpecialFeature(): TCFUserDecisionOnSpecialFeature {
    this as Map<*, *>
    return TCFUserDecisionOnSpecialFeature(
        id = this["id"] as Int,
        consent = this["consent"] as Boolean?,
    )
}

private fun Any?.deserializeTCFUserDecisionOnVendor(): TCFUserDecisionOnVendor {
    this as Map<*, *>
    return TCFUserDecisionOnVendor(
        id = this["id"] as Int,
        consent = this["consent"] as Boolean?,
        legitimateInterestConsent = this["legitimateInterestConsent"] as Boolean?,
    )
}