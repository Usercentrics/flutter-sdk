package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.UsercentricsReadyStatus

internal fun UsercentricsReadyStatus.serialize(): Any {
    return mapOf(
        "shouldShowCMP" to shouldShowCMP,
        "consents" to consents.map { it.serialize() }
    )
}