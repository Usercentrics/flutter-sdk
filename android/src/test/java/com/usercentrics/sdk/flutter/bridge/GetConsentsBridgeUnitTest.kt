package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.GetConsentsMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class GetConsentsBridgeUnitTest {

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
    fun testInvokeWithData() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.getConsents() }.returns(GetConsentsMock.fakeWithData)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = GetConsentsBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(GetConsentsMock.call, result)

        verify(exactly = 1) { usercentricsSDK.getConsents() }

        assertEquals(1, result.successCount)
        assertEquals(GetConsentsMock.expectedWithData, result.successResultArgument)
    }

    @Test
    fun testInvokeWithoutData() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.getConsents() }.returns(GetConsentsMock.fakeWithoutData)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = GetConsentsBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(GetConsentsMock.call, result)

        verify(exactly = 1) { usercentricsSDK.getConsents() }

        assertEquals(1, result.successCount)
        assertEquals(GetConsentsMock.expectedWithoutData, result.successResultArgument)
    }

}