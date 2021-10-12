package com.usercentrics.sdk.flutter.serializer

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Typeface
import com.usercentrics.sdk.UsercentricsFont
import com.usercentrics.sdk.UsercentricsImage
import com.usercentrics.sdk.UsercentricsUISettings
import com.usercentrics.sdk.flutter.UsercentricsPlugin

internal class UISettingsSerializer : DataDeserializer<UsercentricsUISettings> {

    override fun deserialize(value: Any): UsercentricsUISettings {
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
                UsercentricsPlugin.flutterAssets?.getAssetFilePathByName(it as String)
            Typeface.createFromAsset(UsercentricsPlugin.applicationContext?.assets, fontAssetPath)
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

        imageAsset?.let {
            val path = UsercentricsPlugin.flutterAssets?.getAssetFilePathByName(it)
            val bitmap = getBitmapFromAsset(UsercentricsPlugin.applicationContext!!, path!!)
            return@deserializeImage UsercentricsImage.ImageBitmap(bitmap)
        }

        return null
    }

    private fun getBitmapFromAsset(context: Context, path: String): Bitmap =
        context.assets.open(path).use { BitmapFactory.decodeStream(it) }

}