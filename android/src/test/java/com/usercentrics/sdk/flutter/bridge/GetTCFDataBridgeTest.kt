package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.GetTCFDataMock
import com.usercentrics.sdk.services.tcf.interfaces.TCFData
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class GetTCFDataBridgeTest {

    @Test
    fun testName() {
        val instance = GetTCFDataBridge(FakeUsercentricsProxy())
        assertEquals("getTCFData", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = GetTCFDataBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.getTCFData(any()) }.answers {
            (arg(0) as (TCFData) -> Unit)(GetTCFDataMock.fake)
        }
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = GetTCFDataBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(GetTCFDataMock.call, result)

        verify(exactly = 1) { usercentricsSDK.getTCFData(any()) }

        assertEquals(1, result.successCount)
        assertEquals(GetTCFDataMock.expected, result.successResultArgument)
    }
}
