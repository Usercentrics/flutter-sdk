package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.UsercentricsConsentHistoryEntry
import com.usercentrics.sdk.UsercentricsServiceConsent
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.models.settings.UsercentricsConsentType

internal object AcceptAllMock {
    val fake = listOf(
        UsercentricsServiceConsent(
            templateId = "ocv9HNX_g",
            status = true,
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
            ),
            category = "essential"
        )
    )

    // From the debugger
    val call = FakeFlutterMethodCall(method = "acceptAll", arguments = "EXPLICIT")
    val callConsentType = UsercentricsConsentType.EXPLICIT
    val expected = listOf(
        mapOf(
            "templateId" to "ocv9HNX_g",
            "status" to true,
            "type" to "EXPLICIT",
            "version" to "1.0.1",
            "dataProcessor" to "Facebook SDK",
            "isEssential" to true,
            "history" to listOf(
                mapOf(
                    "status" to true, "timestampInMillis" to 123L, "type" to "EXPLICIT",
                )
            ),
            "category" to "essential"
        )
    )
}