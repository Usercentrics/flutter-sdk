package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.GeolocationRuleset
import com.usercentrics.sdk.UsercentricsReadyStatus

internal fun UsercentricsReadyStatus.serialize(): Any {
    return mapOf(
        "shouldCollectConsent" to shouldCollectConsent,
        "consents" to consents.map { it.serialize() },
        "geolocationRuleset" to geolocationRuleset?.serialize(),
        "location" to location.serialize(),
    )
}

internal fun GeolocationRuleset.serialize(): Any {
    return mapOf(
        "activeSettingsId" to activeSettingsId,
        "bannerRequiredAtLocation" to bannerRequiredAtLocation,
    )
}
