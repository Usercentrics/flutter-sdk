package com.usercentrics.sdk.flutter.bridge

import android.content.Intent
import com.usercentrics.sdk.flutter.api.*
import com.usercentrics.sdk.flutter.serializer.deserializeUISettings
import com.usercentrics.sdk.flutter.serializer.serialize

internal class ShowCMPBridge(
    private val assetsProvider: FlutterAssetsProvider,
    private val activityProvider: FlutterActivityProvider,
    private val activityProxy: UsercentricsActivityProxy = UsercentricsActivityProxyImpl(
        activityProvider
    ),
) : MethodBridge, ResultAwareMethod {

    companion object {
        private const val showCMPRequestCode = 81420
    }

    private var pendingResult: FlutterResult? = null

    override val name: String
        get() = "showCMP"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        this.pendingResult = result
        val settings = call.arguments.deserializeUISettings(assetsProvider, activityProvider)
        activityProxy.startForResult(settings, showCMPRequestCode)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode != showCMPRequestCode) return false

        assert(pendingResult != null)
        val response = activityProxy.parseResult(resultCode, data)?.serialize()
        pendingResult?.success(response)
        pendingResult = null

        return true
    }
}