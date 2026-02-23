package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.v2.settings.data.ConsentDisclosure
import com.usercentrics.sdk.v2.settings.data.ConsentDisclosureObject
import com.usercentrics.sdk.v2.settings.data.ConsentDisclosureSDK

internal fun ConsentDisclosureObject?.serializer(): Any? {
    if (this == null) {
        return null
    }
    return mapOf(
        "disclosures" to disclosures.map { it.serializer() },
        "sdks" to sdks.map { it.serializer() }
    )
}

private fun ConsentDisclosureSDK.serializer(): Map<String, Any> {
    return mapOf(
        "name" to name,
        "use" to use
    )
}

internal fun ConsentDisclosure.serializer(): Any {
    return mapOf(
        "identifier" to identifier,
        "type" to (type?.name ?: ""),
        "name" to name,
        "maxAgeSeconds" to maxAgeSeconds,
        "cookieRefresh" to cookieRefresh,
        "purposes" to purposes,
        "domain" to domain,
        "description" to description,
    )
}
