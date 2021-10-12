package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.Usercentrics
import com.usercentrics.sdk.flutter.api.FlutterActivityProvider
import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult
import com.usercentrics.sdk.flutter.serializer.InitializeOptionsSerializer

internal class InitializeBridge(
    private val activityProvider: FlutterActivityProvider
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
            Usercentrics.isReady({
                isReadyInvoked = true
            }, {
                isReadyInvoked = true
            })
            isReadyInvoked
        }.getOrElse { false }

        if (!alreadyInitialized) {
            val options = InitializeOptionsSerializer().deserialize(call.arguments)
            activityProvider.provide()?.applicationContext?.let {
                Usercentrics.initialize(it, options)
            }
        }

        result.success(null)
    }

}