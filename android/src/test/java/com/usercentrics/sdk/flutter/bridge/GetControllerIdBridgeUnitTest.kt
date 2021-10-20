package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class GetControllerIdBridgeUnitTest {

    companion object {
        private const val mockGetControllerId = "8620135313b043696b806868b20da905886a3a2598ddddc2b52973f9807d6b45"

        // Data from a real call of the debugger
        private val mockCall = FakeFlutterMethodCall(method = "getControllerId", arguments = null)
        private const val expectedResultPayload = "8620135313b043696b806868b20da905886a3a2598ddddc2b52973f9807d6b45"
    }

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
        every { usercentricsSDK.getControllerId() }.returns(mockGetControllerId)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = GetControllerIdBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(mockCall, result)

        verify(exactly = 1) { usercentricsSDK.getControllerId() }

        assertEquals(1, result.successCount)
        assertEquals(expectedResultPayload, result.successResultArgument)
    }

}