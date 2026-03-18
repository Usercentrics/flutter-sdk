package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.GetGPPDataMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class GetGPPDataBridgeTest {

    @Test
    fun testName() {
        val instance = GetGPPDataBridge(FakeUsercentricsProxy())
        assertEquals("getGPPData", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = GetGPPDataBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.getGPPData() }.returns(GetGPPDataMock.fake)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = GetGPPDataBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(GetGPPDataMock.call, result)

        verify(exactly = 1) { usercentricsSDK.getGPPData() }

        assertEquals(1, result.successCount)
        assertEquals(GetGPPDataMock.expected, result.successResultArgument)
    }
}
