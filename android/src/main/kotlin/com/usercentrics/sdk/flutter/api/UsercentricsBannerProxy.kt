package com.usercentrics.sdk.flutter.api

import android.content.Context
import com.usercentrics.sdk.*

internal interface UsercentricsBannerProxy {
    fun showFirstLayer(
        context: Context?,
        bannerSettings: BannerSettings?,
        layout: UsercentricsLayout,
        settings: FirstLayerStyleSettings?,
        callback: (UsercentricsConsentUserResponse?) -> Unit,
    )

    fun showSecondLayer(
        context: Context?,
        bannerSettings: BannerSettings?,
        showCloseButton: Boolean,
        callback: (UsercentricsConsentUserResponse?) -> Unit,
    )
}

internal object UsercentricsBannerProxySingleton : UsercentricsBannerProxy {

    override fun showFirstLayer(
        context: Context?,
        bannerSettings: BannerSettings?,
        layout: UsercentricsLayout,
        settings: FirstLayerStyleSettings?,
        callback: (UsercentricsConsentUserResponse?) -> Unit,
    ) {
        context ?: return

        UsercentricsBanner(context, bannerSettings).showFirstLayer(layout, settings, callback)
    }

    override fun showSecondLayer(
        context: Context?,
        bannerSettings: BannerSettings?,
        showCloseButton: Boolean,
        callback: (UsercentricsConsentUserResponse?) -> Unit,
    ) {
        context ?: return

        UsercentricsBanner(context, bannerSettings).showSecondLayer(showCloseButton, callback)
    }

}