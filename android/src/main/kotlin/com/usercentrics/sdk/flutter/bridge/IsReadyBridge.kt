package com.usercentrics.sdk.flutter.bridge

import android.app.Activity
import com.usercentrics.sdk.Usercentrics
import com.usercentrics.sdk.flutter.extension.FlutterResult
import com.usercentrics.sdk.flutter.serializer.ReadyStatusSerializer
import io.flutter.plugin.common.MethodCall

internal class IsReadyBridge : MethodBridge {

    companion object {
        private const val isReadyErrorCode = "usercentrics_flutter_isReady_error"
    }

    override val name: String
        get() = "isReady"

    override fun invoke(call: MethodCall, result: FlutterResult, activity: Activity?) {
        Usercentrics.isReady(
            onSuccess = {
                result.success(ReadyStatusSerializer().serialize(it))
            },
            onFailure = {
                result.error(
                    isReadyErrorCode,
                    it.message,
                    it
                )
            }
        )
    }

}