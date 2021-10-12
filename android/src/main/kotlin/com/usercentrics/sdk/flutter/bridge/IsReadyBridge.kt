package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.Usercentrics
import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult
import com.usercentrics.sdk.flutter.serializer.ReadyStatusSerializer

internal class IsReadyBridge : MethodBridge {

    companion object {
        private const val isReadyErrorCode = "usercentrics_flutter_isReady_error"
    }

    override val name: String
        get() = "isReady"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
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