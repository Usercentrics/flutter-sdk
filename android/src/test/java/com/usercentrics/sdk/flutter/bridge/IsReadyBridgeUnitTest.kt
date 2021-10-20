package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsReadyStatus
import com.usercentrics.sdk.UsercentricsServiceConsent
import com.usercentrics.sdk.errors.UsercentricsError
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.models.settings.UsercentricsConsentType
import io.mockk.every
import io.mockk.mockk
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class IsReadyBridgeUnitTest {

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

        // Data from a real call of the debugger
        private val mockCall = FakeFlutterMethodCall(method = "isReady", arguments = null)
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
    fun testInvokeWithSuccess() {
        val usercentricsProxy = FakeUsercentricsProxy(isReadyAnswer = mockStatus)
        val instance = IsReadyBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(mockCall, result)

        assertEquals(1, usercentricsProxy.isReadyCount)
        assertEquals(1, result.successCount)
        assertEquals(expectedResultPayload, result.successResultArgument)
    }

    @Test
    fun testInvokeWithError() {
        val error = mockk<UsercentricsError>(relaxed = true)
        val errorMessage = "The error message"
        every { error.message }.returns(errorMessage)

        val usercentricsProxy = FakeUsercentricsProxy(isReadyAnswer = error)
        val instance = IsReadyBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(mockCall, result)

        assertEquals(1, usercentricsProxy.isReadyCount)
        assertEquals(1, result.errorCount)
        assertEquals("usercentrics_flutter_isReady_error", result.errorCodeArgument)
        assertEquals(errorMessage, result.errorMessageArgument)
        assertEquals(error, result.errorDetailsArgument)
    }

}