package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.SetGPPConsentMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class SetGPPConsentBridgeTest {

    @Test
    fun testName() {
        val instance = SetGPPConsentBridge(FakeUsercentricsProxy())
        assertEquals("setGPPConsent", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = SetGPPConsentBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every {
            usercentricsSDK.setGPPConsent(any(), any(), any())
        }.returns(Unit)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = SetGPPConsentBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(SetGPPConsentMock.call, result)

        verify(exactly = 1) {
            usercentricsSDK.setGPPConsent(
                SetGPPConsentMock.callSectionName,
                SetGPPConsentMock.callFieldName,
                SetGPPConsentMock.callValue
            )
        }

        assertEquals(1, result.successCount)
    }
}
