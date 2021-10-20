package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult

internal interface MethodBridge {
    val name: String
    fun invoke(call: FlutterMethodCall, result: FlutterResult)
}