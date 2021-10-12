package com.usercentrics.sdk.flutter.bridge

import android.app.Activity
import com.usercentrics.sdk.Usercentrics
import com.usercentrics.sdk.flutter.extension.FlutterResult
import com.usercentrics.sdk.flutter.serializer.ConsentSerializer
import io.flutter.plugin.common.MethodCall

internal class GetConsentsBridge : MethodBridge {

    override val name: String
        get() = "getConsents"

    override fun invoke(call: MethodCall, result: FlutterResult, activity: Activity?) {
        result.success(ConsentSerializer().serializeList(Usercentrics.instance.getConsents()))
    }

}