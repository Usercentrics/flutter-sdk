package com.usercentrics.sdk.flutter.serializer

internal interface DataSerializer<T> {

    fun serialize(value: T): Any

    fun serializeList(list: List<T>): List<Any> = list.map { serialize(it) }

}