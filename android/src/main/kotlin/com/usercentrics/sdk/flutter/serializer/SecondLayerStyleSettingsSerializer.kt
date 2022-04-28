package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.ButtonLayout
import com.usercentrics.sdk.SecondLayerStyleSettings
import com.usercentrics.sdk.flutter.api.FlutterActivityProvider
import com.usercentrics.sdk.flutter.api.FlutterAssetsProvider

internal fun Any?.deserializeSecondLayerStyleSettings(
    assetsProvider: FlutterAssetsProvider,
    activityProvider: FlutterActivityProvider,
): SecondLayerStyleSettings? {
    if (this !is Map<*, *>) return null

    val buttons = (this["buttonLayout"] as? List<*>)?.mapNotNull { row ->
        (row as? List<*>)?.mapNotNull {
            it.deserializeButtonSettings(
                assetsProvider,
                activityProvider
            )
        }
    }
    val buttonLayout = if (buttons != null) ButtonLayout.Grid(buttons) else null
    val showCloseButton = this["showCloseButton"] as? Boolean

    return SecondLayerStyleSettings(
        showCloseButton = showCloseButton,
        buttonLayout = buttonLayout,
    )
}