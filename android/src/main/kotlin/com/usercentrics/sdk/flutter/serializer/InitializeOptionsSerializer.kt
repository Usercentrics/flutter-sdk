package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.UsercentricsOptions
import com.usercentrics.sdk.models.common.UsercentricsLoggerLevel

internal class InitializeOptionsSerializer : DataDeserializer<UsercentricsOptions> {

    override fun deserialize(value: Any): UsercentricsOptions {
        value as Map<*, *>
        val options = UsercentricsOptions(value["settingsId"] as String)
        value["defaultLanguage"]?.let {
            options.defaultLanguage = it as String
        }
        value["loggerLevel"]?.let {
            options.loggerLevel = UsercentricsLoggerLevel.valueOf(it as String)
        }
        value["timeoutMillis"]?.let {
            options.timeoutMillis = it as Long
        }
        value["version"]?.let {
            options.version = it as String
        }
        return options
    }

}