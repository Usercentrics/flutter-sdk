package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.UsercentricsConsentUserResponse
import com.usercentrics.sdk.UsercentricsServiceConsent
import com.usercentrics.sdk.UsercentricsUISettings
import com.usercentrics.sdk.UsercentricsUserInteraction
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.models.settings.UsercentricsConsentType

internal class ShowCMPMock {

    companion object {
        // From the debugger
        val call = FakeFlutterMethodCall(
            method = "showCMP", arguments = mapOf(
                "customFont" to null,
                "showCloseButton" to true,
                "customLogo" to null
            )
        )
        val fakeActivityResponseWithData = UsercentricsConsentUserResponse(
            consents = listOf(
                UsercentricsServiceConsent(
                    templateId = "ocv9HNX_g",
                    status = false,
                    dataProcessor = "Facebook SDK",
                    type = UsercentricsConsentType.EXPLICIT,
                    version = "1.0.1"
                )
            ),
            controllerId = "8620135313b043696b806868b20da905886a3a2598ddddc2b52973f9807d6b45",
            userInteraction = UsercentricsUserInteraction.ACCEPT_ALL
        )
        val expectedWithData = mapOf(
            "controllerId" to "8620135313b043696b806868b20da905886a3a2598ddddc2b52973f9807d6b45",
            "userInteraction" to "ACCEPT_ALL",
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
        val fakeActivityResponseWithoutData = null
        val expectedWithoutData = null
    }

}