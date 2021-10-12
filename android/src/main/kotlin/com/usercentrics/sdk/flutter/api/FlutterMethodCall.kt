package com.usercentrics.sdk.flutter.api

import io.flutter.plugin.common.MethodCall

internal interface FlutterMethodCall {
    val method: String
    val arguments: Any?
}

internal class FlutterMethodCallWrapper(private val methodCall: MethodCall) : FlutterMethodCall {

    override val method: String
        get() = methodCall.method

    override val arguments: Any?
        get() = methodCall.arguments

}