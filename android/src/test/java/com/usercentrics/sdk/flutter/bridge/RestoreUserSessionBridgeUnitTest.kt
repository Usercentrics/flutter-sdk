package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsReadyStatus
import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.errors.UsercentricsError
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.RestoreUserSessionMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class RestoreUserSessionBridgeUnitTest {


    @Test
    fun testName() {
        val instance = RestoreUserSessionBridge(FakeUsercentricsProxy())
        assertEquals("restoreUserSession", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = RestoreUserSessionBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvokeWithSuccess() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.restoreUserSession(any(), any(), any()) }
            .answers() {
                (arg(1) as (UsercentricsReadyStatus) -> Unit)(RestoreUserSessionMock.fake)
            }
        val usercentricsProxy = FakeUsercentricsProxy(instanceAnswer = usercentricsSDK)
        val instance = RestoreUserSessionBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(RestoreUserSessionMock.call, result)

        verify(exactly = 1) { usercentricsSDK.restoreUserSession(RestoreUserSessionMock.expectedControllerId, any(), any()) }

        assertEquals(1, result.successCount)
        assertEquals(RestoreUserSessionMock.expected, result.successResultArgument)
    }

    @Test
    fun testInvokeWithError() {
        val error = mockk<UsercentricsError>(relaxed = true)
        val errorMessage = "The error message"
        every { error.message }.returns(errorMessage)

        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.restoreUserSession(any(), any(), any()) }
            .answers() {
                (arg(2) as (UsercentricsError) -> Unit)(error)
            }

        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = RestoreUserSessionBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(RestoreUserSessionMock.call, result)

        verify(exactly = 1) { usercentricsSDK.restoreUserSession(RestoreUserSessionMock.expectedControllerId, any(), any()) }

        assertEquals(1, result.errorCount)
        assertEquals("usercentrics_flutter_restoreUserSession_error", result.errorCodeArgument)
        assertEquals(errorMessage, result.errorMessageArgument)
        assertEquals(error, result.errorDetailsArgument)
    }

}