package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.SaveDecisionsForTCFMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class SaveDecisionsForTCFBridgeTest {

    @Test
    fun testName() {
        val instance = SaveDecisionsForTCFBridge(FakeUsercentricsProxy())
        assertEquals("saveDecisionsForTCF", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = SaveDecisionsForTCFBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.saveDecisionsForTCF(any(), any(), any(), any()) }.returns(
            SaveDecisionsForTCFMock.fake
        )
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = SaveDecisionsForTCFBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(SaveDecisionsForTCFMock.call, result)

        verify(exactly = 1) {
            usercentricsSDK.saveDecisionsForTCF(
                tcfDecisions = SaveDecisionsForTCFMock.callTCFDecisions,
                fromLayer = SaveDecisionsForTCFMock.callFromLayer,
                serviceDecisions = SaveDecisionsForTCFMock.callDecisions,
                consentType = SaveDecisionsForTCFMock.callConsentType
            )
        }

        assertEquals(1, result.successCount)
        assertEquals(SaveDecisionsForTCFMock.expected, result.successResultArgument)
    }

}