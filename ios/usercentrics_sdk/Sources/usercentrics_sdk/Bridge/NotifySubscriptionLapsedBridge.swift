import Flutter
import Foundation

struct NotifySubscriptionLapsedBridge : MethodBridge {

    let name: String = "notifySubscriptionLapsed"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)

        usercentrics.shared.notifySubscriptionLapsed(onSuccess: {
            result(nil)
        }, onError: { error in
            result(FlutterError(code: "usercentrics_flutter_notifySubscriptionLapsed_error",
                                message: error.localizedDescription,
                                details: nil))
        })
    }
}
