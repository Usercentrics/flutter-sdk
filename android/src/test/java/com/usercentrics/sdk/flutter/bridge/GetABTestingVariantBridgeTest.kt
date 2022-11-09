package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.GetABTestingVariantMock
import com.usercentrics.sdk.flutter.mock.GetTCFDataMock
import com.usercentrics.sdk.services.tcf.interfaces.TCFData
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class GetABTestingVariantBridgeTest {

    @Test
    fun testName() {
        val instance = GetABTestingVariantBridge(FakeUsercentricsProxy())
        assertEquals("getABTestingVariant", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = GetABTestingVariantBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.getABTestingVariant() }.returns(GetABTestingVariantMock.fake)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = GetABTestingVariantBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(GetABTestingVariantMock.call, result)

        verify(exactly = 1) { usercentricsSDK.getABTestingVariant() }

        assertEquals(1, result.successCount)
        assertEquals(GetABTestingVariantMock.expected, result.successResultArgument)
    }
}
