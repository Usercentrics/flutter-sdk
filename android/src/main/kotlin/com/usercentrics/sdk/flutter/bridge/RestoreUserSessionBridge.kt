package com.usercentrics.sdk.flutter.bridge

import android.app.Activity
import com.usercentrics.sdk.Usercentrics
import com.usercentrics.sdk.flutter.extension.FlutterResult
import com.usercentrics.sdk.flutter.serializer.ReadyStatusSerializer
import io.flutter.plugin.common.MethodCall

internal class RestoreUserSessionBridge : MethodBridge {

    companion object {
        private const val restoreUserSessionErrorCode =
            "usercentrics_flutter_restoreUserSession_error"
    }

    override val name: String
        get() = "restoreUserSession"

    override fun invoke(call: MethodCall, result: FlutterResult, activity: Activity?) {
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