package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.UsercentricsOptions
import com.usercentrics.sdk.models.common.UsercentricsLoggerLevel

internal fun Any?.deserializeOptions(): UsercentricsOptions {
    this as Map<*, *>
    val options = UsercentricsOptions(this["settingsId"] as String)
    this["defaultLanguage"]?.let {
        options.defaultLanguage = it as String
    }
    this["loggerLevel"]?.let {
        options.loggerLevel = UsercentricsLoggerLevel.valueOf(it as String)
    }
    this["timeoutMillis"]?.let {
        options.timeoutMillis = (it as Int).toLong()
    }
    this["version"]?.let {
        options.version = it as String
    }
    return options
}