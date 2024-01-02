package com.usercentrics.sdk.flutter.bridge


import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.GetAdditionalConsentModeDataMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class GetAdditionalConsentModeDataBridgeTest {

    @Test
    fun testName() {
        val instance = GetAdditionalConsentModeDataBridge(FakeUsercentricsProxy())
        assertEquals("getAdditionalConsentModeData", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = GetAdditionalConsentModeDataBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

   @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.getAdditionalConsentModeData() }.returns(GetAdditionalConsentModeDataMock.fake)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = GetAdditionalConsentModeDataBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(GetAdditionalConsentModeDataMock.call, result)

        verify(exactly = 1) { usercentricsSDK.getAdditionalConsentModeData() }

        assertEquals(1, result.successCount)
        assertEquals(GetAdditionalConsentModeDataMock.expected, result.successResultArgument)
    }
}
