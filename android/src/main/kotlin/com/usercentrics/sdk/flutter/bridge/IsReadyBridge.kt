package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult
import com.usercentrics.sdk.flutter.api.UsercentricsProxy
import com.usercentrics.sdk.flutter.api.UsercentricsProxySingleton
import com.usercentrics.sdk.flutter.serializer.ReadyStatusSerializer

internal class IsReadyBridge(
    private val usercentrics: UsercentricsProxy = UsercentricsProxySingleton
) : MethodBridge {

    companion object {
        private const val isReadyErrorCode = "usercentrics_flutter_isReady_error"
    }

    override val name: String
        get() = "isReady"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        usercentrics.isReady(
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