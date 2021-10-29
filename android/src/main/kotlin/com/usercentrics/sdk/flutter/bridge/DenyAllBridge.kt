package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult
import com.usercentrics.sdk.flutter.api.UsercentricsProxy
import com.usercentrics.sdk.flutter.api.UsercentricsProxySingleton
import com.usercentrics.sdk.flutter.serializer.serialize
import com.usercentrics.sdk.models.settings.UsercentricsConsentType

internal class DenyAllBridge(
    private val usercentrics: UsercentricsProxy = UsercentricsProxySingleton
) : MethodBridge {

    override val name: String
        get() = "denyAll"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        val consents = usercentrics.instance.denyAll(
            consentType = UsercentricsConsentType.valueOf(call.arguments as String)
        )
        result.success(consents.map { it.serialize() })
    }

}