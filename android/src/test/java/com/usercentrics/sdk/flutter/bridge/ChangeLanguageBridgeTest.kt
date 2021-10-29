package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.errors.UsercentricsError
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.ChangeLanguageMock
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert
import org.junit.Test

class ChangeLanguageBridgeTest {

    @Test
    fun testName() {
        val instance = ChangeLanguageBridge(FakeUsercentricsProxy())
        Assert.assertEquals("changeLanguage", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = ChangeLanguageBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        Assert.assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvokeWithSuccess() {
        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.changeLanguage(any(), any(), any()) }
            .answers() {
                (arg(1) as () -> Unit)()
            }
        val usercentricsProxy = FakeUsercentricsProxy(instanceAnswer = usercentricsSDK)
        val instance = ChangeLanguageBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(ChangeLanguageMock.call, result)

        verify(exactly = 1) {
            usercentricsSDK.changeLanguage(
                ChangeLanguageMock.callLanguage,
                any(),
                any()
            )
        }

        Assert.assertEquals(1, result.successCount)
        Assert.assertEquals(ChangeLanguageMock.expected, result.successResultArgument)
    }

    @Test
    fun testInvokeWithError() {
        val error = mockk<UsercentricsError>(relaxed = true)
        val errorMessage = "The error message"
        every { error.message }.returns(errorMessage)

        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.changeLanguage(any(), any(), any()) }
            .answers() {
                (arg(2) as (UsercentricsError) -> Unit)(error)
            }

        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = ChangeLanguageBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(ChangeLanguageMock.call, result)

        verify(exactly = 1) {
            usercentricsSDK.changeLanguage(
                ChangeLanguageMock.callLanguage,
                any(),
                any()
            )
        }

        Assert.assertEquals(1, result.errorCount)
        Assert.assertEquals(
            "usercentrics_flutter_changeLanguage_error",
            result.errorCodeArgument
        )
        Assert.assertEquals(errorMessage, result.errorMessageArgument)
        Assert.assertEquals(error, result.errorDetailsArgument)
    }
}