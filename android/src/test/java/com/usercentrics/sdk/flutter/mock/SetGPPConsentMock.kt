package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall

internal object SetGPPConsentMock {

    val callSectionName = "usnat"
    val callFieldName = "SaleOptOut"
    val callValue = 2

    val call = FakeFlutterMethodCall(
        method = "setGPPConsent",
        arguments = mapOf(
            "sectionName" to callSectionName,
            "fieldName" to callFieldName,
            "value" to callValue,
        )
    )
}
