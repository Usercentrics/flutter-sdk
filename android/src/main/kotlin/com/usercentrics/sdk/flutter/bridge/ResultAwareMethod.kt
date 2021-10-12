package com.usercentrics.sdk.flutter.bridge

import android.content.Intent

internal interface ResultAwareMethod {
    fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean
}