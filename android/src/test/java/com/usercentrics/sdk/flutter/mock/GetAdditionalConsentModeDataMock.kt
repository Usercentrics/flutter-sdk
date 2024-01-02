package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.AdTechProvider
import com.usercentrics.sdk.AdditionalConsentModeData
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall

internal object GetAdditionalConsentModeDataMock {

    val fake = AdditionalConsentModeData(
        acString = "2~1.2.3~dv.4.5",
        adTechProviders = listOf(
            AdTechProvider(
                id = 1,
                name = "atp1",
                privacyPolicyUrl = "www.atp1.com",
                consent = true
            ),
            AdTechProvider(
                id = 2,
                name = "atp2",
                privacyPolicyUrl = "www.atp2.com",
                consent = true
            ),
            AdTechProvider(
                id = 3,
                name = "atp3",
                privacyPolicyUrl = "www.atp3.com",
                consent = true
            ),
            AdTechProvider(
                id = 4,
                name = "atp4",
                privacyPolicyUrl = "www.atp4.com",
                consent = false
            ),
            AdTechProvider(
                id = 5,
                name = "atp5",
                privacyPolicyUrl = "www.atp5.com",
                consent = false
            )
        )
    )

    // From the debugger
    val call = FakeFlutterMethodCall(method = "getAdditionalConsentModeData", arguments = null)

    val expected = mapOf(
        "acString" to "2~1.2.3~dv.4.5",
        "adTechProviders" to listOf(
            mapOf(
                "id" to 1,
                "name" to "atp1",
                "privacyPolicyUrl" to "www.atp1.com",
                "consent" to true
            ),
            mapOf(
                "id" to 2,
                "name" to "atp2",
                "privacyPolicyUrl" to "www.atp2.com",
                "consent" to true
            ),
            mapOf(
                "id" to 3,
                "name" to "atp3",
                "privacyPolicyUrl" to "www.atp3.com",
                "consent" to true
            ),
            mapOf(
                "id" to 4,
                "name" to "atp4",
                "privacyPolicyUrl" to "www.atp4.com",
                "consent" to false
            ),
            mapOf(
                "id" to 5,
                "name" to "atp5",
                "privacyPolicyUrl" to "www.atp5.com",
                "consent" to false
            )
        )
    )

}
