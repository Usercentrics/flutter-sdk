import Usercentrics

struct RestoreUserSessionBridge : MethodBridge {

    let name: String = "restoreUserSession"
    let usercentricsSDK: UsercentricsSDK

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        validateAndInvoke(call, result) {
            guard let argument = call.arguments as? String else {
                result(FlutterError(code: "usercentrics_flutter_restoreUserSession_error",
                                    message: "Invalid Parameter",
                                    details: nil ))
                return
            }

            usercentricsSDK.restoreUserSession(controllerId: argument) { status in
                result(ReadyStatusSerializer().serialize(value: status))
            } onFailure: { error in
                result(FlutterError(code: "usercentrics_flutter_restoreUserSession_error",
                                    message: error.localizedDescription,
                                    details: nil ))
            }
        }
    }
}
