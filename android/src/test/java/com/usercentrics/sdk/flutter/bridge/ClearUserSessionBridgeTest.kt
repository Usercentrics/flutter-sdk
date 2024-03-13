package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsReadyStatus
import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.errors.UsercentricsError
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.ClearUserSessionMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class ClearUserSessionBridgeTest {

    @Test
    fun testName() {
        val instance = ClearUserSessionBridge(FakeUsercentricsProxy())
        assertEquals("clearUserSession", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = ClearUserSessionBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvokeWithSuccess() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.clearUserSession(any(), any()) }
            .answers() {
                (arg(0) as (UsercentricsReadyStatus) -> Unit)(ClearUserSessionMock.fake)
            }
        val usercentricsProxy = FakeUsercentricsProxy(instanceAnswer = usercentricsSDK)
        val instance = ClearUserSessionBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(ClearUserSessionMock.call, result)

        verify(exactly = 1) { usercentricsSDK.clearUserSession(any(), any()) }

        assertEquals(1, result.successCount)
        assertEquals(ClearUserSessionMock.expected, result.successResultArgument)
    }

    @Test
    fun testInvokeWithError() {
        val error = mockk<UsercentricsError>(relaxed = true)
        val errorMessage = "The error message"
        every { error.message }.returns(errorMessage)

        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.clearUserSession(any(), any()) }
            .answers() {
                (arg(1) as (UsercentricsError) -> Unit)(error)
            }

        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = ClearUserSessionBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(ClearUserSessionMock.call, result)

        verify(exactly = 1) { usercentricsSDK.clearUserSession(any(), any()) }

        assertEquals(1, result.errorCount)
        assertEquals("usercentrics_flutter_clearUserSession_error", result.errorCodeArgument)
        assertEquals(errorMessage, result.errorMessageArgument)
        assertEquals(error, result.errorDetailsArgument)
    }
}