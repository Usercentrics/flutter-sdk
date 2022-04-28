package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.LegalLinksSettings

internal fun Any?.deserializeLegalLinksSettings(): LegalLinksSettings? {
    if (this !is String) return null
    return LegalLinksSettings.valueOf(this)
}