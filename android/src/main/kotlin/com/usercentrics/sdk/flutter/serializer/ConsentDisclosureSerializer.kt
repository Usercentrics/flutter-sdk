package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.v2.settings.data.ConsentDisclosure
import com.usercentrics.sdk.v2.settings.data.ConsentDisclosureObject

internal fun ConsentDisclosureObject?.serializer(): Any? {
    if (this == null) {
        return null
    }
    return disclosures.map { it.serializer() }
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
