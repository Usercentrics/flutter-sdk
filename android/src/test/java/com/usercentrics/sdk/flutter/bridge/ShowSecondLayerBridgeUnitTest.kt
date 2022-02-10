package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.flutter.api.*
import com.usercentrics.sdk.flutter.mock.ShowSecondLayerMock
import org.junit.Assert.assertEquals
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
            null,
            bannerProxy.showSecondLayerBannerSettingsArgument?.font
        )
        assertEquals(
            null,
            bannerProxy.showSecondLayerBannerSettingsArgument?.logo
        )
        assertEquals(
            true,
            bannerProxy.showSecondLayerShowCloseButtonArgument
        )
        assertEquals(1, result.successCount)
        assertEquals(ShowSecondLayerMock.expectedWithData, result.successResultArgument)
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