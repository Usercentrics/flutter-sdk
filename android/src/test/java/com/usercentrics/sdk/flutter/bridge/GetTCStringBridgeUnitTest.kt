package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.GetTCStringMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class GetTCStringBridgeUnitTest {

    @Test
    fun testName() {
        val instance = GetTCStringBridge(FakeUsercentricsProxy())
        assertEquals("getTCString", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = GetTCStringBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.getTCString() }.returns(GetTCStringMock.fake)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = GetTCStringBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(GetTCStringMock.call, result)

        verify(exactly = 1) { usercentricsSDK.getTCString() }

        assertEquals(1, result.successCount)
        assertEquals(GetTCStringMock.expected, result.successResultArgument)
    }

}