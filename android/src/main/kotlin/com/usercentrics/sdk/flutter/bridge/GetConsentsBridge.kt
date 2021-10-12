package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.Usercentrics
import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult
import com.usercentrics.sdk.flutter.serializer.ConsentSerializer

internal class GetConsentsBridge : MethodBridge {

    override val name: String
        get() = "getConsents"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        result.success(ConsentSerializer().serializeList(Usercentrics.instance.getConsents()))
    }

}