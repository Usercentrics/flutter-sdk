package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.PopupPosition
import com.usercentrics.sdk.UsercentricsLayout

internal fun Any?.deserializeLayout(): UsercentricsLayout? {
    this ?: return null

    return when (this as String) {
        "FULL" -> UsercentricsLayout.Full
        "SHEET" -> UsercentricsLayout.Sheet
        "POPUP_BOTTOM" -> UsercentricsLayout.Popup(PopupPosition.BOTTOM)
        "POPUP_CENTER" -> UsercentricsLayout.Popup(PopupPosition.CENTER)
        else -> throw IllegalArgumentException("Invalid layout: $this")
    }
}

