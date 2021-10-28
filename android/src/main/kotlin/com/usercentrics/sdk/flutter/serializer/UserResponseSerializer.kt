package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.UsercentricsConsentUserResponse

internal fun UsercentricsConsentUserResponse.serialize(): Any {
    return mapOf(
        "controllerId" to controllerId,
        "userInteraction" to userInteraction.name,
        "consents" to consents.map { it.serialize() }
    )
}