package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.GetControllerIdMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class GetControllerIdBridgeUnitTest {

    @Test
    fun testName() {
        val instance = GetControllerIdBridge(FakeUsercentricsProxy())
        assertEquals("getControllerId", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = GetControllerIdBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.getControllerId() }.returns(GetControllerIdMock.fake)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = GetControllerIdBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(GetControllerIdMock.call, result)

        verify(exactly = 1) { usercentricsSDK.getControllerId() }

        assertEquals(1, result.successCount)
        assertEquals(GetControllerIdMock.expected, result.successResultArgument)
    }

}