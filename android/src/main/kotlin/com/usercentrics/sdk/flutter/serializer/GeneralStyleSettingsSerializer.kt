package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.GeneralStyleSettings
import com.usercentrics.sdk.flutter.api.FlutterActivityProvider
import com.usercentrics.sdk.flutter.api.FlutterAssetsProvider

internal fun Any?.deserializeGeneralStyleSettings(
    assetsProvider: FlutterAssetsProvider,
    activityProvider: FlutterActivityProvider,
): GeneralStyleSettings? {
    if (this !is Map<*, *>) {
        return null
    }
    return GeneralStyleSettings(
        textColor = (this["textColor"] as? String)?.deserializeColor(),
        layerBackgroundColor = (this["layerBackgroundColor"] as? String)?.deserializeColor(),
        layerBackgroundSecondaryColor = (this["layerBackgroundSecondaryColor"] as? String)?.deserializeColor(),
        linkColor = (this["linkColor"] as? String)?.deserializeColor(),
        tabColor = (this["tabColor"] as? String)?.deserializeColor(),
        bordersColor = (this["bordersColor"] as? String)?.deserializeColor(),
        toggleStyleSettings = this["toggleStyleSettings"]?.deserializeToggleStyleSettings(),
        logo = this["logo"].deserializeImage(assetsProvider, activityProvider),
        font = this["font"].deserializeBannerFont(assetsProvider, activityProvider),
        links = this["links"].deserializeLegalLinksSettings(),
        disableSystemBackButton = this["disableSystemBackButton"] as? Boolean,
    )
}
