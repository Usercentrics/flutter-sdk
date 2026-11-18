package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.services.ageverification.ExperimentalAgeSignalsApi
import com.usercentrics.sdk.services.ageverification.UsercentricsAgeSignalDecision

// Enums travel by their native name, and a missing value stays null.
@OptIn(ExperimentalAgeSignalsApi::class)
internal fun UsercentricsAgeSignalDecision.serialize(): Any {
    return mapOf(
        "source" to source.name,
        "trust" to trust?.name,
        "band" to band?.name,
        "ageLower" to ageLower,
        "ageUpper" to ageUpper,
        "unavailableReason" to unavailableReason?.name,
    )
}
