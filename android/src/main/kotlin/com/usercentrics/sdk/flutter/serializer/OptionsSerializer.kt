package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.UsercentricsOptions
import com.usercentrics.sdk.models.common.NetworkMode
import com.usercentrics.sdk.models.common.UsercentricsLoggerLevel

internal fun Any?.deserializeOptions(): UsercentricsOptions {
    this as Map<*, *>
    val options = UsercentricsOptions()
    this["settingsId"]?.let {
        options.settingsId = it as String
    }
    this["ruleSetId"]?.let {
        options.ruleSetId = it as String
    }
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
    this["networkMode"]?.let {
        options.networkMode = NetworkMode.valueOf(it as String)
    }
    this["consentMediation"]?.let {
        options.consentMediation = it as Boolean
    }
    return options
}
