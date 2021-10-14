import Usercentrics

struct IsReadyBridge : MethodBridge {

    let name: String = "isReady"
    let usercentricsManager: UsercentricsManagerProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        self.usercentricsManager.isReady { status in
            result(ReadyStatusSerializer().serialize(value: status))
        } onFailure: { error in
            result(FlutterError(code: "usercentrics_flutter_isReady_error",
                                message: error.localizedDescription,
                                details: nil ))
        }
    }
}
