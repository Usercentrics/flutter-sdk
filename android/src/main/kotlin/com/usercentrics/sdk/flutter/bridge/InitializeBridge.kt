package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.*
import com.usercentrics.sdk.flutter.serializer.InitializeOptionsSerializer

internal class InitializeBridge(
    private val activityProvider: FlutterActivityProvider,
    private val usercentrics: UsercentricsProxy = UsercentricsProxySingleton
) : MethodBridge {

    override val name: String
        get() = "initialize"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        // Avoid the Already Initialized Runtime Exception
        // because it messes with the Hot Reload Flutter System
        // (Dart VM restart and the JVM don't)
        // TODO: replace this workaround with a catch of the AlreadyInitializedException
        val alreadyInitialized = runCatching {
            var isReadyInvoked = false
            usercentrics.isReady({
                isReadyInvoked = true
            }, {
                isReadyInvoked = true
            })
            isReadyInvoked
        }.getOrElse { false }

        if (!alreadyInitialized) {
            val options = InitializeOptionsSerializer().deserialize(call.arguments)
            usercentrics.initialize(activityProvider.provide()?.applicationContext, options)
        }

        result.success(null)
    }

}