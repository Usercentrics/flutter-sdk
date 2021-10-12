package com.usercentrics.sdk.flutter.bridge

import android.app.Activity
import android.content.Intent
import com.usercentrics.sdk.UsercentricsActivityContract
import com.usercentrics.sdk.flutter.extension.FlutterResult
import com.usercentrics.sdk.flutter.serializer.UISettingsSerializer
import com.usercentrics.sdk.flutter.serializer.UserResponseSerializer
import io.flutter.plugin.common.MethodCall

internal class ShowCMPBridge : MethodBridge, ResultAwareMethod {

    companion object {
        private const val showCMPRequestCode = 81420
    }

    private var pendingResult: FlutterResult? = null

    override val name: String
        get() = "showCMP"

    override fun invoke(call: MethodCall, result: FlutterResult, activity: Activity?) {
        val settings = UISettingsSerializer().deserialize(call.arguments)
        val intent = UsercentricsActivityContract().createIntent(activity!!, settings)
        this.pendingResult = result
        activity.startActivityForResult(intent, showCMPRequestCode)
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