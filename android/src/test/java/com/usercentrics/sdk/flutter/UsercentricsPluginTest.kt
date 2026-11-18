package com.usercentrics.sdk.flutter

import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import io.flutter.plugin.common.MethodCall
import org.junit.Assert.assertEquals
import org.junit.Test

class UsercentricsPluginTest {

    @Test
    fun testSetAgeSignalIsRegistered() {
        val result = FakeFlutterResult()

        // No arguments: the bridge itself refuses the call, before it reaches the native SDK
        UsercentricsPlugin().onMethodCall(MethodCall("setAgeSignal", null), result)

        assertEquals(0, result.notImplementedCount)
        assertEquals(1, result.errorCount)
        assertEquals("usercentrics_flutter_setAgeSignal_error", result.errorCodeArgument)
    }

    @Test
    fun testAnUnknownMethodIsNotImplemented() {
        val result = FakeFlutterResult()

        UsercentricsPlugin().onMethodCall(MethodCall("unknownMethod", null), result)

        assertEquals(1, result.notImplementedCount)
        assertEquals(0, result.errorCount)
    }
}
