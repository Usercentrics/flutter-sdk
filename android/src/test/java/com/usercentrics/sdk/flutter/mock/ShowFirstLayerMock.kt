package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.*
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.models.settings.UsercentricsConsentType

internal object ShowFirstLayerMock {

    // From the debugger
    val call = FakeFlutterMethodCall(
        method = "showFirstLayer", arguments = mapOf(
            "layout" to "POPUP_CENTER",
            "bannerSettings" to mapOf(
                "font" to null,
                "logo" to null,
            ),
            "settings" to mapOf(
                "headerImage" to null,
                "title" to mapOf(
                    "alignment" to "END",
                    "textSize" to 20.0,
                ),
                "message" to mapOf(
                    "alignment" to "CENTER",
                    "textSize" to 16,
                    "linkTextUnderline" to true,
                ),
                "buttonLayout" to listOf(
                    listOf(
                        mapOf(
                            "type" to "MORE",
                            "textSize" to 16,
                            "cornerRadius" to 20,
                        ),
                        mapOf(
                            "type" to "ACCEPT_ALL",
                            "textSize" to 16,
                            "cornerRadius" to 20,
                        ),
                    )
                ),
                "cornerRadius" to 50
            ),
        )
    )
    val expectedFirstLayerStyleSettings = FirstLayerStyleSettings(
        title = TitleSettings(
            alignment = SectionAlignment.END,
            textSizeInSp = 20f,
        ),
        message = MessageSettings(
            alignment = SectionAlignment.CENTER,
            textSizeInSp = 16f,
            underlineLink = true,
        ),
        buttonLayout = ButtonLayout.Grid(
            listOf(
                listOf(
                    ButtonSettings(
                        type = ButtonType.MORE,
                        textSizeInSp = 16f,
                        cornerRadius = 20,
                    ),
                    ButtonSettings(
                        type = ButtonType.ACCEPT_ALL,
                        textSizeInSp = 16f,
                        cornerRadius = 20,
                    ),
                )
            )
        ),
        cornerRadius = 50,
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