import Usercentrics
import Flutter

struct RestoreUserSessionBridge : MethodBridge {

    let name: String = "restoreUserSession"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        guard let argument = call.arguments as? String else {
            result(FlutterError(code: "usercentrics_flutter_restoreUserSession_error",
                                message: "Invalid Parameter",
                                details: nil ))
            return
        }

        usercentrics.shared.restoreUserSession(controllerId: argument) { status in
            result(status.serialize())
        } onFailure: { error in
            result(FlutterError(code: "usercentrics_flutter_restoreUserSession_error",
                                message: error.localizedDescription,
                                details: nil ))
        }
    }
}
