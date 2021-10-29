package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.GetUserSessionDataMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class GetUserSessionDataBridgeTest {

    @Test
    fun testName() {
        val instance = GetUserSessionDataBridge(FakeUsercentricsProxy())
        assertEquals("getUserSessionData", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = GetUserSessionDataBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.getUserSessionData() }.returns(GetUserSessionDataMock.fake)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = GetUserSessionDataBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(GetUserSessionDataMock.call, result)

        verify(exactly = 1) { usercentricsSDK.getUserSessionData() }

        assertEquals(1, result.successCount)
        assertEquals(GetUserSessionDataMock.expected, result.successResultArgument)
    }
}