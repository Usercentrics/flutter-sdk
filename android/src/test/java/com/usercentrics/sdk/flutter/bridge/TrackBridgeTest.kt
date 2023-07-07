package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsAnalyticsEventType
import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import io.mockk.every
import io.mockk.mockk
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class TrackBridgeTest {

    @Test
    fun testName() {
        val instance = TrackBridge(FakeUsercentricsProxy())
        assertEquals("track", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = TrackBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        var trackCount = 0
        var eventCalled: UsercentricsAnalyticsEventType? = null

        val usercentricsSdk = mockk<UsercentricsSDK>()
        every { usercentricsSdk.track(any()) } answers {
            eventCalled = this.arg(0)
            trackCount++
        }

        val usercentricsProxy = FakeUsercentricsProxy(instanceAnswer = usercentricsSdk)
        val instance = TrackBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        val call = FakeFlutterMethodCall(method = "track", arguments = mapOf("event" to "ACCEPT_ALL_FIRST_LAYER"))
        instance.invoke(call, result)

        assertEquals(1, trackCount)
        assertEquals(UsercentricsAnalyticsEventType.ACCEPT_ALL_FIRST_LAYER, eventCalled)
        assertEquals(1, result.successCount)
        assertEquals(null, result.successResultArgument)
    }
}
