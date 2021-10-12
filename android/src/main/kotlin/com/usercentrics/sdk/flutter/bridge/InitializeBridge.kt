package com.usercentrics.sdk.flutter.bridge

import android.app.Activity
import com.usercentrics.sdk.Usercentrics
import com.usercentrics.sdk.flutter.UsercentricsPlugin
import com.usercentrics.sdk.flutter.extension.FlutterResult
import com.usercentrics.sdk.flutter.serializer.InitializeOptionsSerializer
import io.flutter.plugin.common.MethodCall

internal class InitializeBridge : MethodBridge {

    override val name: String
        get() = "initialize"

    override fun invoke(call: MethodCall, result: FlutterResult, activity: Activity?) {
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
            Usercentrics.initialize(UsercentricsPlugin.applicationContext!!, options)
        }

        result.success(null)
    }

}