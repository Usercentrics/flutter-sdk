package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.BannerSettings
import com.usercentrics.sdk.flutter.api.FlutterActivityProvider
import com.usercentrics.sdk.flutter.api.FlutterAssetsProvider

internal fun Any?.deserializeBannerSettings(
    assetsProvider: FlutterAssetsProvider,
    activityProvider: FlutterActivityProvider
): BannerSettings? {
    if (this !is Map<*, *>) return null
    return BannerSettings(
        logo = this["logo"].deserializeImage(assetsProvider, activityProvider),
        font = this["font"].deserializeFont(assetsProvider, activityProvider)
    )
}



