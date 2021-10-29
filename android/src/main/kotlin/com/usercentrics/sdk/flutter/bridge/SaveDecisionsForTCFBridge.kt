package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult
import com.usercentrics.sdk.flutter.api.UsercentricsProxy
import com.usercentrics.sdk.flutter.api.UsercentricsProxySingleton
import com.usercentrics.sdk.flutter.serializer.deserializeTCFUserDecisions
import com.usercentrics.sdk.flutter.serializer.deserializeUserDecision
import com.usercentrics.sdk.flutter.serializer.serialize
import com.usercentrics.sdk.models.settings.UsercentricsConsentType
import com.usercentrics.sdk.services.tcf.TCFDecisionUILayer

internal class SaveDecisionsForTCFBridge(
    private val usercentrics: UsercentricsProxy = UsercentricsProxySingleton
) : MethodBridge {

    override val name: String
        get() = "saveDecisionsForTCF"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        val argsMap = call.arguments as Map<*, *>
        val consents = usercentrics.instance.saveDecisionsForTCF(
            tcfDecisions = argsMap["tcfDecisions"].deserializeTCFUserDecisions(),
            fromLayer = TCFDecisionUILayer.valueOf(argsMap["fromLayer"] as String),
            serviceDecisions = (argsMap["serviceDecisions"] as List<*>).map { it.deserializeUserDecision() },
            consentType = UsercentricsConsentType.valueOf(argsMap["consentType"] as String)
        )
        result.success(consents.map { it.serialize() })
    }

}