package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall

internal object GetABTestingVariantMock {

    const val fake =
        "variantA"

    // From the debugger
    val call = FakeFlutterMethodCall(method = "getABTestingVariant", arguments = null)
    const val expected =
        "variantA"

}
