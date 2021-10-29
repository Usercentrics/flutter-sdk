package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult
import com.usercentrics.sdk.flutter.api.UsercentricsProxy
import com.usercentrics.sdk.flutter.api.UsercentricsProxySingleton
import com.usercentrics.sdk.flutter.serializer.serialize
import com.usercentrics.sdk.models.settings.UsercentricsConsentType

internal class SaveOptOutForCCPABridge(
    private val usercentrics: UsercentricsProxy = UsercentricsProxySingleton
) : MethodBridge {

    override val name: String
        get() = "saveOptOutForCCPA"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        val argsMap = call.arguments as Map<*, *>
        val consents = usercentrics.instance.saveOptOutForCCPA(
            isOptedOut = argsMap["isOptedOut"] as Boolean,
            consentType = UsercentricsConsentType.valueOf(argsMap["consentType"] as String)
        )
        result.success(consents.map { it.serialize() })
    }

}