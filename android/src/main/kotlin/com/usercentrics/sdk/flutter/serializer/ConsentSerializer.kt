package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.UsercentricsServiceConsent

internal class ConsentSerializer : DataSerializer<UsercentricsServiceConsent> {

    override fun serialize(value: UsercentricsServiceConsent): Any {
        return mapOf(
            "templateId" to value.templateId,
            "status" to value.status,
            "type" to value.type?.name,
            "version" to value.version,
            "dataProcessor" to value.dataProcessor
        )
    }

}