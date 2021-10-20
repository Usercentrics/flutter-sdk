package com.usercentrics.sdk.flutter.api

import android.content.Intent
import com.usercentrics.sdk.UsercentricsActivityContract
import com.usercentrics.sdk.UsercentricsConsentUserResponse
import com.usercentrics.sdk.UsercentricsUISettings

internal interface UsercentricsActivityProxy {
    fun startForResult(settings: UsercentricsUISettings, requestCode: Int)
    fun parseResult(resultCode: Int, data: Intent?): UsercentricsConsentUserResponse?
}

internal class UsercentricsActivityProxyImpl(
    private val activityProvider: FlutterActivityProvider
) : UsercentricsActivityProxy {

    override fun startForResult(settings: UsercentricsUISettings, requestCode: Int) {
        activityProvider.provide()?.let { activity ->
            val intent = UsercentricsActivityContract().createIntent(activity, settings)
            activity.startActivityForResult(intent, requestCode)
        }
    }

    override fun parseResult(resultCode: Int, data: Intent?): UsercentricsConsentUserResponse? {
        return UsercentricsActivityContract().parseResult(resultCode, data)
    }

}