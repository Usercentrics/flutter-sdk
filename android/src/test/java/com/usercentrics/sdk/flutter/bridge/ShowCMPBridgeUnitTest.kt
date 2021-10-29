package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.*
import com.usercentrics.sdk.flutter.mock.ShowCMPMock
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class ShowCMPBridgeUnitTest {

    @Test
    fun testName() {
        val instance = ShowCMPBridge(
            FakeFlutterAssetsProvider(),
            FakeFlutterActivityProvider(),
            FakeUsercentricsActivityProxy()
        )
        assertEquals("showCMP", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = ShowCMPBridge(
            FakeFlutterAssetsProvider(),
            FakeFlutterActivityProvider(),
            FakeUsercentricsActivityProxy()
        )
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val usercentricsActivity = FakeUsercentricsActivityProxy()
        val instance = ShowCMPBridge(
            FakeFlutterAssetsProvider(),
            FakeFlutterActivityProvider(),
            usercentricsActivity
        )
        val result = FakeFlutterResult()

        instance.invoke(ShowCMPMock.call, result)

        assertEquals(1, usercentricsActivity.startForResultCount)
        assertEquals(81420, usercentricsActivity.startForResultRequestCode)
        assertEquals(
            null,
            usercentricsActivity.startForResultSettingsArgument?.customFont
        )
        assertEquals(
            true,
            usercentricsActivity.startForResultSettingsArgument?.showCloseButton
        )
        assertEquals(
            null,
            usercentricsActivity.startForResultSettingsArgument?.customLogo
        )
    }

    @Test
    fun testOnActivityResultWithOtherCode() {
        val instance = ShowCMPBridge(
            FakeFlutterAssetsProvider(),
            FakeFlutterActivityProvider(),
            FakeUsercentricsActivityProxy()
        )
        val otherRequestCode = 123

        val consumed = instance.onActivityResult(otherRequestCode, 123, null)

        assertEquals(false, consumed)
    }

    @Test
    fun testOnActivityResultWithNoPendingResult() {
        val instance = ShowCMPBridge(
            FakeFlutterAssetsProvider(),
            FakeFlutterActivityProvider(),
            FakeUsercentricsActivityProxy()
        )

        assertThrows(AssertionError::class.java) {
            instance.onActivityResult(81420, 123, null)
        }
    }

    @Test
    fun testOnActivityResultWithPendingResultWithData() {
        val resultCode = 123
        val usercentricsActivity = FakeUsercentricsActivityProxy(
            parseResultAnswer = ShowCMPMock.fakeActivityResponseWithData
        )
        val instance = ShowCMPBridge(
            FakeFlutterAssetsProvider(),
            FakeFlutterActivityProvider(),
            usercentricsActivity
        )
        val result = FakeFlutterResult()

        // Pending result
        instance.invoke(ShowCMPMock.call, result)

        instance.onActivityResult(81420, resultCode, null)

        assertEquals(1, usercentricsActivity.parseResultCount)
        assertEquals(resultCode, usercentricsActivity.parseResultResultCodeArgument)
        assertEquals(1, result.successCount)
        assertEquals(ShowCMPMock.expectedWithData, result.successResultArgument)
    }

    @Test
    fun testOnActivityResultWithPendingResultWithoutData() {
        val resultCode = 123
        val usercentricsActivity = FakeUsercentricsActivityProxy(
            parseResultAnswer = ShowCMPMock.fakeActivityResponseWithoutData
        )
        val instance = ShowCMPBridge(
            FakeFlutterAssetsProvider(),
            FakeFlutterActivityProvider(),
            usercentricsActivity
        )
        val result = FakeFlutterResult()

        // Pending result
        instance.invoke(ShowCMPMock.call, result)

        instance.onActivityResult(81420, resultCode, null)

        assertEquals(1, usercentricsActivity.parseResultCount)
        assertEquals(resultCode, usercentricsActivity.parseResultResultCodeArgument)
        assertEquals(1, result.successCount)
        assertEquals(ShowCMPMock.expectedWithoutData, result.successResultArgument)
    }

}