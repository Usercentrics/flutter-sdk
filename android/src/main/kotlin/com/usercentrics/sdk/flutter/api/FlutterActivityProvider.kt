package com.usercentrics.sdk.flutter.api

import android.app.Activity

internal interface FlutterActivityProvider {
    fun provide(): Activity?
}