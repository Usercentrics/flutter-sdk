package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.AdTechProvider
import com.usercentrics.sdk.AdditionalConsentModeData

internal fun AdditionalConsentModeData.serialize(): Any {
    return mapOf(
        "acString" to acString,
        "adTechProviders" to adTechProviders.map { it.serialize() }
    )
}

private fun AdTechProvider.serialize() : Any {
    return mapOf(
        "id" to id,
        "name" to name,
        "privacyPolicyUrl" to privacyPolicyUrl,
        "consent" to consent
    )
}
