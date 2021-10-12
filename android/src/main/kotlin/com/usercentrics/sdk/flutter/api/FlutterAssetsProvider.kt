package com.usercentrics.sdk.flutter.api

internal interface FlutterAssetsProvider {
    fun getAssetFilePathByName(assetFileName: String): String?
}