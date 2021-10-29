import Usercentrics

struct IsReadyBridge : MethodBridge {

    let name: String = "isReady"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        usercentrics.isReady { status in
            result(status.serialize())
        } onFailure: { error in
            result(FlutterError(code: "usercentrics_flutter_isReady_error",
                                message: error.localizedDescription,
                                details: nil ))
        }
    }
}
