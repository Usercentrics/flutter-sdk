package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.GetDpsMetadataMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class GetDpsMetadataBridgeTest {

    @Test
    fun testName() {
        val instance = GetDpsMetadataBridge(FakeUsercentricsProxy())
        assertEquals("getDpsMetadata", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = GetDpsMetadataBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.getDpsMetadata(GetDpsMetadataMock.templateId) }.returns(GetDpsMetadataMock.fake)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = GetDpsMetadataBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(GetDpsMetadataMock.call, result)

        verify(exactly = 1) { usercentricsSDK.getDpsMetadata(GetDpsMetadataMock.templateId) }

        assertEquals(1, result.successCount)
        assertEquals(GetDpsMetadataMock.expected, result.successResultArgument)
    }

    @Test
    fun testInvokeReturnsNull() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.getDpsMetadata(any()) }.returns(null)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = GetDpsMetadataBridge(usercentricsProxy)
        val result = FakeFlutterResult()
        val call = FakeFlutterMethodCall(method = "getDpsMetadata", arguments = "unknownTemplate")

        instance.invoke(call, result)

        verify(exactly = 1) { usercentricsSDK.getDpsMetadata("unknownTemplate") }

        assertEquals(1, result.successCount)
        assertEquals(null, result.successResultArgument)
    }
}
