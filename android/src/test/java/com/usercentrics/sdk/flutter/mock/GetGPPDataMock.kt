package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.services.gpp.GppData

internal object GetGPPDataMock {

    val fake = GppData(
        gppString = "DBABLA~BVQqAAAACgA.QA",
        applicableSections = listOf(7, 8),
        sections = mapOf(
            "usnat" to mapOf(
                "Version" to 1,
                "SaleOptOut" to 2,
                "GpcSegmentIncluded" to true,
            ),
        ),
    )

    val call = FakeFlutterMethodCall(method = "getGPPData", arguments = null)
    val expected = mapOf(
        "gppString" to "DBABLA~BVQqAAAACgA.QA",
        "applicableSections" to listOf(7, 8),
        "sections" to mapOf(
            "usnat" to mapOf(
                "Version" to 1,
                "SaleOptOut" to 2,
                "GpcSegmentIncluded" to true,
            ),
        ),
    )
}
