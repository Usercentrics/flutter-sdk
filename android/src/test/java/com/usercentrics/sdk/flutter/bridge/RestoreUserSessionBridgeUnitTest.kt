package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsReadyStatus
import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.UsercentricsServiceConsent
import com.usercentrics.sdk.errors.UsercentricsError
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.models.settings.UsercentricsConsentType
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class RestoreUserSessionBridgeUnitTest {

    companion object {
        private val mockStatus = UsercentricsReadyStatus(
            shouldShowCMP = false,
            consents = listOf(
                UsercentricsServiceConsent(
                    templateId = "ocv9HNX_g",
                    status = false,
                    dataProcessor = "Facebook SDK",
                    type = UsercentricsConsentType.EXPLICIT,
                    version = "1.0.1"
                )
            )
        )
        private val mockControllerId = "8620135313b043696b806868b20da905886a3a2598ddddc2b52973f9807d6b45"

        // Data from a real call of the debugger
        private val mockCall =
            FakeFlutterMethodCall(method = "restoreUserSession", arguments = mockControllerId)
        private val expectedResultPayload = mapOf(
            "shouldShowCMP" to false,
            "consents" to listOf(
                mapOf(
                    "templateId" to "ocv9HNX_g",
                    "status" to false,
                    "type" to "EXPLICIT",
                    "version" to "1.0.1",
                    "dataProcessor" to "Facebook SDK",
                )
            )
        )
    }

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
                (arg(1) as (UsercentricsReadyStatus) -> Unit)(mockStatus)
            }
        val usercentricsProxy = FakeUsercentricsProxy(instanceAnswer = usercentricsSDK)
        val instance = RestoreUserSessionBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(mockCall, result)

        verify(exactly = 1) { usercentricsSDK.restoreUserSession(mockControllerId, any(), any()) }

        assertEquals(1, result.successCount)
        assertEquals(expectedResultPayload, result.successResultArgument)
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

        instance.invoke(mockCall, result)

        verify(exactly = 1) { usercentricsSDK.restoreUserSession(mockControllerId, any(), any()) }

        assertEquals(1, result.errorCount)
        assertEquals("usercentrics_flutter_restoreUserSession_error", result.errorCodeArgument)
        assertEquals(errorMessage, result.errorMessageArgument)
        assertEquals(error, result.errorDetailsArgument)
    }

}