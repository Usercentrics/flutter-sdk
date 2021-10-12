package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.UsercentricsReadyStatus

internal class ReadyStatusSerializer : DataSerializer<UsercentricsReadyStatus> {

    override fun serialize(value: UsercentricsReadyStatus): Any {
        return mapOf(
            "shouldShowCMP" to value.shouldShowCMP,
            "consents" to ConsentSerializer().serializeList(value.consents)
        )
    }

}