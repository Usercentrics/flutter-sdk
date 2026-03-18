package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall

internal object GetGPPStringMock {

    val fake = "DBABLA~BVQqAAAACgA.QA"

    val call = FakeFlutterMethodCall(method = "getGPPString", arguments = null)
    val expected = "DBABLA~BVQqAAAACgA.QA"
}
