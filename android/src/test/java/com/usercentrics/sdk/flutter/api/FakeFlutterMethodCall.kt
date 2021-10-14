package com.usercentrics.sdk.flutter.api

internal class FakeFlutterMethodCall(
    override val method: String,
    override val arguments: Any?
) : FlutterMethodCall