package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.*
import com.usercentrics.sdk.flutter.api.FlutterActivityProvider
import com.usercentrics.sdk.flutter.api.FlutterAssetsProvider

internal fun Any?.deserializeFirstLayerStyleSettings(
    assetsProvider: FlutterAssetsProvider,
    activityProvider: FlutterActivityProvider,
): FirstLayerStyleSettings? {
    if (this !is Map<*, *>) return null
    val layout = this["layout"].deserializeLayout()

    val headerImage =
        this["headerImage"]?.deserializeHeaderImageSettings(assetsProvider, activityProvider)

    val title = this["title"]?.deserializeTitleSettings(assetsProvider, activityProvider)
    val message = this["message"]?.deserializeMessageSettings(assetsProvider, activityProvider)

    val buttons = (this["buttonLayout"] as? List<*>)?.mapNotNull { row ->
        (row as? List<*>)?.mapNotNull {
            it.deserializeButtonSettings(
                assetsProvider,
                activityProvider
            )
        }
    }
    val buttonLayout = if (buttons != null) ButtonLayout.Grid(buttons) else null

    val backgroundColor = (this["backgroundColor"] as? String)?.deserializeColor()
    val overlayColor = (this["overlayColor"] as? String)?.deserializeColor()
    val cornerRadius = this["cornerRadius"] as? Int

    return FirstLayerStyleSettings(
        layout = layout,
        headerImage = headerImage,
        title = title,
        message = message,
        buttonLayout = buttonLayout,
        backgroundColor = backgroundColor,
        overlayColor = overlayColor,
        cornerRadius = cornerRadius,
    )
}

internal fun Any?.deserializeHeaderImageSettings(
    assetsProvider: FlutterAssetsProvider,
    activityProvider: FlutterActivityProvider,
): HeaderImageSettings? {
    if (this !is Map<*, *>) return null

    val isHidden = this["isHidden"] as? Boolean ?: false
    if (isHidden) {
        return HeaderImageSettings.Hidden
    }

    val image = this["image"].deserializeImage(assetsProvider, activityProvider) ?: return null

    val isExtended = this["isExtended"] as? Boolean ?: false
    return if (isExtended) {
        HeaderImageSettings.ExtendedLogoSettings(image)
    } else {
        HeaderImageSettings.LogoSettings(
            image = image,
            alignment = this["alignment"]?.deserializeSectionAlignment(),
            heightInDp = (this["height"] as? Number)?.toFloat()
        )
    }
}

internal fun Any?.deserializeSectionAlignment(): SectionAlignment? {
    if (this !is String) return null
    return SectionAlignment.valueOf(this)
}

internal fun Any?.deserializeTitleSettings(
    assetsProvider: FlutterAssetsProvider,
    activityProvider: FlutterActivityProvider,
): TitleSettings? {
    if (this !is Map<*, *>) return null

    return TitleSettings(
        alignment = this["alignment"]?.deserializeSectionAlignment(),
        font = this["fontAssetPath"].deserializeTypeface(assetsProvider, activityProvider),
        textColor = (this["textColor"] as? String)?.deserializeColor(),
        textSizeInSp = (this["textSize"] as? Number)?.toFloat(),
    )
}

internal fun Any?.deserializeMessageSettings(
    assetsProvider: FlutterAssetsProvider,
    activityProvider: FlutterActivityProvider,
): MessageSettings? {
    if (this !is Map<*, *>) return null

    return MessageSettings(
        alignment = this["alignment"]?.deserializeSectionAlignment(),
        font = this["fontAssetPath"].deserializeTypeface(assetsProvider, activityProvider),
        textColor = (this["textColor"] as? String)?.deserializeColor(),
        linkTextColor = (this["linkTextColor"] as? String)?.deserializeColor(),
        underlineLink = this["linkTextUnderline"] as? Boolean,
        textSizeInSp = (this["textSize"] as? Number)?.toFloat(),
    )
}
