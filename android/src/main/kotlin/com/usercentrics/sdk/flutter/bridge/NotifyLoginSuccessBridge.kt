package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult
import com.usercentrics.sdk.flutter.api.UsercentricsProxy
import com.usercentrics.sdk.flutter.api.UsercentricsProxySingleton

internal class NotifyLoginSuccessBridge(
    private val usercentrics: UsercentricsProxy = UsercentricsProxySingleton
) : MethodBridge {

    companion object {
        private const val notifyLoginSuccessErrorCode =
            "usercentrics_flutter_notifyLoginSuccess_error"
    }

    override val name: String
        get() = "notifyLoginSuccess"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        usercentrics.instance.notifyLoginSuccess(
            onSuccess = {
                result.success(null)
            },
            onError = {
                result.error(
                    notifyLoginSuccessErrorCode,
                    it.message,
                    it
                )
            },
        )
    }
}
