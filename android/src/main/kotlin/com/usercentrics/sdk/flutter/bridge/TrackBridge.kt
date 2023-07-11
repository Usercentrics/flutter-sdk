package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsAnalyticsEventType
import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult
import com.usercentrics.sdk.flutter.api.UsercentricsProxy
import com.usercentrics.sdk.flutter.api.UsercentricsProxySingleton

internal class TrackBridge(
    private val usercentrics: UsercentricsProxy = UsercentricsProxySingleton
) : MethodBridge {

    override val name: String
        get() = "track"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)

        val argsMap = call.arguments as Map<*, *>
        usercentrics.instance.track(UsercentricsAnalyticsEventType.valueOf(argsMap["event"] as String))

        result.success(null)
    }
}
