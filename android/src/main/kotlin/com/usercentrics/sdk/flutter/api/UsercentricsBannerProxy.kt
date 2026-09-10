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
    // Optional: only Consent-or-Pay first-layer screens ever invoke these, so a plain first-layer
    // call with no such buttons configured never touches this at all.
    private val consentOrPayEventNotifier: ConsentOrPayEventNotifier? = null,
) : UsercentricsBannerProxy {

    override fun showFirstLayer(
        bannerSettings: BannerSettings?,
        callback: (UsercentricsConsentUserResponse?) -> Unit,
    ) {
        val context = activityProvider.provide() ?: return
        UsercentricsBanner(context, bannerSettings).showFirstLayer(
            callback = callback,
            onLoginClicked = { url -> consentOrPayEventNotifier?.onLoginClicked(url) },
            onSubscribeClicked = { url -> consentOrPayEventNotifier?.onSubscribeClicked(url) },
        )
    }

    override fun showSecondLayer(
        bannerSettings: BannerSettings?,
        callback: (UsercentricsConsentUserResponse?) -> Unit,
    ) {
        val context = activityProvider.provide() ?: return
        UsercentricsBanner(context, bannerSettings).showSecondLayer(callback)
    }

}