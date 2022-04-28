package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.*
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.models.settings.UsercentricsConsentType

internal object ShowSecondLayerMock {

    // From the debugger
    val call = FakeFlutterMethodCall(
        method = "showSecondLayer", arguments = mapOf(
            "bannerSettings" to mapOf(
                "font" to null,
                "logo" to null,
                "links" to "SECOND_LAYER_ONLY",
                "secondLayerSettings" to mapOf(
                    "showCloseButton" to true,
                )
            )
        )
    )
    val expectedBannerSettings = BannerSettings(
        links = LegalLinksSettings.SECOND_LAYER_ONLY,
        secondLayerSettings = SecondLayerStyleSettings(
            showCloseButton = true,
        )
    )
    val fakeResponseWithData = UsercentricsConsentUserResponse(
        consents = listOf(
            UsercentricsServiceConsent(
                templateId = "ocv9HNX_g",
                status = false,
                dataProcessor = "Facebook SDK",
                type = UsercentricsConsentType.EXPLICIT,
                version = "1.0.1",
                isEssential = true,
                history = listOf(
                    UsercentricsConsentHistoryEntry(
                        status = true,
                        type = UsercentricsConsentType.EXPLICIT,
                        timestampInMillis = 123,
                    )
                )
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
                "isEssential" to true,
                "history" to listOf(
                    mapOf(
                        "status" to true, "timestampInMillis" to 123L, "type" to "EXPLICIT",
                    )
                )
            )
        )
    )
    val fakeResponseWithoutData = null
    val expectedWithoutData = null

}