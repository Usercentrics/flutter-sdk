package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.UsercentricsConsentHistoryEntry
import com.usercentrics.sdk.UsercentricsServiceConsent
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.models.settings.UsercentricsConsentType

internal object GetConsentsMock {

    val fakeWithData = listOf(
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
    )
    val fakeWithoutData = listOf<UsercentricsServiceConsent>()

    // From the debugger
    val call = FakeFlutterMethodCall(method = "getConsents", arguments = null)
    val expectedWithData = listOf(
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
    val expectedWithoutData = listOf<Any>()

}