package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.*
import com.usercentrics.sdk.flutter.serializer.deserializeBannerSettings
import com.usercentrics.sdk.flutter.serializer.deserializeLayout
import com.usercentrics.sdk.flutter.serializer.serialize

internal class ShowFirstLayerBridge(
    private val assetsProvider: FlutterAssetsProvider,
    private val activityProvider: FlutterActivityProvider,
    private val banner: UsercentricsBannerProxy = UsercentricsBannerProxySingleton,
) : MethodBridge {

    override val name: String
        get() = "showFirstLayer"

    override fun invoke(call: FlutterMethodCall, result: FlutterResult) {
        assert(name == call.method)

        val argsMap = call.arguments as Map<*, *>

        banner.showFirstLayer(
            context = activityProvider.provide(),
            bannerSettings = argsMap["bannerSettings"].deserializeBannerSettings(
                assetsProvider,
                activityProvider
            ),
            layout = argsMap["layout"].deserializeLayout(),
            settings = null,
            // TODO
//            settings = argsMap["settings"].deserializeFirstLayerStyleSettings(),
        ) { response ->
            result.success(response?.serialize())
        }
    }
}