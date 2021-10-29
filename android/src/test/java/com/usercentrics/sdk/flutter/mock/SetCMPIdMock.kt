package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall

internal class SetCMPIdMock {
    companion object {
        // From the debugger
        val call = FakeFlutterMethodCall(
            method = "setCMPId",
            arguments = 1234
        )
        const val callCmpId = 1234
        val expected: Any? = null
    }
}