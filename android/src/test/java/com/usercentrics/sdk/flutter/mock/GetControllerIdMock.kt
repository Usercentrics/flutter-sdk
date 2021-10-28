package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall

internal class GetControllerIdMock {
    companion object {
        const val fake =
            "8620135313b043696b806868b20da905886a3a2598ddddc2b52973f9807d6b45"

        // From the debugger
        val call = FakeFlutterMethodCall(method = "getControllerId", arguments = null)
        const val expected =
            "8620135313b043696b806868b20da905886a3a2598ddddc2b52973f9807d6b45"
    }
}