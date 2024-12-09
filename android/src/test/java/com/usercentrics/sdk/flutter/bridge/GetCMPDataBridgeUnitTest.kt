package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.UsercentricsCMPData
import com.usercentrics.sdk.UsercentricsSDK
import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.flutter.api.FakeFlutterResult
import com.usercentrics.sdk.flutter.api.FakeUsercentricsProxy
import com.usercentrics.sdk.flutter.mock.GetCMPDataMock
import com.usercentrics.sdk.models.common.UsercentricsVariant
import com.usercentrics.sdk.v2.translation.data.LegalBasisLocalization
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertThrows
import org.junit.Test

class GetCMPDataBridgeUnitTest {

    @Test
    fun testName() {
        val instance = GetCMPDataBridge(FakeUsercentricsProxy())
        assertEquals("getCMPData", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = GetCMPDataBridge(FakeUsercentricsProxy())
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvoke() {
        val cmpData = mockk<UsercentricsCMPData>()

        val legalBasisLocalization = mockk<LegalBasisLocalization>()
        every { legalBasisLocalization.data }.returns(GetCMPDataMock.fakeData)
        every { legalBasisLocalization.labelsAria }.returns(GetCMPDataMock.fakeTranslationAriaLabels)

        every { cmpData.activeVariant }.returns(UsercentricsVariant.TCF)
        every { cmpData.settings }.returns(GetCMPDataMock.fakeSettings)
        every { cmpData.categories }.returns(GetCMPDataMock.fakeCategories)
        every { cmpData.services }.returns(GetCMPDataMock.fakeServices)
        every { cmpData.userLocation }.returns(GetCMPDataMock.fakeUserLocation)
        every { cmpData.legalBasis }.returns(legalBasisLocalization)

        val usercentricsSDK = mockk<UsercentricsSDK>()
        every { usercentricsSDK.getCMPData() }.returns(cmpData)
        val usercentricsProxy = FakeUsercentricsProxy(usercentricsSDK)
        val instance = GetCMPDataBridge(usercentricsProxy)
        val result = FakeFlutterResult()

        instance.invoke(GetCMPDataMock.call, result)

        verify(exactly = 1) { usercentricsSDK.getCMPData() }
        assertEquals(1, result.successCount)
        val resultMap = result.successResultArgument as? Map<*, *>
        assertEquals(6, resultMap?.size)
        assertEquals("TCF", resultMap?.get("activeVariant"))

        assertNotNull(resultMap!!)
        val expectedSettings = resultMap["settings"]
        assertEquals(GetCMPDataMock.expectedSettings, expectedSettings)
        assertEquals(GetCMPDataMock.expectedCategories, resultMap["categories"])
        assertEquals(GetCMPDataMock.expectedServices, resultMap["services"])
        assertEquals(GetCMPDataMock.expectedUserLocation, resultMap["userLocation"])
        assertEquals(GetCMPDataMock.expectedLegalBasisLocalization, resultMap["legalBasis"])
    }

}
