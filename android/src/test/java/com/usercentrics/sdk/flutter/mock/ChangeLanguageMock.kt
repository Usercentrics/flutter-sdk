package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall

internal object ChangeLanguageMock {
    // From the debugger
    val call = FakeFlutterMethodCall(method = "changeLanguage", arguments = "en")
    val callLanguage = "en"
    val expected = null
}