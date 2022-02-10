package com.usercentrics.sdk.flutter.serializer

import android.graphics.Typeface
import com.usercentrics.sdk.UsercentricsFont
import com.usercentrics.sdk.flutter.api.FlutterActivityProvider
import com.usercentrics.sdk.flutter.api.FlutterAssetsProvider

internal fun Any?.deserializeFont(
    assetsProvider: FlutterAssetsProvider,
    activityProvider: FlutterActivityProvider
): UsercentricsFont? {
    if (this !is Map<*, *>) return null

    val typeface = this["fontAssetPath"]?.deserializeTypeface(assetsProvider, activityProvider)
    val size = this["fontSize"] as? Number

    return if (typeface != null && size != null) {
        UsercentricsFont(
            font = typeface,
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