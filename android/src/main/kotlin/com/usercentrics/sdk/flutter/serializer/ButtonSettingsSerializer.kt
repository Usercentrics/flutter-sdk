package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.ButtonSettings
import com.usercentrics.sdk.ButtonType
import com.usercentrics.sdk.flutter.api.FlutterActivityProvider
import com.usercentrics.sdk.flutter.api.FlutterAssetsProvider

internal fun Any?.deserializeButtonSettings(
    assetsProvider: FlutterAssetsProvider,
    activityProvider: FlutterActivityProvider,
): ButtonSettings? {
    if (this !is Map<*, *>) return null

    return ButtonSettings(
        type = this["type"]?.deserializeButtonType()!!,
        isAllCaps = this["isAllCaps"] as? Boolean,
        font = this["fontAssetPath"].deserializeTypeface(assetsProvider, activityProvider),
        textColor = (this["textColor"] as? String)?.deserializeColor(),
        backgroundColor = (this["backgroundColor"] as? String)?.deserializeColor(),
        cornerRadius = this["cornerRadius"] as? Int,
        textSizeInSp = (this["textSize"] as? Number)?.toFloat(),
    )
}

internal fun Any?.deserializeButtonType(): ButtonType? {
    if (this !is String) return null
    return ButtonType.valueOf(this)
}