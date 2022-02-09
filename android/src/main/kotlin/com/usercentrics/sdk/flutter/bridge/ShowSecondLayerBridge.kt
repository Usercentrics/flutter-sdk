package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.*
import com.usercentrics.sdk.flutter.serializer.deserializeBannerSettings
import com.usercentrics.sdk.flutter.serializer.serialize

internal class ShowSecondLayerBridge(
    private val assetsProvider: FlutterAssetsProvider,
    private val activityProvider: FlutterActivityProvider,
    private val banner: UsercentricsBannerProxy = UsercentricsBannerProxySingleton,
) : MethodBridge {

    override val name: String
        get() = "showSecondLayer"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)

        val argsMap = call.arguments as Map<*, *>

        banner.showSecondLayer(
            context = activityProvider.provide(),
            bannerSettings = argsMap["bannerSettings"].deserializeBannerSettings(
                assetsProvider,
                activityProvider
            ),
            showCloseButton = argsMap["showCloseButton"] as Boolean,
        ) { response ->
            result.success(response?.serialize())
        }
    }
}