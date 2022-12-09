package com.usercentrics.sdk.flutter

import android.app.Activity
import androidx.annotation.NonNull
import com.usercentrics.sdk.flutter.api.FlutterActivityProvider
import com.usercentrics.sdk.flutter.api.FlutterAssetsProvider
import com.usercentrics.sdk.flutter.api.FlutterMethodCallWrapper
import com.usercentrics.sdk.flutter.api.UsercentricsBannerProxyImpl
import com.usercentrics.sdk.flutter.bridge.*
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterAssets
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** UsercentricsPlugin */
class UsercentricsPlugin : FlutterPlugin,
    MethodCallHandler,
    ActivityAware,
    FlutterActivityProvider,
    FlutterAssetsProvider {

    private lateinit var channel: MethodChannel
    private var activityBinding: ActivityPluginBinding? = null
    private var flutterAssets: FlutterAssets? = null

    private val methods: Map<String, MethodBridge> by lazy {
        listOf(
            InitializeBridge(
                activityProvider = this
            ),
            ResetBridge(),
            IsReadyBridge(),
            ShowFirstLayerBridge(
                assetsProvider = this,
                activityProvider = this,
                bannerProxy = UsercentricsBannerProxyImpl(this),
            ),
            ShowSecondLayerBridge(
                assetsProvider = this,
                activityProvider = this,
                bannerProxy = UsercentricsBannerProxyImpl(this),
            ),
            GetConsentsBridge(),
            GetControllerIdBridge(),
            RestoreUserSessionBridge(),
            GetCMPDataBridge(),
            AcceptAllBridge(),
            AcceptAllForTCFBridge(),
            ChangeLanguageBridge(),
            DenyAllBridge(),
            DenyAllForTCFBridge(),
            GetTCFDataBridge(),
            GetUserSessionDataBridge(),
            GetUSPDataBridge(),
            SaveDecisionsBridge(),
            SaveDecisionsForTCFBridge(),
            SaveOptOutForCCPABridge(),
            SetCMPIdBridge(),
            GetABTestingVariantBridge(),
            SetABTestingVariantBridge()
        ).associateBy { it.name }
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        runCatching {
            val method = methods[call.method]
            if (method != null) {
                method.invoke(FlutterMethodCallWrapper(call), result)
            } else {
                result.notImplemented()
            }
        }.onFailure {
            result.error(
                "usercentrics_flutter_error",
                "An error has occurred: ${it.message}",
                it
            )
        }
    }

    override fun provide(): Activity? = activityBinding?.activity

    override fun getAssetFilePathByName(assetFileName: String): String? =
        flutterAssets?.getAssetFilePathByName(assetFileName)

    //region Plugin lifecycle
    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        flutterAssets = binding.flutterAssets
        channel = MethodChannel(binding.binaryMessenger, "usercentrics")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        flutterAssets = null
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(activityBinding: ActivityPluginBinding) {
        this.activityBinding = activityBinding
    }

    override fun onDetachedFromActivity() {
        this.activityBinding = null
    }

    override fun onDetachedFromActivityForConfigChanges() = onDetachedFromActivity()

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) =
        onAttachedToActivity(binding)
    //endregion
}


