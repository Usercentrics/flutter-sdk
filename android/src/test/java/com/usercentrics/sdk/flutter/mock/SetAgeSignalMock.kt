package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.services.ageverification.ExperimentalAgeSignalsApi
import com.usercentrics.sdk.services.ageverification.UsercentricsAgeBand
import com.usercentrics.sdk.services.ageverification.UsercentricsAgeSignalDecision
import com.usercentrics.sdk.services.ageverification.UsercentricsAgeSignalSource
import com.usercentrics.sdk.services.ageverification.UsercentricsAgeSignalTrust
import com.usercentrics.sdk.services.ageverification.UsercentricsAgeSignalUnavailableReason

@OptIn(ExperimentalAgeSignalsApi::class)
internal object SetAgeSignalMock {

    fun call(arguments: Any?) = FakeFlutterMethodCall(method = "setAgeSignal", arguments = arguments)

    // What the Dart layer sends: every key is always there, the ones a kind does not use are null
    val callAtLeast = call(
        mapOf(
            "kind" to "atLeast",
            "age" to 16,
            "lower" to null,
            "upper" to null,
            "sourceLabel" to "my-age-gate",
        )
    )

    val callBelow = call(
        mapOf(
            "kind" to "below",
            "age" to 16,
            "lower" to null,
            "upper" to null,
            "sourceLabel" to null,
        )
    )

    val callBetween = call(
        mapOf(
            "kind" to "between",
            "age" to null,
            "lower" to 13,
            "upper" to 15,
            "sourceLabel" to "my-age-gate",
        )
    )

    fun callAtLeastWithAge(age: Any?, sourceLabel: Any? = null) = call(
        mapOf(
            "kind" to "atLeast",
            "age" to age,
            "lower" to null,
            "upper" to null,
            "sourceLabel" to sourceLabel,
        )
    )

    val availableDecision = UsercentricsAgeSignalDecision(
        source = UsercentricsAgeSignalSource.PUBLISHER_PROVIDED,
        trust = UsercentricsAgeSignalTrust.PUBLISHER_PROVIDED,
        band = UsercentricsAgeBand.MINOR,
        ageLower = 16,
        ageUpper = null,
        unavailableReason = null,
    )

    val expectedAvailable = mapOf(
        "source" to "PUBLISHER_PROVIDED",
        "trust" to "PUBLISHER_PROVIDED",
        "band" to "MINOR",
        "ageLower" to 16,
        "ageUpper" to null,
        "unavailableReason" to null,
    )

    val unavailableDecision = UsercentricsAgeSignalDecision(
        source = UsercentricsAgeSignalSource.GOOGLE_PLAY_AGE_SIGNALS,
        trust = null,
        band = null,
        ageLower = null,
        ageUpper = null,
        unavailableReason = UsercentricsAgeSignalUnavailableReason.NOT_SHARED,
    )

    val expectedUnavailable = mapOf(
        "source" to "GOOGLE_PLAY_AGE_SIGNALS",
        "trust" to null,
        "band" to null,
        "ageLower" to null,
        "ageUpper" to null,
        "unavailableReason" to "NOT_SHARED",
    )

    fun decision(
        source: UsercentricsAgeSignalSource = UsercentricsAgeSignalSource.PUBLISHER_PROVIDED,
        trust: UsercentricsAgeSignalTrust? = null,
        band: UsercentricsAgeBand? = null,
        unavailableReason: UsercentricsAgeSignalUnavailableReason? = null,
    ) = UsercentricsAgeSignalDecision(
        source = source,
        trust = trust,
        band = band,
        ageLower = null,
        ageUpper = null,
        unavailableReason = unavailableReason,
    )
}
