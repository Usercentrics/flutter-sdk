package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.errors.UsercentricsError
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.SetAgeSignalMock
import com.usercentrics.sdk.flutter.serializer.serialize
import com.usercentrics.sdk.services.ageverification.ExperimentalAgeSignalsApi
import com.usercentrics.sdk.services.ageverification.UsercentricsAgeBand
import com.usercentrics.sdk.services.ageverification.UsercentricsAgeSignalDecision
import com.usercentrics.sdk.services.ageverification.UsercentricsAgeSignalSource
import com.usercentrics.sdk.services.ageverification.UsercentricsAgeSignalTrust
import com.usercentrics.sdk.services.ageverification.UsercentricsAgeSignalUnavailableReason
import com.usercentrics.sdk.services.ageverification.UsercentricsPublisherAgeSignal
import io.mockk.every
import io.mockk.mockk
import io.mockk.mockkObject
import io.mockk.unmockkObject
import io.mockk.verify
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Before
import org.junit.Test

@OptIn(ExperimentalAgeSignalsApi::class)
class SetAgeSignalBridgeTest {

    // A signal shows neither its ages nor its label, so what the bridge asked the native factories for is checked on the
    // factories: each test stubs the one call it expects to see, and the signals are told apart by identity.
    private val atLeastSignal = mockk<UsercentricsPublisherAgeSignal>()
    private val belowSignal = mockk<UsercentricsPublisherAgeSignal>()
    private val betweenSignal = mockk<UsercentricsPublisherAgeSignal>()
    private val otherSignal = mockk<UsercentricsPublisherAgeSignal>()

    @Before
    fun setUp() {
        mockkObject(UsercentricsPublisherAgeSignal.Companion)
    }

    @After
    fun tearDown() {
        unmockkObject(UsercentricsPublisherAgeSignal.Companion)
    }

