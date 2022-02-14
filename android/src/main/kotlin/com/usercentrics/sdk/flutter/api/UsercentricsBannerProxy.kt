package com.usercentrics.sdk.flutter.api

import com.usercentrics.sdk.*

internal interface UsercentricsBannerProxy {
    fun showFirstLayer(
        bannerSettings: BannerSettings?,
        layout: UsercentricsLayout,
        settings: FirstLayerStyleSettings?,
        callback: (UsercentricsConsentUserResponse?) -> Unit,
    )

    fun showSecondLayer(
        bannerSettings: BannerSettings?,
        showCloseButton: Boolean,
        callback: (UsercentricsConsentUserResponse?) -> Unit,
    )
}

internal class UsercentricsBannerProxyImpl(
    private val activityProvider: FlutterActivityProvider,
) : UsercentricsBannerProxy {

    override fun showFirstLayer(
        bannerSettings: BannerSettings?,
        layout: UsercentricsLayout,
        settings: FirstLayerStyleSettings?,
        callback: (UsercentricsConsentUserResponse?) -> Unit,
    ) {
        val context = activityProvider.provide() ?: return
        UsercentricsBanner(context, bannerSettings).showFirstLayer(layout, settings, callback)
    }

    override fun showSecondLayer(
        bannerSettings: BannerSettings?,
        showCloseButton: Boolean,
        callback: (UsercentricsConsentUserResponse?) -> Unit,
    ) {
        val context = activityProvider.provide() ?: return
        UsercentricsBanner(context, bannerSettings).showSecondLayer(showCloseButton, callback)
    }

}