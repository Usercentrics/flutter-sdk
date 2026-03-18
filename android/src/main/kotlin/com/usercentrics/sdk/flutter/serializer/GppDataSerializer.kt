package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.services.gpp.GppData
import com.usercentrics.sdk.services.gpp.GppSectionChangePayload

internal fun GppData.serialize(): Any {
    val serializedSections = sections.mapValues { (_, fields) ->
        fields.mapValues { (_, value) ->
            when (value) {
                null -> null
                is Boolean -> value
                is Int -> value
                is Double -> value
                is String -> value
                else -> value.toString()
            }
        }
    }
    return mapOf(
        "gppString" to gppString,
        "applicableSections" to applicableSections,
        "sections" to serializedSections
    )
}

internal fun GppSectionChangePayload.serialize(): Any {
    return mapOf(
        "data" to data
    )
}
