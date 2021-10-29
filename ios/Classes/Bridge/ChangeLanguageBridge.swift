import Usercentrics

struct ChangeLanguageBridge : MethodBridge {

    let name: String = "changeLanguage"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        guard let argument = call.arguments as? String else {
            result(FlutterError(code: "usercentrics_flutter_changeLanguage_error",
                                message: "Invalid Parameter",
                                details: nil ))
            return
        }

        usercentrics.shared.changeLanguage(language: argument) {
            result(nil)
        } onFailure: { error in
            result(FlutterError(code: "usercentrics_flutter_changeLanguage_error",
                                message: error.localizedDescription,
                                details: nil ))
        }
    }
}
