import Flutter
import Usercentrics

class GppSectionChangeStreamHandler: NSObject, FlutterStreamHandler {

    private var subscription: UsercentricsDisposableEvent?

    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        subscription = UsercentricsEvent.shared.onGppSectionChange { payload in
            events(payload.serialize())
        }
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        subscription?.dispose()
        subscription = nil
        return nil
    }
}
