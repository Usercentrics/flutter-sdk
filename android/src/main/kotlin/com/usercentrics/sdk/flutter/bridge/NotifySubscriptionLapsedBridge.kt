package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult
import com.usercentrics.sdk.flutter.api.UsercentricsProxy
import com.usercentrics.sdk.flutter.api.UsercentricsProxySingleton

internal class NotifySubscriptionLapsedBridge(
    private val usercentrics: UsercentricsProxy = UsercentricsProxySingleton
) : MethodBridge {

    companion object {
        private const val notifySubscriptionLapsedErrorCode =
            "usercentrics_flutter_notifySubscriptionLapsed_error"
    }

    override val name: String
        get() = "notifySubscriptionLapsed"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        usercentrics.instance.notifySubscriptionLapsed(
            onSuccess = {
                result.success(null)
            },
            onError = {
                result.error(
                    notifySubscriptionLapsedErrorCode,
                    it.message,
                    it
                )
            },
        )
    }
}
