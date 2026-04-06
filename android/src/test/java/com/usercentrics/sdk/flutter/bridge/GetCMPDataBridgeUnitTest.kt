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
        val expectedSettings = resultMap["settings"] as? Map<*, *>
        assertNotNull(expectedSettings)
        assertEquals(GetCMPDataMock.expectedSettings["labels"], expectedSettings?.get("labels"))
        val tcf2 = expectedSettings?.get("tcf2") as? Map<*, *>
        assertNotNull(tcf2)
        assertEquals("Privacy Information", tcf2?.get("firstLayerTitle"))
        assertEquals("Privacy Settings Title", tcf2?.get("secondLayerTitle"))
        assertEquals(5, tcf2?.get("cmpId"))
        assertEquals(3, tcf2?.get("cmpVersion"))
        assertEquals("SERVICE", tcf2?.get("scope"))
        assertEquals(true, tcf2?.get("acmV2Enabled"))
        assertEquals(listOf(1, 2, 3, 4, 5), tcf2?.get("selectedATPIds"))
        val ccpa = expectedSettings?.get("ccpa") as? Map<*, *>
        assertNotNull(ccpa)
        assertEquals("Do not sell my personal information", ccpa?.get("optOutNoticeLabel"))
        assertEquals("OK", ccpa?.get("btnSave"))
        assertEquals(false, ccpa?.get("isActive"))
        assertEquals(GetCMPDataMock.expectedSettings["languagesAvailable"], expectedSettings?.get("languagesAvailable"))
        assertEquals(GetCMPDataMock.expectedSettings["publishedApps"], expectedSettings?.get("publishedApps"))
        assertEquals("6.0.4", expectedSettings?.get("version"))
        assertEquals("lQ_Dio7QL", expectedSettings?.get("settingsId"))
        assertEquals("ALL", expectedSettings?.get("dpsDisplayFormat"))
        assertEquals("CTDPA", expectedSettings?.get("framework"))
        assertEquals(false, expectedSettings?.get("gppSignalingEnabled"))
        assertEquals(false, expectedSettings?.get("gpcSignalHonoured"))
        assertEquals(GetCMPDataMock.expectedCategories, resultMap["categories"])
        assertEquals(GetCMPDataMock.expectedServices, resultMap["services"])
        assertEquals(GetCMPDataMock.expectedUserLocation, resultMap["userLocation"])
        assertEquals(GetCMPDataMock.expectedLegalBasisLocalization, resultMap["legalBasis"])
    }

}
