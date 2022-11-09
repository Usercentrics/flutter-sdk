package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall

internal object SetABTestingVariantMock {

    // From the debugger
    val call = FakeFlutterMethodCall(
        method = "setABTestingVariant",
        arguments = "variantA"
    )
    const val callABTestingVariant = "variantA"
    val expected: Any? = null

}
