package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult
import com.usercentrics.sdk.flutter.api.UsercentricsProxy
import com.usercentrics.sdk.flutter.api.UsercentricsProxySingleton
import com.usercentrics.sdk.flutter.serializer.serialize
import com.usercentrics.sdk.models.settings.UsercentricsConsentType
import com.usercentrics.sdk.services.tcf.TCFDecisionUILayer

internal class DenyAllForTCFBridge(
    private val usercentrics: UsercentricsProxy = UsercentricsProxySingleton
) : MethodBridge {

    override val name: String
        get() = "denyAllForTCF"

    @Suppress("UNCHECKED_CAST")
    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        val argsMap = call.arguments as Map<*, *>
        val unsavedPurposeLIDecisions = (argsMap["unsavedPurposeLIDecisions"] as? Map<Int, Boolean>)
        val consents = usercentrics.instance.denyAllForTCF(
            fromLayer = TCFDecisionUILayer.valueOf(argsMap["fromLayer"] as String),
            consentType = UsercentricsConsentType.valueOf(argsMap["consentType"] as String),
            unsavedPurposeLIDecisions = unsavedPurposeLIDecisions
        )
        result.success(consents.map { it.serialize() })
    }

}