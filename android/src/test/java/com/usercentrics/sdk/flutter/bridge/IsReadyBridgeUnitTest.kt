package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.errors.UsercentricsError
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.IsReadyMock
import io.mockk.every
import io.mockk.mockk
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class IsReadyBridgeUnitTest {

    @Test
    fun testName() {
        val instance = IsReadyBridge(FakeUsercentricsProxy())
        assertEquals("isReady", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = IsReadyBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvokeWithSuccessWithData() {
        val usercentricsProxy = FakeUsercentricsProxy(isReadyAnswer = IsReadyMock.fakeWithData)
        val instance = IsReadyBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(IsReadyMock.call, result)

        assertEquals(1, usercentricsProxy.isReadyCount)
        assertEquals(1, result.successCount)
        assertEquals(IsReadyMock.expectedWithData, result.successResultArgument)
    }

    @Test
    fun testInvokeWithSuccessWithoutData() {
        val usercentricsProxy = FakeUsercentricsProxy(isReadyAnswer = IsReadyMock.fakeWithoutData)
        val instance = IsReadyBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(IsReadyMock.call, result)

        assertEquals(1, usercentricsProxy.isReadyCount)
        assertEquals(1, result.successCount)
        assertEquals(IsReadyMock.expectedWithoutData, result.successResultArgument)
    }

    @Test
    fun testInvokeWithError() {
        val error = mockk<UsercentricsError>(relaxed = true)
        val errorMessage = "The error message"
        every { error.message }.returns(errorMessage)

        val usercentricsProxy = FakeUsercentricsProxy(isReadyAnswer = error)
        val instance = IsReadyBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(IsReadyMock.call, result)

        assertEquals(1, usercentricsProxy.isReadyCount)
        assertEquals(1, result.errorCount)
        assertEquals("usercentrics_flutter_isReady_error", result.errorCodeArgument)
        assertEquals(errorMessage, result.errorMessageArgument)
        assertEquals(error, result.errorDetailsArgument)
    }

}