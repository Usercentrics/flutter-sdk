package com.usercentrics.sdk.flutter.api

import com.usercentrics.sdk.BannerSettings
import com.usercentrics.sdk.FirstLayerStyleSettings
import com.usercentrics.sdk.UsercentricsConsentUserResponse
import com.usercentrics.sdk.UsercentricsLayout

internal class FakeUsercentricsBannerProxy(
    private val showFirstLayerAnswer: UsercentricsConsentUserResponse? = null,
    private val showSecondLayerAnswer: UsercentricsConsentUserResponse? = null,
) : UsercentricsBannerProxy {

    var showFirstLayerCount = 0
    var showFirstLayerLayoutArgument: UsercentricsLayout? = null
    var showFirstLayerSettingsArgument: FirstLayerStyleSettings? = null
    var showFirstLayerBannerSettingsArgument: BannerSettings? = null

    override fun showFirstLayer(
        bannerSettings: BannerSettings?,
        layout: UsercentricsLayout,
        settings: FirstLayerStyleSettings?,
        callback: (UsercentricsConsentUserResponse?) -> Unit
    ) {
        showFirstLayerCount++
        showFirstLayerLayoutArgument = layout
        showFirstLayerSettingsArgument = settings
        showFirstLayerBannerSettingsArgument = bannerSettings
        callback(showFirstLayerAnswer)
    }

    var showSecondLayerCount = 0
    var showSecondLayerShowCloseButtonArgument: Boolean? = null
    var showSecondLayerBannerSettingsArgument: BannerSettings? = null

    override fun showSecondLayer(
        bannerSettings: BannerSettings?,
        showCloseButton: Boolean,
        callback: (UsercentricsConsentUserResponse?) -> Unit
    ) {
        showSecondLayerCount++
        showSecondLayerBannerSettingsArgument = bannerSettings
        showSecondLayerShowCloseButtonArgument = showCloseButton
        callback(showSecondLayerAnswer)
    }

}