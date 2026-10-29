package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.*
import com.usercentrics.sdk.flutter.mock.ShowSecondLayerMock
import com.usercentrics.sdk.models.settings.SecondLayerTab
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Test

class ShowSecondLayerBridgeUnitTest {

    @Test
    fun testName() {
        val instance = ShowSecondLayerBridge(
            FakeFlutterAssetsProvider(),
            FakeFlutterActivityProvider(),
            FakeUsercentricsBannerProxy()
        )
        assertEquals("showSecondLayer", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = ShowSecondLayerBridge(
            FakeFlutterAssetsProvider(),
            FakeFlutterActivityProvider(),
            FakeUsercentricsBannerProxy()
        )
        val call = FakeFlutterMethodCall(method = "otherName", arguments = null)

        assertThrows(AssertionError::class.java) {
            instance.invoke(call, FakeFlutterResult())
        }
    }

    @Test
    fun testInvokeWithData() {
        val bannerProxy = FakeUsercentricsBannerProxy(
            showSecondLayerAnswer = ShowSecondLayerMock.fakeResponseWithData,
        )
        val instance = ShowSecondLayerBridge(
            FakeFlutterAssetsProvider(),
            FakeFlutterActivityProvider(),
            bannerProxy
        )
        val result = FakeFlutterResult()

        instance.invoke(ShowSecondLayerMock.call, result)

        assertEquals(1, bannerProxy.showSecondLayerCount)
        assertEquals(
            ShowSecondLayerMock.expectedBannerSettings,
            bannerProxy.showSecondLayerBannerSettingsArgument
        )
        assertNull(bannerProxy.showSecondLayerTabArgument)
        assertEquals(1, result.successCount)
        assertEquals(ShowSecondLayerMock.expectedWithData, result.successResultArgument)
    }

    @Test
    fun testInvokeWithTab() {
        listOf(
            "SERVICES" to SecondLayerTab.SERVICES,
            "PARTNERS" to SecondLayerTab.PARTNERS,
        ).forEach { (value, expectedTab) ->
            val bannerProxy = FakeUsercentricsBannerProxy()
            val instance = ShowSecondLayerBridge(
                FakeFlutterAssetsProvider(),
                FakeFlutterActivityProvider(),
                bannerProxy
            )

            instance.invoke(ShowSecondLayerMock.callWithTab(value), FakeFlutterResult())

            assertEquals(1, bannerProxy.showSecondLayerCount)
            assertEquals(expectedTab, bannerProxy.showSecondLayerTabArgument)
        }
    }

    @Test
    fun testInvokeWithUnknownTabFallsBackToDefault() {
        listOf("UNKNOWN", 1, null).forEach { value ->
            val bannerProxy = FakeUsercentricsBannerProxy()
            val instance = ShowSecondLayerBridge(
                FakeFlutterAssetsProvider(),
                FakeFlutterActivityProvider(),
                bannerProxy
            )

            instance.invoke(ShowSecondLayerMock.callWithTab(value), FakeFlutterResult())

            assertEquals(1, bannerProxy.showSecondLayerCount)
            assertNull(bannerProxy.showSecondLayerTabArgument)
        }
    }

    @Test
    fun testInvokeWithoutData() {
        val bannerProxy = FakeUsercentricsBannerProxy(
            showSecondLayerAnswer = ShowSecondLayerMock.fakeResponseWithoutData,
        )
        val instance = ShowSecondLayerBridge(
            FakeFlutterAssetsProvider(),
            FakeFlutterActivityProvider(),
            bannerProxy
        )
        val result = FakeFlutterResult()

        instance.invoke(ShowSecondLayerMock.call, result)

        assertEquals(1, result.successCount)
        assertEquals(ShowSecondLayerMock.expectedWithoutData, result.successResultArgument)
    }

}