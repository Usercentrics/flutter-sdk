package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.UsercentricsReadyStatus

internal fun UsercentricsReadyStatus.serialize(): Any {
    return mapOf(
        "shouldCollectConsent" to shouldCollectConsent,
        "consents" to consents.map { it.serialize() }
    )
}