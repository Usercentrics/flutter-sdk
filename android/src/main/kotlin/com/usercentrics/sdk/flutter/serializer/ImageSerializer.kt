package com.usercentrics.sdk.flutter.serializer

import android.graphics.BitmapFactory
import com.usercentrics.sdk.UsercentricsImage
import com.usercentrics.sdk.flutter.api.FlutterActivityProvider
import com.usercentrics.sdk.flutter.api.FlutterAssetsProvider

internal fun Any?.deserializeImage(
    assetsProvider: FlutterAssetsProvider,
    activityProvider: FlutterActivityProvider,
): UsercentricsImage? {
    if (this !is String) return null

    val path = assetsProvider.getAssetFilePathByName(this) ?: return null
    val assets = activityProvider.provide()?.assets ?: return null
    val bitmap = assets.open(path).use { BitmapFactory.decodeStream(it) }
    return UsercentricsImage.ImageBitmap(bitmap)
}