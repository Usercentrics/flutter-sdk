package com.usercentrics.sdk.flutter.api

import android.content.Intent
import com.usercentrics.sdk.UsercentricsConsentUserResponse
import com.usercentrics.sdk.UsercentricsUISettings

internal class FakeUsercentricsActivityProxy(
    private val parseResultAnswer: UsercentricsConsentUserResponse? = null
) : UsercentricsActivityProxy {

    var startForResultCount: Int = 0
        private set
    var startForResultSettingsArgument: UsercentricsUISettings? = null
        private set
    var startForResultRequestCode: Int? = null
        private set

    override fun startForResult(settings: UsercentricsUISettings, requestCode: Int) {
        startForResultCount++
        startForResultSettingsArgument = settings
        startForResultRequestCode = requestCode
    }

    var parseResultCount: Int = 0
        private set
    var parseResultResultCodeArgument: Int? = null
        private set

    override fun parseResult(resultCode: Int, data: Intent?): UsercentricsConsentUserResponse? {
        parseResultCount++
        parseResultResultCodeArgument = resultCode
        return parseResultAnswer
    }
}