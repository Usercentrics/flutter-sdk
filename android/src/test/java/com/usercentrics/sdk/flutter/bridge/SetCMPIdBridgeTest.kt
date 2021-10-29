package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.SetCMPIdMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class SetCMPIdBridgeTest {
    @Test
    fun testName() {
        val instance = SetCMPIdBridge(FakeUsercentricsProxy())
        assertEquals("setCMPId", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = SetCMPIdBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.setCMPId(any()) }.answers { }
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = SetCMPIdBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(SetCMPIdMock.call, result)

        verify(exactly = 1) {
            usercentricsSDK.setCMPId(
                id = SetCMPIdMock.callCmpId
            )
        }

        assertEquals(1, result.successCount)
        assertEquals(SetCMPIdMock.expected, result.successResultArgument)
    }
}