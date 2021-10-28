package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall

internal class ResetMock {

    companion object {
        // From the debugger
         val call = FakeFlutterMethodCall(method = "reset", arguments = null)
         val expected = null
    }
}