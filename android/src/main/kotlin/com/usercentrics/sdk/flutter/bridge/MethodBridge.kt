package com.usercentrics.sdk.flutter.bridge

import android.app.Activity
import com.usercentrics.sdk.flutter.extension.FlutterResult
import io.flutter.plugin.common.MethodCall

internal interface MethodBridge {
    val name: String
    fun invoke(call: MethodCall, result: FlutterResult, activity: Activity?)
}