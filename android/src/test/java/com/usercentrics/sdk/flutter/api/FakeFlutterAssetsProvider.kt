package com.usercentrics.sdk.flutter.api

internal class FakeFlutterAssetsProvider : FlutterAssetsProvider {
    override fun getAssetFilePathByName(assetFileName: String): String? {
        return null
    }
}