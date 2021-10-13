package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.UsercentricsServiceConsent
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

class GetConsentsBridgeUnitTest {

    companion object {
        private val mockGetConsents = listOf(
            UsercentricsServiceConsent(
                templateId = "ABC",
                status = false,
                dataProcessor = "TheProcessor",
                type = UsercentricsConsentType.EXPLICIT,
                version = "1.3.4"
            )
        )

        // Data from a real call of the debugger
        private val mockCall = FakeFlutterMethodCall(method = "getConsents", arguments = null)
        private val expectedResultPayload = listOf(
            mapOf(
                "templateId" to "ABC",
                "status" to false,
                "type" to "EXPLICIT",
                "version" to "1.3.4",
                "dataProcessor" to "TheProcessor",
            )
        )
    }

    @Test
    fun testName() {
        val instance = GetConsentsBridge(FakeUsercentricsProxy())
        assertEquals("getConsents", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = GetConsentsBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.getConsents() }.returns(mockGetConsents)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = GetConsentsBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(mockCall, result)

        verify(exactly = 1) { usercentricsSDK.getConsents() }

        assertEquals(1, result.successCount)
        assertEquals(expectedResultPayload, result.successResultArgument)
    }

}