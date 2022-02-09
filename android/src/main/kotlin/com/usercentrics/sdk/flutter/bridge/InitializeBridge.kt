package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.*
import com.usercentrics.sdk.flutter.serializer.deserializeOptions

internal class InitializeBridge(
    private val activityProvider: FlutterActivityProvider,
    private val usercentrics: UsercentricsProxy = UsercentricsProxySingleton
) : MethodBridge {

    override val name: String
        get() = "initialize"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)

        val options = call.arguments.deserializeOptions()
        usercentrics.initialize(activityProvider.provide()?.applicationContext, options)

        result.success(null)
    }

}