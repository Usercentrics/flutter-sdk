package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall

internal class InitializeMock {
    companion object {
        // From the debugger
        val callWithData = FakeFlutterMethodCall(
            method = "initialize",
            arguments = mapOf(
                "settingsId" to "AAAAA",
                "defaultLanguage" to "en",
                "loggerLevel" to "DEBUG",
                "timeoutMillis" to 1000,
                "version" to "1.2.3"
            )
        )
        val callWithoutData = FakeFlutterMethodCall(
            method = "initialize",
            arguments = mapOf(
                "settingsId" to "AAAAA",
                "defaultLanguage" to null,
                "loggerLevel" to null,
                "timeoutMillis" to null,
                "version" to null
            )
        )
        val expected: Any? = null
    }

}