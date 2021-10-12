package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.UsercentricsConsentUserResponse

internal class UserResponseSerializer : DataSerializer<UsercentricsConsentUserResponse> {

    override fun serialize(value: UsercentricsConsentUserResponse): Any {
        return mapOf(
            "controllerId" to value.controllerId,
            "userInteraction" to value.userInteraction.name,
            "consents" to ConsentSerializer().serializeList(value.consents)
        )
    }

}