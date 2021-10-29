package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.SaveDecisionsMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class SaveDecisionsBridgeTest {

    @Test
    fun testName() {
        val instance = SaveDecisionsBridge(FakeUsercentricsProxy())
        assertEquals("saveDecisions", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = SaveDecisionsBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.saveDecisions(any(), any()) }.returns(SaveDecisionsMock.fake)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = SaveDecisionsBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(SaveDecisionsMock.call, result)

        verify(exactly = 1) {
            usercentricsSDK.saveDecisions(
                decisions = SaveDecisionsMock.callDecisions,
                consentType = SaveDecisionsMock.callConsentType
            )
        }

        assertEquals(1, result.successCount)
        assertEquals(SaveDecisionsMock.expected, result.successResultArgument)
    }

}