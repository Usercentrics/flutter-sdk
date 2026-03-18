package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult
import com.usercentrics.sdk.flutter.api.UsercentricsProxy
import com.usercentrics.sdk.flutter.api.UsercentricsProxySingleton

internal class SetGPPConsentBridge(
    private val usercentrics: UsercentricsProxy = UsercentricsProxySingleton
) : MethodBridge {

    override val name: String
        get() = "setGPPConsent"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        val argsMap = call.arguments as Map<*, *>
        val sectionName = argsMap["sectionName"] as String
        val fieldName = argsMap["fieldName"] as String
        val value = normalizeValue(argsMap["value"])
        usercentrics.instance.setGPPConsent(sectionName, fieldName, value)
        result.success(null)
    }

    private fun normalizeValue(value: Any?): Any {
        if (value == null) return Unit
        if (value is Double && value % 1.0 == 0.0) return value.toInt()
        return value
    }
}
