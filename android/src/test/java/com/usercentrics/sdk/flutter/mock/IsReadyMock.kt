package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.UsercentricsReadyStatus
import com.usercentrics.sdk.UsercentricsServiceConsent
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.models.settings.UsercentricsConsentType

internal class IsReadyMock {

    companion object {
        val fakeWithData = UsercentricsReadyStatus(
            shouldShowCMP = false,
            consents = listOf(
                UsercentricsServiceConsent(
                    templateId = "ocv9HNX_g",
                    status = false,
                    dataProcessor = "Facebook SDK",
                    type = UsercentricsConsentType.EXPLICIT,
                    version = "1.0.1"
                )
            )
        )
        val fakeWithoutData = UsercentricsReadyStatus(
            shouldShowCMP = false,
            consents = listOf()
        )

        // From the debugger
        val call = FakeFlutterMethodCall(method = "isReady", arguments = null)
        val expectedWithData = mapOf(
            "shouldShowCMP" to false,
            "consents" to listOf(
                mapOf(
                    "templateId" to "ocv9HNX_g",
                    "status" to false,
                    "type" to "EXPLICIT",
                    "version" to "1.0.1",
                    "dataProcessor" to "Facebook SDK",
                )
            )
        )
        val expectedWithoutData = mapOf(
            "shouldShowCMP" to false,
            "consents" to listOf<Any>()
        )
    }
}