package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.ResetMock
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class ResetBridgeUnitTest {



    @Test
    fun testName() {
        val instance = ResetBridge(FakeUsercentricsProxy())
        assertEquals("reset", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = ResetBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsProxy = FakeUsercentricsProxy()
        val instance = ResetBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(ResetMock.call, result)

        assertEquals(1, usercentricsProxy.resetCount)
        assertEquals(1, result.successCount)
        assertEquals(ResetMock.expected, result.successResultArgument)
    }

}