    @Test
    fun testName() {
        val instance = SetAgeSignalBridge(FakeUsercentricsProxy())
        assertEquals("setAgeSignal", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = SetAgeSignalBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvokeWithAtLeast() {
        every { UsercentricsPublisherAgeSignal.atLeast(16, "my-age-gate") } returns atLeastSignal
        val usercentricsSDK = sdkAnswering(SetAgeSignalMock.availableDecision)
        val instance = SetAgeSignalBridge(FakeUsercentricsProxy(instanceAnswer = usercentricsSDK))
        val result = FakeFlutterResult()

        instance.invoke(SetAgeSignalMock.callAtLeast, result)

        verify(exactly = 1) { usercentricsSDK.setAgeSignal(any(), any(), any()) }
        verify(exactly = 1) { usercentricsSDK.setAgeSignal(atLeastSignal, any(), any()) }
        verify(exactly = 0) { UsercentricsPublisherAgeSignal.below(any(), any()) }
        verify(exactly = 0) { UsercentricsPublisherAgeSignal.between(any(), any(), any()) }

        assertEquals(1, result.successCount)
        assertEquals(SetAgeSignalMock.expectedAvailable, result.successResultArgument)
        assertEquals(0, result.errorCount)
    }

    @Test
    fun testInvokeWithBelowAndNoSourceLabel() {
        every { UsercentricsPublisherAgeSignal.below(16, null) } returns belowSignal
        val usercentricsSDK = sdkAnswering(SetAgeSignalMock.availableDecision)
        val instance = SetAgeSignalBridge(FakeUsercentricsProxy(instanceAnswer = usercentricsSDK))
        val result = FakeFlutterResult()

        instance.invoke(SetAgeSignalMock.callBelow, result)

        verify(exactly = 1) { usercentricsSDK.setAgeSignal(any(), any(), any()) }
        verify(exactly = 1) { usercentricsSDK.setAgeSignal(belowSignal, any(), any()) }
        verify(exactly = 0) { UsercentricsPublisherAgeSignal.atLeast(any(), any()) }
        verify(exactly = 0) { UsercentricsPublisherAgeSignal.between(any(), any(), any()) }

        assertEquals(1, result.successCount)
        assertEquals(SetAgeSignalMock.expectedAvailable, result.successResultArgument)
    }

    @Test
    fun testInvokeWithBetween() {
        every { UsercentricsPublisherAgeSignal.between(13, 15, "my-age-gate") } returns betweenSignal
        val usercentricsSDK = sdkAnswering(SetAgeSignalMock.availableDecision)
        val instance = SetAgeSignalBridge(FakeUsercentricsProxy(instanceAnswer = usercentricsSDK))
        val result = FakeFlutterResult()

        instance.invoke(SetAgeSignalMock.callBetween, result)

        verify(exactly = 1) { usercentricsSDK.setAgeSignal(any(), any(), any()) }
        verify(exactly = 1) { usercentricsSDK.setAgeSignal(betweenSignal, any(), any()) }
        verify(exactly = 0) { UsercentricsPublisherAgeSignal.atLeast(any(), any()) }
        verify(exactly = 0) { UsercentricsPublisherAgeSignal.below(any(), any()) }

        assertEquals(1, result.successCount)
        assertEquals(SetAgeSignalMock.expectedAvailable, result.successResultArgument)
    }

    @Test
    fun testInvokeWithoutSignalAvailable() {
        every { UsercentricsPublisherAgeSignal.atLeast(16, "my-age-gate") } returns atLeastSignal
        val usercentricsSDK = sdkAnswering(SetAgeSignalMock.unavailableDecision)
        val instance = SetAgeSignalBridge(FakeUsercentricsProxy(instanceAnswer = usercentricsSDK))
        val result = FakeFlutterResult()

        instance.invoke(SetAgeSignalMock.callAtLeast, result)

        // Nulls stay null (the keys are there), and no signal is a success, not an error
        assertEquals(1, result.successCount)
        assertEquals(SetAgeSignalMock.expectedUnavailable, result.successResultArgument)
        assertEquals(0, result.errorCount)
    }

    @Test
    fun testInvokeWithError() {
        every { UsercentricsPublisherAgeSignal.atLeast(16, "my-age-gate") } returns atLeastSignal
        val errorMessage = "Invalid age signal: an age is not between 0 and 120"
        val error = UsercentricsError.create(errorMessage)
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.setAgeSignal(any(), any(), any()) }
            .answers {
                (arg(2) as (UsercentricsError) -> Unit)(error)
            }
        val instance = SetAgeSignalBridge(FakeUsercentricsProxy(instanceAnswer = usercentricsSDK))
        val result = FakeFlutterResult()

        instance.invoke(SetAgeSignalMock.callAtLeast, result)

        verify(exactly = 1) { usercentricsSDK.setAgeSignal(atLeastSignal, any(), any()) }

        assertEquals(1, result.errorCount)
        assertEquals("usercentrics_flutter_setAgeSignal_error", result.errorCodeArgument)
        assertEquals(errorMessage, result.errorMessageArgument)
        assertEquals(error, result.errorDetailsArgument)
        assertEquals(0, result.successCount)
    }

    @Test
    fun testInvokeWithAPayloadTheDartLayerCannotProduce() {
        val payloads = listOf(
            null,
            "atLeast",
            emptyMap<String, Any?>(),
            mapOf("kind" to "unknown", "age" to 16),
            mapOf("kind" to null, "age" to 16),
            mapOf("kind" to "atLeast"),
            mapOf("kind" to "atLeast", "age" to "16"),
            mapOf("kind" to "atLeast", "age" to 16.5),
            mapOf("kind" to "below", "age" to null),
            mapOf("kind" to "between", "lower" to 13),
            mapOf("kind" to "between", "upper" to 15),
            mapOf("kind" to "atLeast", "age" to 16, "sourceLabel" to 1),
        )

        payloads.forEach { payload ->
            val usercentricsSDK = mockk<UsercentricsSDK>()
            val instance = SetAgeSignalBridge(FakeUsercentricsProxy(instanceAnswer = usercentricsSDK))
            val result = FakeFlutterResult()

            instance.invoke(SetAgeSignalMock.call(payload), result)

            // A fixed message, and the native SDK is never reached
            assertEquals(1, result.errorCount)
            assertEquals("usercentrics_flutter_setAgeSignal_error", result.errorCodeArgument)
            assertEquals("Invalid Parameter", result.errorMessageArgument)
            assertNull(result.errorDetailsArgument)
            assertEquals(0, result.successCount)
            verify(exactly = 0) { usercentricsSDK.setAgeSignal(any(), any(), any()) }
        }
        verify(exactly = 0) { UsercentricsPublisherAgeSignal.atLeast(any(), any()) }
        verify(exactly = 0) { UsercentricsPublisherAgeSignal.below(any(), any()) }
        verify(exactly = 0) { UsercentricsPublisherAgeSignal.between(any(), any(), any()) }
    }

    @Test
    fun testInvokeWithAgeBeyondTheIntRangeDoesNotWrapIntoAValidAge() {
        // 2^32 + 16 would become 16 if it were truncated to an Int: it has to reach the native SDK as an age that is far
        // out of range, for the native SDK to refuse it
        every { UsercentricsPublisherAgeSignal.atLeast(Int.MAX_VALUE, null) } returns atLeastSignal
        every { UsercentricsPublisherAgeSignal.atLeast(Int.MIN_VALUE, null) } returns otherSignal
        val usercentricsSDK = sdkAnswering(SetAgeSignalMock.unavailableDecision)
        val instance = SetAgeSignalBridge(FakeUsercentricsProxy(instanceAnswer = usercentricsSDK))

        instance.invoke(SetAgeSignalMock.callAtLeastWithAge(4294967312L), FakeFlutterResult())
        instance.invoke(SetAgeSignalMock.callAtLeastWithAge(-4294967312L), FakeFlutterResult())

        verify(exactly = 1) { usercentricsSDK.setAgeSignal(atLeastSignal, any(), any()) }
        verify(exactly = 1) { usercentricsSDK.setAgeSignal(otherSignal, any(), any()) }
        verify(exactly = 0) { UsercentricsPublisherAgeSignal.atLeast(16, any()) }
    }

    @Test
    fun testInvokeWithAgeAsALongInsideTheIntRange() {
        every { UsercentricsPublisherAgeSignal.atLeast(16, null) } returns atLeastSignal
        val usercentricsSDK = sdkAnswering(SetAgeSignalMock.availableDecision)
        val instance = SetAgeSignalBridge(FakeUsercentricsProxy(instanceAnswer = usercentricsSDK))

        instance.invoke(SetAgeSignalMock.callAtLeastWithAge(16L), FakeFlutterResult())

        verify(exactly = 1) { usercentricsSDK.setAgeSignal(atLeastSignal, any(), any()) }
    }

    @Test
    fun testTheDecisionEnumsTravelByTheirNativeName() {
        // Written out on purpose: the Dart and the iOS layers read these exact names, and a new or renamed native value
        // has to show up here
        assertEquals(
            listOf("APPLE_DECLARED_AGE_RANGE", "GOOGLE_PLAY_AGE_SIGNALS", "PUBLISHER_PROVIDED"),
            UsercentricsAgeSignalSource.values().map {
                (SetAgeSignalMock.decision(source = it).serialize() as Map<*, *>)["source"]
            }
        )
        assertEquals(
            listOf("SELF_DECLARED", "GUARDIAN_DECLARED", "VERIFIED", "PUBLISHER_PROVIDED"),
            UsercentricsAgeSignalTrust.values().map {
                (SetAgeSignalMock.decision(trust = it).serialize() as Map<*, *>)["trust"]
            }
        )
        assertEquals(
            listOf("BELOW_MINIMUM", "MINOR", "STANDARD"),
            UsercentricsAgeBand.values().map {
                (SetAgeSignalMock.decision(band = it).serialize() as Map<*, *>)["band"]
            }
        )
        assertEquals(
            listOf(
                "DECLINED",
                "NOT_SHARED",
                "VERIFICATION_REQUIRED",
                "UNSUPPORTED",
                "NOT_AVAILABLE",
                "INVALID_REQUEST",
                "TRANSIENT_ERROR",
                "TIMEOUT",
                "ERROR",
            ),
            UsercentricsAgeSignalUnavailableReason.values().map {
                (SetAgeSignalMock.decision(unavailableReason = it).serialize() as Map<*, *>)["unavailableReason"]
            }
        )
    }

    private fun sdkAnswering(decision: UsercentricsAgeSignalDecision): UsercentricsSDK {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.setAgeSignal(any(), any(), any()) }
            .answers {
                (arg(1) as (UsercentricsAgeSignalDecision) -> Unit)(decision)
            }
        return usercentricsSDK
    }
}
