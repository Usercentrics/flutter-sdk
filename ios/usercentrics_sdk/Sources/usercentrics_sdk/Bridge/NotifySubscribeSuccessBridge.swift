import Flutter
import Foundation

struct NotifySubscribeSuccessBridge : MethodBridge {

    let name: String = "notifySubscribeSuccess"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)

        usercentrics.shared.notifySubscribeSuccess(onSuccess: {
            result(nil)
        }, onError: { error in
            result(FlutterError(code: "usercentrics_flutter_notifySubscribeSuccess_error",
                                message: error.localizedDescription,
                                details: nil))
        })
    }
}
