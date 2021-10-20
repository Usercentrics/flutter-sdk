package com.usercentrics.sdk.flutter

import android.app.Activity
import android.content.Intent
import androidx.annotation.NonNull
import com.usercentrics.sdk.flutter.api.FlutterActivityProvider
import com.usercentrics.sdk.flutter.api.FlutterAssetsProvider
import com.usercentrics.sdk.flutter.api.FlutterMethodCallWrapper
import com.usercentrics.sdk.flutter.api.ResultAwareMethod
import com.usercentrics.sdk.flutter.bridge.*
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterAssets
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry

/** UsercentricsPlugin */
class UsercentricsPlugin : FlutterPlugin,
    MethodCallHandler,
    ActivityAware,
    PluginRegistry.ActivityResultListener,
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
            ShowCMPBridge(
                assetsProvider = this,
                activityProvider = this
            ),
            GetConsentsBridge(),
            GetControllerIdBridge(),
            GetTCStringBridge(),
            RestoreUserSessionBridge(),
        ).map { it.name to it }.toMap()
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
                "A fatal error has occurred: ${it.message}",
                it
            )
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        methods.values.mapNotNull { it as? ResultAwareMethod }.forEach {
            if (it.onActivityResult(requestCode, resultCode, data)) {
                return@onActivityResult true
            }
        }
        return false
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
        this.activityBinding = activityBinding.apply {
            addActivityResultListener(this@UsercentricsPlugin)
        }
    }

    override fun onDetachedFromActivity() {
        this.activityBinding?.removeActivityResultListener(this@UsercentricsPlugin)
        this.activityBinding = null
    }

    override fun onDetachedFromActivityForConfigChanges() = onDetachedFromActivity()

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) =
        onAttachedToActivity(binding)
    //endregion
}


