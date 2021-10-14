package com.usercentrics.sdk.flutter.api

import android.app.Activity

internal class FakeFlutterActivityProvider : FlutterActivityProvider {

    var provideCount: Int = 0
        private set

    override fun provide(): Activity? {
        provideCount++
        return null
    }

}