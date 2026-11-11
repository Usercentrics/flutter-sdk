package com.usercentrics.sdk.flutter.api

import com.usercentrics.sdk.BannerSettings
import com.usercentrics.sdk.UsercentricsConsentUserResponse
import com.usercentrics.sdk.models.settings.SecondLayerTab

internal class FakeUsercentricsBannerProxy(
    private val showFirstLayerAnswer: UsercentricsConsentUserResponse? = null,
    private val showSecondLayerAnswer: UsercentricsConsentUserResponse? = null,
) : UsercentricsBannerProxy {

    var showFirstLayerCount = 0
    var showFirstLayerBannerSettingsArgument: BannerSettings? = null

    override fun showFirstLayer(
        bannerSettings: BannerSettings?,
        callback: (UsercentricsConsentUserResponse?) -> Unit
    ) {
        showFirstLayerCount++
        showFirstLayerBannerSettingsArgument = bannerSettings
        callback(showFirstLayerAnswer)
    }

    var showSecondLayerCount = 0
    var showSecondLayerBannerSettingsArgument: BannerSettings? = null
    var showSecondLayerTabArgument: SecondLayerTab? = null

    override fun showSecondLayer(
        bannerSettings: BannerSettings?,
        tab: SecondLayerTab?,
        callback: (UsercentricsConsentUserResponse?) -> Unit
    ) {
        showSecondLayerCount++
        showSecondLayerBannerSettingsArgument = bannerSettings
        showSecondLayerTabArgument = tab
        callback(showSecondLayerAnswer)
    }

}