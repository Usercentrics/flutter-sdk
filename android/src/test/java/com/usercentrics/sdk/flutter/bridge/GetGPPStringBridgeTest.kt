package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.GetGPPStringMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class GetGPPStringBridgeTest {

    @Test
    fun testName() {
        val instance = GetGPPStringBridge(FakeUsercentricsProxy())
        assertEquals("getGPPString", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = GetGPPStringBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.getGPPString() }.returns(GetGPPStringMock.fake)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = GetGPPStringBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(GetGPPStringMock.call, result)

        verify(exactly = 1) { usercentricsSDK.getGPPString() }

        assertEquals(1, result.successCount)
        assertEquals(GetGPPStringMock.expected, result.successResultArgument)
    }
}
