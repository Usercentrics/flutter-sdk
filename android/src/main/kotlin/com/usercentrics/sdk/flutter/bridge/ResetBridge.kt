package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.Usercentrics
import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult

internal class ResetBridge : MethodBridge {

    override val name: String
        get() = "reset"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        Usercentrics.reset()
        result.success(null)
    }

}