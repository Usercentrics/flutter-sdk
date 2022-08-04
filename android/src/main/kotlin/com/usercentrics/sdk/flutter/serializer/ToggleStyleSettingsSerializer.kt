package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.ToggleStyleSettings

internal fun Any?.deserializeToggleStyleSettings(): ToggleStyleSettings? {
    if (this !is Map<*, *>) {
        return null
    }
    return ToggleStyleSettings(
        activeBackgroundColor = (this["activeBackgroundColor"] as? String)?.deserializeColor(),
        inactiveBackgroundColor = (this["inactiveBackgroundColor"] as? String)?.deserializeColor(),
        disabledBackgroundColor = (this["disabledBackgroundColor"] as? String)?.deserializeColor(),
        activeThumbColor = (this["activeThumbColor"] as? String)?.deserializeColor(),
        inactiveThumbColor = (this["inactiveThumbColor"] as? String)?.deserializeColor(),
        disabledThumbColor = (this["disabledThumbColor"] as? String)?.deserializeColor(),
    )
}
