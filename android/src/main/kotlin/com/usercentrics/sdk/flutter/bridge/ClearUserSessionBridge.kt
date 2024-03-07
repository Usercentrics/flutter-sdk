package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult
import com.usercentrics.sdk.flutter.api.UsercentricsProxy
import com.usercentrics.sdk.flutter.api.UsercentricsProxySingleton
import com.usercentrics.sdk.flutter.serializer.serialize

internal class ClearUserSessionBridge(
    private val usercentrics: UsercentricsProxy = UsercentricsProxySingleton
) : MethodBridge {

    companion object {
        private const val clearUserSessionErrorCode =
            "usercentrics_flutter_clearUserSession_error"
    }

    override val name: String
        get() = "clearUserSession"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        usercentrics.instance.clearUserSession(
            onSuccess = {
                result.success(it.serialize())
            },
            onError = {
                result.error(
                    clearUserSessionErrorCode,
                    it.message,
                    it
                )
            },
        )
    }
}