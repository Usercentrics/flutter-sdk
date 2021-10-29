import Usercentrics

struct ResetBridge : MethodBridge {

    let name: String = "reset"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        usercentrics.reset()
        result(nil)
    }
}
