package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.BannerSettings
import com.usercentrics.sdk.flutter.api.FlutterActivityProvider
import com.usercentrics.sdk.flutter.api.FlutterAssetsProvider

internal fun Any?.deserializeBannerSettings(
    assetsProvider: FlutterAssetsProvider,
    activityProvider: FlutterActivityProvider
): BannerSettings? {
    if (this !is Map<*, *>) {
        return null
    }
    return BannerSettings(
        firstLayerStyleSettings = this["firstLayerStyleSettings"].deserializeFirstLayerStyleSettings(
            assetsProvider,
            activityProvider
        ),
        secondLayerStyleSettings = this["secondLayerStyleSettings"].deserializeSecondLayerStyleSettings(
            assetsProvider,
            activityProvider
        ),
        generalStyleSettings = this["generalStyleSettings"].deserializeGeneralStyleSettings(
            assetsProvider,
            activityProvider
        ),
        variantName = this["variantName"] as? String?
    )
}



