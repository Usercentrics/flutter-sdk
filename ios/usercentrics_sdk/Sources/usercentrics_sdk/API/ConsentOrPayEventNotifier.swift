import Flutter

/// Holds the EventSinks for the Consent-or-Pay 1st-layer click events (onLoginClicked/
/// onSubscribeClicked). These fire independently of showFirstLayer's own completion handler
/// (the banner stays open), so they're modeled as persistent EventChannels rather than as part
/// of showFirstLayer's result, mirroring the existing onGppSectionChange EventChannel.
class ConsentOrPayEventNotifier {
    var loginClickedSink: FlutterEventSink?
    var subscribeClickedSink: FlutterEventSink?

    func onLoginClicked(_ url: String?) {
        loginClickedSink?(url)
    }

    func onSubscribeClicked(_ url: String?) {
        subscribeClickedSink?(url)
    }
}
