package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.AcceptAllForTCFMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert
import org.junit.Test

class AcceptAllForTCFBridgeTest {

    @Test
    fun testName() {
        val instance = AcceptAllForTCFBridge(FakeUsercentricsProxy())
        Assert.assertEquals("acceptAllForTCF", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = AcceptAllForTCFBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        Assert.assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.acceptAllForTCF(any(), any()) }.returns(AcceptAllForTCFMock.fake)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = AcceptAllForTCFBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(AcceptAllForTCFMock.call, result)

        verify(exactly = 1) {
            usercentricsSDK.acceptAllForTCF(
                fromLayer = AcceptAllForTCFMock.callFromLayer,
                consentType = AcceptAllForTCFMock.callConsentType
            )
        }

        Assert.assertEquals(1, result.successCount)
        Assert.assertEquals(AcceptAllForTCFMock.expected, result.successResultArgument)
    }
}