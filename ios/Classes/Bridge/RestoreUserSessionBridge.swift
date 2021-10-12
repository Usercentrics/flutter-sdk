import Usercentrics

struct RestoreUserSessionBridge : MethodBridge {

    let name: String = "restoreUserSession"

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        UsercentricsCore.shared.restoreUserSession(controllerId: call.arguments as! String) { status in
            result(ReadyStatusSerializer().serialize(value: status))
        } onFailure: { error in
            result(FlutterError(code: "usercentrics_flutter_restoreUserSession_error",
                                message: error.localizedDescription,
                                details: nil ))
        }
    }
}
