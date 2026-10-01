package com.usercentrics.sdk.flutter.api

import io.flutter.plugin.common.EventChannel

/**
 * Holds the EventSinks for the Consent-or-Pay 1st-layer click events (onLoginClicked/
 * onSubscribeClicked). These fire independently of showFirstLayer's own completion callback
 * (the banner stays open), so they're modeled as persistent EventChannels rather than as part
 * of showFirstLayer's result, mirroring the existing onGppSectionChange EventChannel.
 */
internal class ConsentOrPayEventNotifier {
    var loginClickedSink: EventChannel.EventSink? = null
    var subscribeClickedSink: EventChannel.EventSink? = null

    fun onLoginClicked(url: String?) {
        loginClickedSink?.success(url)
    }

    fun onSubscribeClicked(url: String?) {
        subscribeClickedSink?.success(url)
    }
}
