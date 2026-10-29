package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.models.settings.SecondLayerTab

// An unknown value falls back to the default tab, like a tab the layout does not have.
internal fun Any?.deserializeSecondLayerTab(): SecondLayerTab? {
    val value = this as? String ?: return null
    return runCatching { SecondLayerTab.valueOf(value) }.getOrNull()
}
