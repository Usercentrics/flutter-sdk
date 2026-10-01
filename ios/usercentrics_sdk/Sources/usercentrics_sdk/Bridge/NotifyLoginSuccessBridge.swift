import Flutter
import Foundation

struct NotifyLoginSuccessBridge : MethodBridge {

    let name: String = "notifyLoginSuccess"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)

        usercentrics.shared.notifyLoginSuccess(onSuccess: {
            result(nil)
        }, onError: { error in
            result(FlutterError(code: "usercentrics_flutter_notifyLoginSuccess_error",
                                message: error.localizedDescription,
                                details: nil))
        })
    }
}
