package com.usercentrics.sdk.flutter.api

import android.content.Context
import com.usercentrics.sdk.UsercentricsOptions
import com.usercentrics.sdk.UsercentricsReadyStatus
import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.errors.UsercentricsError

internal class FakeUsercentricsProxy(
    private val instanceAnswer: UsercentricsSDK? = null,
) : UsercentricsProxy {

    override val instance: UsercentricsSDK
        get() = instanceAnswer!!

    var initializeCount: Int = 0
        private set
    var initializeOptionsArgument: UsercentricsOptions? = null
        private set

    override fun initialize(context: Context?, options: UsercentricsOptions) {
        initializeCount++
        initializeOptionsArgument = options
    }

    override fun isReady(
        onSuccess: (UsercentricsReadyStatus) -> Unit,
        onFailure: (UsercentricsError) -> Unit
    ) {
        TODO("Not yet implemented")
    }

    override fun reset() {
        TODO("Not yet implemented")
    }
}