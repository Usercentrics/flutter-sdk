package com.usercentrics.sdk.flutter.serializer

internal interface DataDeserializer<T> {

    fun deserialize(value: Any?): T

    fun deserializeList(list: List<Any>): List<T> = list.map { deserialize(it) }

}