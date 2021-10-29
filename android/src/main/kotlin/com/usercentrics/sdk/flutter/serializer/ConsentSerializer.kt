package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.UsercentricsServiceConsent

internal fun UsercentricsServiceConsent.serialize(): Any {
    return mapOf(
        "templateId" to templateId,
        "status" to status,
        "type" to type?.name,
        "version" to version,
        "dataProcessor" to dataProcessor
    )
}