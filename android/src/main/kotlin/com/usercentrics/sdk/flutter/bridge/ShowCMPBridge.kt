package com.usercentrics.sdk.flutter.bridge

import android.content.Intent
import com.usercentrics.sdk.UsercentricsActivityContract
import com.usercentrics.sdk.flutter.api.*
import com.usercentrics.sdk.flutter.serializer.UISettingsSerializer
import com.usercentrics.sdk.flutter.serializer.UserResponseSerializer

internal class ShowCMPBridge(
    assetsProvider: FlutterAssetsProvider,
    private val activityProvider: FlutterActivityProvider
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
        val settings = settingsSerializer.deserialize(call.arguments)
        activityProvider.provide()?.let { activity ->
            val intent = UsercentricsActivityContract().createIntent(activity, settings)
            this.pendingResult = result
            activity.startActivityForResult(intent, showCMPRequestCode)
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        val pendingResult = this.pendingResult
        return if (pendingResult != null && requestCode == showCMPRequestCode) {
            this.pendingResult = null
            val response = UsercentricsActivityContract().parseResult(resultCode, data)?.let {
                UserResponseSerializer().serialize(it)
            }
            pendingResult.success(response)
            true
        } else {
            false
        }
    }
}