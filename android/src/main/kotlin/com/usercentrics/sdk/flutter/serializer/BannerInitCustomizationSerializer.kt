@file:Suppress("DEPRECATION")

package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.BannerInitCustomization
import com.usercentrics.sdk.PurposeListStyle

internal fun Any?.deserializeBannerInitCustomization(): BannerInitCustomization? {
    if (this !is Map<*, *>) {
        return null
    }
    return BannerInitCustomization(
        paddingTop = this["paddingTop"] as? Int,
        paddingBottom = this["paddingBottom"] as? Int,
        paddingStart = this["paddingStart"] as? Int,
        paddingEnd = this["paddingEnd"] as? Int,
        lineSpacingMultiplier = (this["lineSpacingMultiplier"] as? Double)?.toFloat(),
        titleFontSize = this["titleFontSize"] as? Int,
        bodyFontSize = this["bodyFontSize"] as? Int,
        linkFontSize = this["linkFontSize"] as? Int,
        titleFontBold = this["titleFontBold"] as? Boolean,
        headerPaddingTop = this["headerPaddingTop"] as? Int,
        headerPaddingSides = this["headerPaddingSides"] as? Int,
        headerPaddingBetweenElements = this["headerPaddingBetweenElements"] as? Int,
        buttonBorderColor = this["buttonBorderColor"] as? String,
        buttonBorderWidth = this["buttonBorderWidth"] as? Int,
        purposeListStyle = (this["purposeListStyle"] as? String)?.let {
            PurposeListStyle.valueOf(it)
        },
        stickyHeader = this["stickyHeader"] as? Boolean,
        hideLanguageSwitcher = this["hideLanguageSwitcher"] as? Boolean,
        buttonHeightDp = this["buttonHeightDp"] as? Int,
        buttonHorizontalPaddingDp = this["buttonHorizontalPaddingDp"] as? Int,
        buttonSpacingDp = this["buttonSpacingDp"] as? Int,
        linkUnderline = this["linkUnderline"] as? Boolean,
        showSecondLayerCloseButton = this["showSecondLayerCloseButton"] as? Boolean,
        tabFontSize = this["tabFontSize"] as? Int,
        tabActiveColor = this["tabActiveColor"] as? String,
        denyAllButtonBackground = this["denyAllButtonBackground"] as? String,
        acceptAllButtonBackground = this["acceptAllButtonBackground"] as? String,
        linkColor = this["linkColor"] as? String,
    )
}
