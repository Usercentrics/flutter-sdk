package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult
import com.usercentrics.sdk.flutter.api.UsercentricsProxy
import com.usercentrics.sdk.flutter.api.UsercentricsProxySingleton
import com.usercentrics.sdk.flutter.serializer.deserializePublisherAgeSignal
import com.usercentrics.sdk.flutter.serializer.serialize
import com.usercentrics.sdk.services.ageverification.ExperimentalAgeSignalsApi

internal class SetAgeSignalBridge(
    private val usercentrics: UsercentricsProxy = UsercentricsProxySingleton
) : MethodBridge {

    companion object {
        private const val setAgeSignalErrorCode = "usercentrics_flutter_setAgeSignal_error"
    }

    override val name: String
        get() = "setAgeSignal"

    // The native API is experimental (MSDK-4778): the opt-in ends here, it is not part of the plugin API.
    // Neither the signal nor the decision is logged or kept: they only pass through.
    @OptIn(ExperimentalAgeSignalsApi::class)
    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        val signal = call.arguments.deserializePublisherAgeSignal()
        if (signal == null) {
            result.error(setAgeSignalErrorCode, "Invalid Parameter", null)
            return
        }

        usercentrics.instance.setAgeSignal(
            signal = signal,
            onSuccess = {
                result.success(it.serialize())
            },
            onError = {
                result.error(
                    setAgeSignalErrorCode,
                    it.message,
                    it
                )
            },
        )
    }
}
