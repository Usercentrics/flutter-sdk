package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.DenyAllMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert
import org.junit.Test

class DenyAllBridgeTest {

    @Test
    fun testName() {
        val instance = DenyAllBridge(FakeUsercentricsProxy())
        Assert.assertEquals("denyAll", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = DenyAllBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        Assert.assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.denyAll(any()) }.returns(DenyAllMock.fake)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = DenyAllBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(DenyAllMock.call, result)

        verify(exactly = 1) {
            usercentricsSDK.denyAll(
                consentType = DenyAllMock.callConsentType
            )
        }

        Assert.assertEquals(1, result.successCount)
        Assert.assertEquals(DenyAllMock.expected, result.successResultArgument)
    }
}