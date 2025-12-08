package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.DenyAllForTCFMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert
import org.junit.Test

class DenyAllForTCFBridgeTest {

    @Test
    fun testName() {
        val instance = DenyAllForTCFBridge(FakeUsercentricsProxy())
        Assert.assertEquals("denyAllForTCF", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = DenyAllForTCFBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        Assert.assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.denyAllForTCF(any(), any(), any()) }.returns(DenyAllForTCFMock.fake)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = DenyAllForTCFBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(DenyAllForTCFMock.call, result)

        verify(exactly = 1) {
            usercentricsSDK.denyAllForTCF(
                fromLayer = DenyAllForTCFMock.callFromLayer,
                consentType = DenyAllForTCFMock.callConsentType,
                unsavedPurposeLIDecisions = null
            )
        }

        Assert.assertEquals(1, result.successCount)
        Assert.assertEquals(DenyAllForTCFMock.expected, result.successResultArgument)
    }

    @Test
    fun testInvokeWithUnsavedPurposeLIDecisions() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.denyAllForTCF(any(), any(), any()) }.returns(DenyAllForTCFMock.fake)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = DenyAllForTCFBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(DenyAllForTCFMock.callWithUnsavedPurposeLIDecisions, result)

        verify(exactly = 1) {
            usercentricsSDK.denyAllForTCF(
                fromLayer = DenyAllForTCFMock.callFromLayer,
                consentType = DenyAllForTCFMock.callConsentType,
                unsavedPurposeLIDecisions = DenyAllForTCFMock.callUnsavedPurposeLIDecisions
            )
        }

        Assert.assertEquals(1, result.successCount)
        Assert.assertEquals(DenyAllForTCFMock.expected, result.successResultArgument)
    }
}