package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.models.common.NetworkMode
import com.usercentrics.sdk.models.common.UsercentricsLoggerLevel

internal object InitializeMock {

    // From the debugger
    val callWithData = FakeFlutterMethodCall(
        method = "initialize",
        arguments = mapOf(
            "settingsId" to "AAAAA",
            "ruleSetId" to "BBBBB",
            "defaultLanguage" to "en",
            "loggerLevel" to "DEBUG",
            "timeoutMillis" to 1000,
            "version" to "1.2.3",
            "networkMode" to "EU",
        )
    )
    val callWithDataSettingsId = "AAAAA"
    val callWithDataRuleSetId = "BBBBB"
    val callWithDataDefaultLanguage = "en"
    val callWithDataLoggerLevel = UsercentricsLoggerLevel.DEBUG
    val callWithDataTimeoutMillis = 1000L
    val callWithDataVersion = "1.2.3"
    val callWithDataNetworkMode = NetworkMode.EU
    val callWithoutData = FakeFlutterMethodCall(
        method = "initialize",
        arguments = mapOf(
            "settingsId" to "AAAAA",
            "defaultLanguage" to null,
            "loggerLevel" to null,
            "timeoutMillis" to null,
            "version" to null,
            "networkMode" to null,
        )
    )
    val callWithoutDataSettingsId = "AAAAA"
    val expected: Any? = null

}