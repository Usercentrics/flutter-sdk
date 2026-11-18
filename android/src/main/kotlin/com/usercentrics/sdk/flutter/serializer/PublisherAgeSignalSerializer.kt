package com.usercentrics.sdk.flutter.serializer

import com.usercentrics.sdk.services.ageverification.ExperimentalAgeSignalsApi
import com.usercentrics.sdk.services.ageverification.UsercentricsPublisherAgeSignal

// `null` for a payload that the Dart layer cannot produce (an unknown kind, a missing or mistyped field). Whether the
// ages and the label are acceptable is for the native SDK to decide: nothing is checked here, and nothing here prints
// what was sent.
@OptIn(ExperimentalAgeSignalsApi::class)
internal fun Any?.deserializePublisherAgeSignal(): UsercentricsPublisherAgeSignal? {
    val map = this as? Map<*, *> ?: return null
    val sourceLabel = map["sourceLabel"]
    if (sourceLabel != null && sourceLabel !is String) return null

    return when (map["kind"]) {
        "atLeast" -> UsercentricsPublisherAgeSignal.atLeast(
            map["age"].toSaturatedInt() ?: return null,
            sourceLabel as String?,
        )

        "below" -> UsercentricsPublisherAgeSignal.below(
            map["age"].toSaturatedInt() ?: return null,
            sourceLabel as String?,
        )

        "between" -> UsercentricsPublisherAgeSignal.between(
            map["lower"].toSaturatedInt() ?: return null,
            map["upper"].toSaturatedInt() ?: return null,
            sourceLabel as String?,
        )

        else -> null
    }
}

// A Dart int has 64 bits and reaches Android as an Integer or a Long. A Long outside the Int range is clamped instead of
// truncated, so an age that is far out of range stays out of range (the native SDK refuses it) and does not wrap into
// an age that is valid.
private fun Any?.toSaturatedInt(): Int? = when (this) {
    is Int -> this
    is Long -> coerceIn(Int.MIN_VALUE.toLong(), Int.MAX_VALUE.toLong()).toInt()
    else -> null
}
