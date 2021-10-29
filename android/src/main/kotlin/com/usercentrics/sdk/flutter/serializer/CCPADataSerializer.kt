package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.ccpa.CCPAData

internal fun CCPAData.serialize(): Any {
    return mapOf(
        "version" to version,
        "noticeGiven" to noticeGiven,
        "optedOut" to optedOut,
        "lspact" to lspact
    )
}