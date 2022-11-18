package com.usercentrics.sdk.flutter.api

import com.usercentrics.sdk.BannerSettings
import com.usercentrics.sdk.UsercentricsBanner
import com.usercentrics.sdk.UsercentricsConsentUserResponse

internal interface UsercentricsBannerProxy {
    fun showFirstLayer(
        bannerSettings: BannerSettings?,
        callback: (UsercentricsConsentUserResponse?) -> Unit,
    )

    fun showSecondLayer(
        bannerSettings: BannerSettings?,
        callback: (UsercentricsConsentUserResponse?) -> Unit,
    )
}

internal class UsercentricsBannerProxyImpl(
    private val activityProvider: FlutterActivityProvider,
) : UsercentricsBannerProxy {

    override fun showFirstLayer(
        bannerSettings: BannerSettings?,
        callback: (UsercentricsConsentUserResponse?) -> Unit,
    ) {
        val context = activityProvider.provide() ?: return
        UsercentricsBanner(context, bannerSettings).showFirstLayer(callback)
    }

    override fun showSecondLayer(
        bannerSettings: BannerSettings?,
        callback: (UsercentricsConsentUserResponse?) -> Unit,
    ) {
        val context = activityProvider.provide() ?: return
        UsercentricsBanner(context, bannerSettings).showSecondLayer(callback)
    }

}