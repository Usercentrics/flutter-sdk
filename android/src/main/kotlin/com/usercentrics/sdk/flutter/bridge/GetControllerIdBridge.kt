package com.usercentrics.sdk.flutter.bridge

import android.app.Activity
import com.usercentrics.sdk.Usercentrics
import com.usercentrics.sdk.flutter.extension.FlutterResult
import io.flutter.plugin.common.MethodCall

internal class GetControllerIdBridge : MethodBridge {

    override val name: String
        get() = "getControllerId"

    override fun invoke(call: MethodCall, result: FlutterResult, activity: Activity?) {
        result.success(Usercentrics.instance.getControllerId())
    }

}