package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.SaveOptOutForCCPAMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class SaveOptOutForCCPABridgeTest {

    @Test
    fun testName() {
        val instance = SaveOptOutForCCPABridge(FakeUsercentricsProxy())
        assertEquals("saveOptOutForCCPA", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = SaveOptOutForCCPABridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every {
            usercentricsSDK.saveOptOutForCCPA(
                any(),
                any()
            )
        }.returns(SaveOptOutForCCPAMock.fake)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = SaveOptOutForCCPABridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(SaveOptOutForCCPAMock.call, result)

        verify(exactly = 1) {
            usercentricsSDK.saveOptOutForCCPA(
                isOptedOut = SaveOptOutForCCPAMock.callIsOptedOut,
                consentType = SaveOptOutForCCPAMock.callConsentType
            )
        }

        assertEquals(1, result.successCount)
        assertEquals(SaveOptOutForCCPAMock.expected, result.successResultArgument)
    }
}