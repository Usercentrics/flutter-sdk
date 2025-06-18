package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.UsercentricsConsentHistoryEntry
import com.usercentrics.sdk.UsercentricsServiceConsent

internal fun UsercentricsServiceConsent.serialize(): Any {
    return mapOf(
        "templateId" to templateId,
        "status" to status,
        "type" to type?.name,
        "version" to version,
        "dataProcessor" to dataProcessor,
        "isEssential" to isEssential,
        "history" to history.map { it.serialize() },
        "category" to category
    )
}

private fun UsercentricsConsentHistoryEntry.serialize(): Any {
    return mapOf(
        "status" to status,
        "timestampInMillis" to timestampInMillis,
        "type" to type.name
    )
}