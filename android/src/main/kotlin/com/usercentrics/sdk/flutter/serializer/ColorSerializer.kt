package com.usercentrics.sdk.flutter.serializer

import android.graphics.Color
import androidx.annotation.ColorInt

@ColorInt
internal fun String.deserializeColor(): Int? {
    return runCatching {
        Color.parseColor(this)
    }.getOrNull()
}