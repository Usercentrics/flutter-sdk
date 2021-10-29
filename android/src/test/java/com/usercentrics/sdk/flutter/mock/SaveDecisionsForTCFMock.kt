package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.UserDecision
import com.usercentrics.sdk.UsercentricsServiceConsent
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.models.settings.UsercentricsConsentType
import com.usercentrics.sdk.services.tcf.TCFDecisionUILayer
import com.usercentrics.sdk.services.tcf.interfaces.TCFUserDecisionOnPurpose
import com.usercentrics.sdk.services.tcf.interfaces.TCFUserDecisionOnSpecialFeature
import com.usercentrics.sdk.services.tcf.interfaces.TCFUserDecisionOnVendor
import com.usercentrics.sdk.services.tcf.interfaces.TCFUserDecisions

internal class SaveDecisionsForTCFMock {
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
            method = "saveDecisionsForTCF", arguments = mapOf(
                "tcfDecisions" to mapOf(
                    "purposes" to listOf(
                        mapOf(
                            "id" to 1,
                            "consent" to true,
                            "legitimateInterestConsent" to null
                        )
                    ),
                    "specialFeatures" to listOf(
                        mapOf(
                            "id" to 5,
                            "consent" to false,
                        )
                    ),
                    "vendors" to listOf(
                        mapOf(
                            "id" to 6,
                            "consent" to true,
                            "legitimateInterestConsent" to null
                        )
                    ),
                ),
                "fromLayer" to "FIRST_LAYER",
                "serviceDecisions" to listOf(
                    mapOf(
                        "consent" to true,
                        "serviceId" to "ocv9HNX_g"
                    )
                ),
                "consentType" to "EXPLICIT"
            )
        )
        val callTCFDecisions = TCFUserDecisions(
            purposes = listOf(
                TCFUserDecisionOnPurpose(
                    id = 1,
                    consent = true,
                    legitimateInterestConsent = null
                )
            ),
            specialFeatures = listOf(
                TCFUserDecisionOnSpecialFeature(
                    id = 5,
                    consent = false,
                )
            ),
            vendors = listOf(
                TCFUserDecisionOnVendor(
                    id = 6,
                    consent = true,
                    legitimateInterestConsent = null
                )
            ),
        )
        val callFromLayer = TCFDecisionUILayer.FIRST_LAYER
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