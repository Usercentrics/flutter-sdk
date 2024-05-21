package com.usercentrics.sdk.flutter.api

import android.content.Context
import com.usercentrics.sdk.Usercentrics
import com.usercentrics.sdk.UsercentricsOptions
import com.usercentrics.sdk.UsercentricsReadyStatus
import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.errors.UsercentricsError

internal interface UsercentricsProxy {
    val instance: UsercentricsSDK

    fun initialize(context: Context?, options: UsercentricsOptions)

    fun isReady(
        onSuccess: (UsercentricsReadyStatus) -> Unit,
        onFailure: (UsercentricsError) -> Unit
    )
}

internal object UsercentricsProxySingleton : UsercentricsProxy {

    override val instance: UsercentricsSDK
        get() = Usercentrics.instance

    override fun initialize(context: Context?, options: UsercentricsOptions) {
        context ?: return

        Usercentrics.initialize(context, options)
    }

    override fun isReady(
        onSuccess: (UsercentricsReadyStatus) -> Unit,
        onFailure: (UsercentricsError) -> Unit
    ) = Usercentrics.isReady(onSuccess, onFailure)
}