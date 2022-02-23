package com.usercentrics.sdk.flutter.serializer

import android.graphics.Typeface
import com.usercentrics.sdk.BannerFont
import com.usercentrics.sdk.flutter.api.FlutterActivityProvider
import com.usercentrics.sdk.flutter.api.FlutterAssetsProvider

internal fun Any?.deserializeBannerFont(
    assetsProvider: FlutterAssetsProvider,
    activityProvider: FlutterActivityProvider
): BannerFont? {
    if (this !is Map<*, *>) return null

    val regularFont =
        this["regularFontAssetPath"]?.deserializeTypeface(assetsProvider, activityProvider)
    val boldFont = this["boldFontAssetPath"]?.deserializeTypeface(assetsProvider, activityProvider)
    val size = this["fontSize"] as? Number

    return if (regularFont != null && boldFont != null && size != null) {
        BannerFont(
            regularFont = regularFont,
            boldFont = boldFont,
            sizeInSp = size.toFloat()
        )
    } else null
}

internal fun Any?.deserializeTypeface(
    assetsProvider: FlutterAssetsProvider,
    activityProvider: FlutterActivityProvider
): Typeface? {
    if (this !is String) return null

    val fontAssetPath = assetsProvider.getAssetFilePathByName(this) ?: return null
    val assets = activityProvider.provide()?.assets ?: return null
    return Typeface.createFromAsset(assets, fontAssetPath)
}