package com.usercentrics.sdk.flutter.api

import android.content.Context
import com.usercentrics.sdk.UsercentricsOptions
import com.usercentrics.sdk.UsercentricsReadyStatus
import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.errors.UsercentricsError

internal class FakeUsercentricsProxy(
    private val instanceAnswer: UsercentricsSDK? = null,
    private val isReadyAnswer: Any? = null
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

    var isReadyCount: Int = 0
        private set

    override fun isReady(
        onSuccess: (UsercentricsReadyStatus) -> Unit,
        onFailure: (UsercentricsError) -> Unit
    ) {
        isReadyCount++
        if (isReadyAnswer is UsercentricsReadyStatus) {
            onSuccess(isReadyAnswer)
        } else if (isReadyAnswer is UsercentricsError) {
            onFailure(isReadyAnswer)
        }
    }

    var resetCount: Int = 0
        private set

    override fun reset() {
        resetCount++
    }
}