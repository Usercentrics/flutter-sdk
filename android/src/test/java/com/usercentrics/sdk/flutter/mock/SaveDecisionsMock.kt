package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.UserDecision
import com.usercentrics.sdk.UsercentricsServiceConsent
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.models.settings.UsercentricsConsentType

internal class SaveDecisionsMock {
    companion object {
        val fake = listOf(
            UsercentricsServiceConsent(
                templateId = "ocv9HNX_g",
                status = true,
                dataProcessor = "Facebook SDK",
                type = UsercentricsConsentType.EXPLICIT,
                version = "1.0.1"
            )
        )

        // From the debugger
        val call = FakeFlutterMethodCall(
            method = "saveDecisions", arguments = mapOf(
                "decisions" to listOf(
                    mapOf(
                        "consent" to true,
                        "serviceId" to "ocv9HNX_g"
                    )
                ),
                "consentType" to "EXPLICIT"
            )
        )
        val callDecisions = listOf(
            UserDecision(
                consent = true,
                serviceId = "ocv9HNX_g"
            )
        )
        val callConsentType = UsercentricsConsentType.EXPLICIT
        val expected = listOf(
            mapOf(
                "templateId" to "ocv9HNX_g",
                "status" to true,
                "type" to "EXPLICIT",
                "version" to "1.0.1",
                "dataProcessor" to "Facebook SDK",
            )
        )
    }
}