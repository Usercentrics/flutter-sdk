package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.GeolocationRuleset
import com.usercentrics.sdk.UsercentricsConsentHistoryEntry
import com.usercentrics.sdk.UsercentricsReadyStatus
import com.usercentrics.sdk.UsercentricsServiceConsent
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.models.settings.UsercentricsConsentType
import com.usercentrics.sdk.v2.location.data.UsercentricsLocation

internal object RestoreUserSessionMock {
    val fake = UsercentricsReadyStatus(
        shouldCollectConsent = false,
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
                ),
                category = "essential"
            )
        ),
        geolocationRuleset = GeolocationRuleset(activeSettingsId = "settingsId", bannerRequiredAtLocation = true),
        location = UsercentricsLocation(countryCode = "PT", regionCode = "PT11")
    )

    // From the debugger
    val call =
        FakeFlutterMethodCall(
            method = "restoreUserSession",
            arguments = "8620139AAAAAAAAAAAAAAAdddc2b52973f9807d6b45"
        )
    val expected = mapOf(
        "shouldCollectConsent" to false,
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
                ),
                "category" to "essential"
            )
        ),
        "geolocationRuleset" to mapOf("activeSettingsId" to "settingsId", "bannerRequiredAtLocation" to true),
        "location" to mapOf(
            "countryCode" to "PT", "regionCode" to "PT11", "isInEU" to true, "isInUS" to false, "isInCalifornia" to false
        )
    )
    val expectedControllerId = "8620139AAAAAAAAAAAAAAAdddc2b52973f9807d6b45"
}
