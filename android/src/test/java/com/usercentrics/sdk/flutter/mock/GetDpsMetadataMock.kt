package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall

internal object GetDpsMetadataMock {

    const val templateId = "templateId123"

    val fake: Map<String, Any> = mapOf(
        "key" to "value",
        "count" to 42
    )

    val call = FakeFlutterMethodCall(method = "getDpsMetadata", arguments = templateId)
    val expected: Map<String, Any> = mapOf(
        "key" to "value",
        "count" to 42
    )
}
