package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.Usercentrics
import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult
import com.usercentrics.sdk.flutter.serializer.ReadyStatusSerializer

internal class RestoreUserSessionBridge : MethodBridge {

    companion object {
        private const val restoreUserSessionErrorCode =
            "usercentrics_flutter_restoreUserSession_error"
    }

    override val name: String
        get() = "restoreUserSession"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        Usercentrics.instance.restoreUserSession(
            controllerId = call.arguments as String,
            onSuccess = {
                result.success(ReadyStatusSerializer().serialize(it))
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