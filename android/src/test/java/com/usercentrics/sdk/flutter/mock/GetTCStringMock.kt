package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall

internal class GetTCStringMock {
    companion object {
         const val fake = "AAAAAAAAAAAAAAA"

        // From the debugger
         val call = FakeFlutterMethodCall(method = "getTCString", arguments = null)
         const val expected = "AAAAAAAAAAAAAAA"
    }
}