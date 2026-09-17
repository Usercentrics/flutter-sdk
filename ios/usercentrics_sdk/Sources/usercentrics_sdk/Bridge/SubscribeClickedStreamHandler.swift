import Flutter

class SubscribeClickedStreamHandler: NSObject, FlutterStreamHandler {

    private let notifier: ConsentOrPayEventNotifier

    init(notifier: ConsentOrPayEventNotifier) {
        self.notifier = notifier
    }

    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        notifier.subscribeClickedSink = events
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        notifier.subscribeClickedSink = nil
        return nil
    }
}
