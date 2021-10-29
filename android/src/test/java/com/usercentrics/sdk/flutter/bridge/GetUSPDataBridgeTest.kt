package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.GetUSPDataMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class GetUSPDataBridgeTest {

    @Test
    fun testName() {
        val instance = GetUSPDataBridge(FakeUsercentricsProxy())
        assertEquals("getUSPData", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = GetUSPDataBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.getUSPData() }.returns(GetUSPDataMock.fake)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = GetUSPDataBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(GetUSPDataMock.call, result)

        verify(exactly = 1) { usercentricsSDK.getUSPData() }

        assertEquals(1, result.successCount)
        assertEquals(GetUSPDataMock.expected, result.successResultArgument)
    }
}