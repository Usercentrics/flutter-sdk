package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult
import com.usercentrics.sdk.flutter.api.UsercentricsProxy
import com.usercentrics.sdk.flutter.api.UsercentricsProxySingleton

internal class NotifySubscribeSuccessBridge(
    private val usercentrics: UsercentricsProxy = UsercentricsProxySingleton
) : MethodBridge {

    companion object {
        private const val notifySubscribeSuccessErrorCode =
            "usercentrics_flutter_notifySubscribeSuccess_error"
    }

    override val name: String
        get() = "notifySubscribeSuccess"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        usercentrics.instance.notifySubscribeSuccess(
            onSuccess = {
                result.success(null)
            },
            onError = {
                result.error(
                    notifySubscribeSuccessErrorCode,
                    it.message,
                    it
                )
            },
        )
    }
}
