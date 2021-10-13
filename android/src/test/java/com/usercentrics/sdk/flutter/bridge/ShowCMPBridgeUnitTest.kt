package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsConsentUserResponse
import com.usercentrics.sdk.UsercentricsServiceConsent
import com.usercentrics.sdk.UsercentricsUISettings
import com.usercentrics.sdk.UsercentricsUserInteraction
import com.usercentrics.sdk.flutter.api.*
import com.usercentrics.sdk.models.settings.UsercentricsConsentType
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class ShowCMPBridgeUnitTest {

    companion object {
        // Data from a real call of the debugger
        private val mockCall = FakeFlutterMethodCall(
            method = "showCMP", arguments = mapOf(
                "customFont" to null,
                "showCloseButton" to true,
                "customLogo" to null
            )
        )
        private val expectedSettingsPayload = UsercentricsUISettings(
            customFont = null,
            showCloseButton = true,
            customLogo = null
        )
        private val mockActivityResponse = UsercentricsConsentUserResponse(
            consents = listOf(
                UsercentricsServiceConsent(
                    templateId = "ocv9HNX_g",
                    status = false,
                    dataProcessor = "Facebook SDK",
                    type = UsercentricsConsentType.EXPLICIT,
                    version = "1.0.1"
                )
            ),
            controllerId = "8620135313b043696b806868b20da905886a3a2598ddddc2b52973f9807d6b45",
            userInteraction = UsercentricsUserInteraction.ACCEPT_ALL
        )
        private val expectedResultPayload = mapOf(
            "controllerId" to "8620135313b043696b806868b20da905886a3a2598ddddc2b52973f9807d6b45",
            "userInteraction" to "ACCEPT_ALL",
            "consents" to listOf(
                mapOf(
                    "templateId" to "ocv9HNX_g",
                    "status" to false,
                    "type" to "EXPLICIT",
                    "version" to "1.0.1",
                    "dataProcessor" to "Facebook SDK",
                )
            )
        )
    }

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

        instance.invoke(mockCall, result)

        assertEquals(1, usercentricsActivity.startForResultCount)
        assertEquals(81420, usercentricsActivity.startForResultRequestCode)
        assertEquals(
            expectedSettingsPayload.customFont,
            usercentricsActivity.startForResultSettingsArgument?.customFont
        )
        assertEquals(
            expectedSettingsPayload.showCloseButton,
            usercentricsActivity.startForResultSettingsArgument?.showCloseButton
        )
        assertEquals(
            expectedSettingsPayload.customLogo,
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
    fun testOnActivityResultWithPendingResult() {
        val resultCode = 123
        val usercentricsActivity = FakeUsercentricsActivityProxy(
            parseResultAnswer = mockActivityResponse
        )
        val instance = ShowCMPBridge(
            FakeFlutterAssetsProvider(),
            FakeFlutterActivityProvider(),
            usercentricsActivity
        )
        val result = FakeFlutterResult()

        // Pending result
        instance.invoke(mockCall, result)

        instance.onActivityResult(81420, resultCode, null)

        assertEquals(1, usercentricsActivity.parseResultCount)
        assertEquals(resultCode, usercentricsActivity.parseResultResultCodeArgument)
        assertEquals(1, result.successCount)
        assertEquals(expectedResultPayload, result.successResultArgument)

    }

}