package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.FlutterMethodCall
import com.usercentrics.sdk.flutter.api.FlutterResult
import com.usercentrics.sdk.flutter.api.UsercentricsProxy
import com.usercentrics.sdk.flutter.api.UsercentricsProxySingleton

internal class ChangeLanguageBridge(
    private val usercentrics: UsercentricsProxy = UsercentricsProxySingleton
) : MethodBridge {

    companion object {
        private const val changeLanguageErrorCode = "usercentrics_flutter_changeLanguage_error"
    }

    override val name: String
        get() = "changeLanguage"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)
        usercentrics.instance.changeLanguage(
            language = call.arguments as String,
            onSuccess = {
                result.success(null)
            },
            onFailure = {
                result.error(changeLanguageErrorCode, it.message, it)
            }
        )
    }
}