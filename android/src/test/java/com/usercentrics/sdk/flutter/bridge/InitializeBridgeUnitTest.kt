package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.FakeFlutterActivityProvider
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.models.common.UsercentricsLoggerLevel
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class InitializeBridgeUnitTest {

    companion object {
        // Data from a real call of the debugger
        private val mockCall = FakeFlutterMethodCall(
            method = "initialize",
            arguments = mapOf(
                "settingsId" to "AAAAA",
                "loggerLevel" to "DEBUG",
                "timeoutMillis" to 1000,
                "version" to "1.2.3"
            )
        )
        private val expectedResultPayload: Any? = null
    }

    @Test
    fun testName() {
        val instance = InitializeBridge(FakeFlutterActivityProvider(), FakeUsercentricsProxy())
        assertEquals("initialize", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = InitializeBridge(FakeFlutterActivityProvider(), FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = "")

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvokeWithInvalidArguments() {
        val instance = InitializeBridge(FakeFlutterActivityProvider(), FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "initialize", arguments = "")

        assertThrows(Exception::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsProxy = FakeUsercentricsProxy()
        val activityProvider = FakeFlutterActivityProvider()
        val instance = InitializeBridge(activityProvider, usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(mockCall, result)

        assertEquals(1, activityProvider.provideCount)
        assertEquals(1, usercentricsProxy.initializeCount)
        assertEquals("AAAAA", usercentricsProxy.initializeOptionsArgument?.settingsId)
        assertEquals(
            UsercentricsLoggerLevel.DEBUG,
            usercentricsProxy.initializeOptionsArgument?.loggerLevel
        )
        assertEquals(1000L, usercentricsProxy.initializeOptionsArgument?.timeoutMillis)
        assertEquals("1.2.3", usercentricsProxy.initializeOptionsArgument?.version)
        assertEquals(1, result.successCount)
        assertEquals(expectedResultPayload, result.successResultArgument)
    }

}