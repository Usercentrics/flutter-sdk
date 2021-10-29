package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.AcceptAllMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class AcceptAllBridgeTest {

    @Test
    fun testName() {
        val instance = AcceptAllBridge(FakeUsercentricsProxy())
        assertEquals("acceptAll", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = AcceptAllBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.acceptAll(any()) }.returns(AcceptAllMock.fake)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = AcceptAllBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(AcceptAllMock.call, result)

        verify(exactly = 1) {
            usercentricsSDK.acceptAll(
                consentType = AcceptAllMock.callConsentType
            )
        }

        assertEquals(1, result.successCount)
        assertEquals(AcceptAllMock.expected, result.successResultArgument)
    }
}