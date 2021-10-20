package com.usercentrics.sdk.flutter.serializer

import android.graphics.BitmapFactory
import android.graphics.Typeface
import com.usercentrics.sdk.UsercentricsFont
import com.usercentrics.sdk.UsercentricsImage
import com.usercentrics.sdk.UsercentricsUISettings
import com.usercentrics.sdk.flutter.api.FlutterActivityProvider
import com.usercentrics.sdk.flutter.api.FlutterAssetsProvider

internal class UISettingsSerializer(
    private val assetsProvider: FlutterAssetsProvider,
    private val activityProvider: FlutterActivityProvider
) : DataDeserializer<UsercentricsUISettings> {

    override fun deserialize(value: Any?): UsercentricsUISettings {
        value as Map<*, *>
        return UsercentricsUISettings(
            showCloseButton = value["showCloseButton"] as? Boolean? ?: false,
            customLogo = deserializeImage(value["customLogo"] as? String?),
            customFont = deserializeFont(value["customFont"] as? Map<*, *>?)
        )
    }

    private fun deserializeFont(fontMap: Map<*, *>?): UsercentricsFont? {
        fontMap ?: return null

        val typeface = fontMap["fontAssetPath"]?.let {
            val fontAssetPath =
                assetsProvider.getAssetFilePathByName(it as String) ?: return@let null
            val assets = activityProvider.provide()?.assets ?: return@let null
            Typeface.createFromAsset(assets, fontAssetPath)
        }
        val size = fontMap["fontSize"] as? Double

        return if (typeface != null && size != null) {
            UsercentricsFont(
                font = typeface,
                sizeInSp = size.toFloat()
            )
        } else null
    }

    private fun deserializeImage(imageAsset: String?): UsercentricsImage? {
        imageAsset ?: return null

        val path = assetsProvider.getAssetFilePathByName(imageAsset) ?: return null
        val assets = activityProvider.provide()?.assets ?: return null
        val bitmap = assets.open(path).use { BitmapFactory.decodeStream(it) }
        return UsercentricsImage.ImageBitmap(bitmap)
    }

}