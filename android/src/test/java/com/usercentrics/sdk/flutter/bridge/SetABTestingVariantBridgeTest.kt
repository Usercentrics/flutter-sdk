package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.SetABTestingVariantMock
import com.usercentrics.sdk.flutter.mock.SetCMPIdMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class SetABTestingVariantBridgeTest {
    @Test
    fun testName() {
        val instance = SetABTestingVariantBridge(FakeUsercentricsProxy())
        assertEquals("setABTestingVariant", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = SetABTestingVariantBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.setABTestingVariant(any()) }.answers { }
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = SetABTestingVariantBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(SetABTestingVariantMock.call, result)

        verify(exactly = 1) {
            usercentricsSDK.setABTestingVariant(
                variant = SetABTestingVariantMock.callABTestingVariant
            )
        }

        assertEquals(1, result.successCount)
        assertEquals(SetABTestingVariantMock.expected, result.successResultArgument)
    }
}
