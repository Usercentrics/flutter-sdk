package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.UsercentricsReadyStatus
import com.usercentrics.sdk.UsercentricsServiceConsent
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.models.settings.UsercentricsConsentType

internal class RestoreUserSessionMock {

    companion object {
        val fake = UsercentricsReadyStatus(
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

        // From the debugger
        val call =
            FakeFlutterMethodCall(
                method = "restoreUserSession",
                arguments = "8620139AAAAAAAAAAAAAAAdddc2b52973f9807d6b45"
            )
        val expected = mapOf(
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
        val expectedControllerId =
            "8620139AAAAAAAAAAAAAAAdddc2b52973f9807d6b45"
    }
}