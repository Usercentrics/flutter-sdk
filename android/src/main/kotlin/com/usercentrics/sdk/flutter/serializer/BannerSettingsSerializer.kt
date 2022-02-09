package com.usercentrics.sdk.flutter.serializer

import android.graphics.BitmapFactory
import android.graphics.Typeface
import com.usercentrics.sdk.BannerSettings
import com.usercentrics.sdk.UsercentricsFont
import com.usercentrics.sdk.UsercentricsImage
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

private fun Any?.deserializeFont(
    assetsProvider: FlutterAssetsProvider,
    activityProvider: FlutterActivityProvider
): UsercentricsFont? {
    if (this !is Map<*, *>) return null

    val typeface = this["fontAssetPath"]?.let {
        val fontAssetPath =
            assetsProvider.getAssetFilePathByName(it as String) ?: return@let null
        val assets = activityProvider.provide()?.assets ?: return@let null
        Typeface.createFromAsset(assets, fontAssetPath)
    }
    val size = this["fontSize"] as? Double

    return if (typeface != null && size != null) {
        UsercentricsFont(
            font = typeface,
            sizeInSp = size.toFloat()
        )
    } else null
}


private fun Any?.deserializeImage(
    assetsProvider: FlutterAssetsProvider,
    activityProvider: FlutterActivityProvider
): UsercentricsImage? {
    if (this !is String) return null

    val path = assetsProvider.getAssetFilePathByName(this) ?: return null
    val assets = activityProvider.provide()?.assets ?: return null
    val bitmap = assets.open(path).use { BitmapFactory.decodeStream(it) }
    return UsercentricsImage.ImageBitmap(bitmap)
}