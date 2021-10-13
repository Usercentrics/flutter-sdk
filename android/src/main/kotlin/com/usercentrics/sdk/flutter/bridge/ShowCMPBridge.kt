package com.usercentrics.sdk.flutter.bridge

import android.content.Intent
import com.usercentrics.sdk.flutter.api.*
import com.usercentrics.sdk.flutter.serializer.UISettingsSerializer
import com.usercentrics.sdk.flutter.serializer.UserResponseSerializer

internal class ShowCMPBridge(
    assetsProvider: FlutterAssetsProvider,
    private val activityProvider: FlutterActivityProvider,
    private val activityProxy: UsercentricsActivityProxy = UsercentricsActivityProxyImpl(
        activityProvider
    ),
) : MethodBridge, ResultAwareMethod {

    companion object {
        private const val showCMPRequestCode = 81420
    }

    private val settingsSerializer = UISettingsSerializer(assetsProvider, activityProvider)

    private var pendingResult: FlutterResult? = null

    override val name: String
        get() = "showCMP"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        this.pendingResult = result
        val settings = settingsSerializer.deserialize(call.arguments)
        activityProxy.startForResult(settings, showCMPRequestCode)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode != showCMPRequestCode) return false

        assert(pendingResult != null)
        val response = activityProxy.parseResult(resultCode, data)?.let {
            UserResponseSerializer().serialize(it)
        }
        pendingResult?.success(response)
        pendingResult = null

        return true
    }
}