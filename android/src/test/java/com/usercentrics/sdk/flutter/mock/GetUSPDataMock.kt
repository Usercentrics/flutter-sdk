package com.usercentrics.sdk.flutter.mock

import com.usercentrics.ccpa.CCPAData
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall

internal class GetUSPDataMock {
    companion object {
        val fake = CCPAData(
            version = 1,
            noticeGiven = true,
            optedOut = false,
            lspact = null,
        )

        // From the debugger
        val call = FakeFlutterMethodCall(method = "getUSPData", arguments = null)
        val expected = mapOf(
            "version" to 1,
            "noticeGiven" to true,
            "optedOut" to false,
            "lspact" to null,
        )
    }
}