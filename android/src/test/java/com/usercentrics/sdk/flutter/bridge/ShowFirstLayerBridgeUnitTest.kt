package com.usercentrics.sdk.flutter.bridge

import com.usercentrics.sdk.PopupPosition
import com.usercentrics.sdk.UsercentricsLayout
import com.usercentrics.sdk.flutter.api.*
import com.usercentrics.sdk.flutter.mock.ShowFirstLayerMock
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class ShowFirstLayerBridgeUnitTest {

    @Test
    fun testName() {
        val instance = ShowFirstLayerBridge(
            FakeFlutterAssetsProvider(),
            FakeFlutterActivityProvider(),
            FakeUsercentricsBannerProxy()
        )
        assertEquals("showFirstLayer", instance.name)
    }

    @Test
    fun testInvokeWithOtherName() {
        val instance = ShowFirstLayerBridge(
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
            showFirstLayerAnswer = ShowFirstLayerMock.fakeResponseWithData,
        )
        val instance = ShowFirstLayerBridge(
            FakeFlutterAssetsProvider(),
            FakeFlutterActivityProvider(),
            bannerProxy
        )
        val result = FakeFlutterResult()

        instance.invoke(ShowFirstLayerMock.call, result)

        assertEquals(1, bannerProxy.showFirstLayerCount)
        assertEquals(
            ShowFirstLayerMock.expectedBannerSettings,
            bannerProxy.showFirstLayerBannerSettingsArgument
        )
        assertEquals(
            UsercentricsLayout.Popup(PopupPosition.CENTER),
            bannerProxy.showFirstLayerLayoutArgument
        )
        assertEquals(1, result.successCount)
        assertEquals(ShowFirstLayerMock.expectedWithData, result.successResultArgument)
    }

    @Test
    fun testInvokeWithoutData() {
        val bannerProxy = FakeUsercentricsBannerProxy(
            showFirstLayerAnswer = ShowFirstLayerMock.fakeResponseWithoutData,
        )
        val instance = ShowFirstLayerBridge(
            FakeFlutterAssetsProvider(),
            FakeFlutterActivityProvider(),
            bannerProxy
        )
        val result = FakeFlutterResult()

        instance.invoke(ShowFirstLayerMock.call, result)

        assertEquals(1, result.successCount)
        assertEquals(ShowFirstLayerMock.expectedWithoutData, result.successResultArgument)
    }

}