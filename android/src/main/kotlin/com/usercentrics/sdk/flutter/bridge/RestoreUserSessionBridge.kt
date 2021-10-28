package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult
import com.usercentrics.sdk.flutter.api.UsercentricsProxy
import com.usercentrics.sdk.flutter.api.UsercentricsProxySingleton
import com.usercentrics.sdk.flutter.serializer.serialize

internal class RestoreUserSessionBridge(
    private val usercentrics: UsercentricsProxy = UsercentricsProxySingleton
) : MethodBridge {

    companion object {
        private const val restoreUserSessionErrorCode =
            "usercentrics_flutter_restoreUserSession_error"
    }

    override val name: String
        get() = "restoreUserSession"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        usercentrics.instance.restoreUserSession(
            controllerId = call.arguments as String,
            onSuccess = {
                result.success(it.serialize())
            },
            onFailure = {
                result.error(
                    restoreUserSessionErrorCode,
                    it.message,
                    it
                )
            }
        )
    }

}