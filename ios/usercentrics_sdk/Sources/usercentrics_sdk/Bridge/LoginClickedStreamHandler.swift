import Flutter

class LoginClickedStreamHandler: NSObject, FlutterStreamHandler {

    private let notifier: ConsentOrPayEventNotifier

    init(notifier: ConsentOrPayEventNotifier) {
        self.notifier = notifier
    }

    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        notifier.loginClickedSink = events
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        notifier.loginClickedSink = nil
        return nil
    }
}
