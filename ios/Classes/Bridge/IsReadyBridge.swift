import Usercentrics

struct IsReadyBridge : MethodBridge {

    let name: String = "isReady"

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        UsercentricsCore.isReady { status in
            result(ReadyStatusSerializer().serialize(value: status))
        } onFailure: { error in
                result(FlutterError(code: "usercentrics_flutter_isReady_error",
                                    message: error.localizedDescription,
                                    details: nil ))
        }
    }
}
